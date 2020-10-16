variable "desktop_shape" {}

variable "gitlab_runner_token" {}

resource "oci_core_instance" "desktop" {
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = oci_identity_compartment.client_workspace.id
  display_name        = "desktop"
  shape               = var.desktop_shape

  create_vnic_details {
    subnet_id        = oci_core_subnet.desktop_subnet.id
    display_name     = "eth0"
    assign_public_ip = true
    hostname_label   = "desktop"
  }

  source_details {
    source_type = "image" # Ubuntu-20.04-Minimal
    source_id   = data.oci_core_images.ubuntu-20-04-minimal.images.0.id
  }

  metadata = {
    ssh_authorized_keys = tls_private_key.vm_mutual_key.public_key_openssh
    user_data           = data.cloudinit_config.desktop_config.rendered
    gitlab_runner_token = var.gitlab_runner_token
  }

  agent_config {
    is_management_disabled = true
    is_monitoring_disabled = true
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    port        = 22
    user        = "ubuntu"
    private_key = tls_private_key.vm_mutual_key.private_key_pem
  }

  provisioner "remote-exec" {
    scripts = [
      "${local.script_dir}/common/disable-upgrades.sh",
      "${local.script_dir}/common/sshd.sh",
      "${local.script_dir}/desktop/networking.sh",
      "${local.script_dir}/common/sudoers.sh",
      "${local.script_dir}/desktop/lubuntu-desktop.sh",
      "${local.script_dir}/desktop/lxqt-look-and-feel.sh",
      "${local.script_dir}/desktop/multiple-languages.sh",
      "${local.script_dir}/desktop/podcasts-and-videos.sh",
      "${local.script_dir}/desktop/resource-monitor.sh",
      "${local.script_dir}/desktop/mumble-pulseaudio.sh",
      "${local.script_dir}/desktop/desktop-sharing.sh",
      "${local.script_dir}/desktop/edu-games.sh",
      "${local.script_dir}/desktop/mindmap-notes.sh",
      "${local.script_dir}/desktop/office-applications.sh"
    ]
  }

  provisioner "file" {
    content     = tls_private_key.vm_mutual_key.private_key_pem
    destination = "/home/ubuntu/.ssh/vm_key"
  }

  provisioner "file" {
    source      = "packer-desktop/vartmp-uploads/desktop/"
    destination = "/var/tmp"
  }

  provisioner "file" {
    source      = "packer-desktop/desktop-home-uploads/"
    destination = "/home/ubuntu/uploads"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo touch /etc/.terraform-complete",
      "sudo cloud-init clean --logs",
      "sudo shutdown -r +1"
    ]
  }

}

output "desktop" {
  value = "${oci_core_instance.desktop.public_ip} in data center ${data.oci_identity_availability_domain.ad.name}"
}
