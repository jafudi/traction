output "used_base_image" {
  value = module.oracle_infrastructure.source_image.display_name
}

output "email_adress" {
  value = local.email_config.address
}

locals {
  working_dir = "/Users/jens/PycharmProjects/traction"
}

output "ssh_into_desktop_1" {
  value = "ssh -i ${local.working_dir}/.ssh/privkey -o StrictHostKeyChecking=no ${local.desktop_username}@${module.desktop_machine_1.public_ip}"
}

output "private_key" {
  value = module.shared_secrets.vm_mutual_key.private_key_pem
}

output "gateway_config_size" {
  value = "${local.unzipped_gateway_bytes} base64gzip to ${length(local.encoded_gateway_config)} / 16384 bytes maximum"
}

output "desktop_config_size" {
  value = "${local.unzipped_desktop_bytes} base64gzip to ${length(local.encoded_desktop_config)} / 16384 bytes maximum"
}

output "access_via_browser" {
  value = "https://${module.certified_hostname.full_hostname}/?password=${urlencode(local.murmur_config.password)}"
}

output "access_via_mumble" {
  value = "mumble://:${urlencode(local.murmur_config.password)}@${module.certified_hostname.full_hostname}:${local.murmur_config.port}"
}