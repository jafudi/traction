data "terraform_remote_state" "main" {
  backend = "remote"
  config = {
    organization = var.organization_name
    workspaces = {
      name = var.parent_workspace_name
    }
  }
}
locals {
  gateway_username      = data.terraform_remote_state.main.outputs.gateway_username
  first_vnc_connection  = data.terraform_remote_state.main.outputs.first_vnc_credentials
  guacamole_credentials = data.terraform_remote_state.main.outputs.guacamole_credentials
}
provider "guacamole" {
  url                      = "https://${data.terraform_remote_state.main.outputs.gateway_ip}/guacamole"
  username                 = local.guacamole_credentials.guacamole_admin_username
  password                 = local.guacamole_credentials.guacamole_admin_password
  disable_tls_verification = true
  disable_cookies          = true
}

resource "guacamole_connection_vnc" "collaborate" {
  name              = "Collaborate: ${local.first_vnc_connection.title}"
  parent_identifier = "ROOT"
  attributes {
    failover_only = false
  }
  parameters {
    hostname              = local.first_vnc_connection.hostname
    port                  = local.first_vnc_connection.vnc_port
    username              = local.first_vnc_connection.username
    password              = local.first_vnc_connection.password
    sftp_enable           = true
    sftp_hostname         = "gateway"
    sftp_username         = local.gateway_username
    sftp_upload_directory = "/home/${local.gateway_username}/uploads"
    sftp_root_directory   = "/home/${local.gateway_username}/uploads"
    readonly              = false
    enable_audio          = false
    disable_copy          = false
    disable_paste         = false
  }
}

resource "guacamole_connection_vnc" "view_only" {
  name              = "View only: ${local.first_vnc_connection.title}"
  parent_identifier = "ROOT"
  attributes {
    failover_only = false
  }
  parameters {
    hostname              = local.first_vnc_connection.hostname
    port                  = local.first_vnc_connection.vnc_port
    username              = local.first_vnc_connection.username
    password              = local.first_vnc_connection.password
    sftp_enable           = false
    sftp_hostname         = "gateway"
    sftp_username         = local.gateway_username
    sftp_upload_directory = "/home/${local.gateway_username}/uploads"
    sftp_root_directory   = "/home/${local.gateway_username}/uploads"
    readonly              = true
    enable_audio          = false
    disable_copy          = true
    disable_paste         = true
  }
}

resource "guacamole_connection_ssh" "admin_console" {
  name              = "Administrate: Gateway Terminal"
  parent_identifier = "ROOT"
  attributes {
    failover_only = false
  }
  parameters {
    hostname            = "gateway"
    port                = 22
    username            = local.gateway_username
    sftp_root_directory = "/home/${local.gateway_username}/uploads"
    readonly            = false
    sftp_enable         = true
    color_scheme        = var.ssh_color_scheme
  }
}

resource "guacamole_user_group" "initial_users" {
  identifier = "initial"
  connections = [
    guacamole_connection_vnc.collaborate.id,
    guacamole_connection_vnc.view_only.id,
    guacamole_connection_ssh.admin_console.id
  ]
}
