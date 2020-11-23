output "network_config" {
  value = {
    subnet_id = aws_subnet.public_subnet.id
    vpc_security_group_ids = []
  }
}

//output "tenancy_name" {
//  value = data.oci_identity_tenancy.te.name
//}
//
//output "compartment" {
//  value = oci_identity_compartment.one_per_subdomain
//}

output "source_image" {
  value = data.aws_ami.latest-ubuntu-focal
}

//output "availability_domain_name" {
//  value = data.oci_identity_availability_domain.ad.name
//}

output "minimum_viable_shape" {
  value = "t2.micro"
}