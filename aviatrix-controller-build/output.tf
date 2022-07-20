output "aviatrix_controller_public_ip" {
  value = oci_core_instance.simple-vm.public_ip
}

output "aviatrix_controller_private_ip" {
  value = oci_core_instance.simple-vm.private_ip
}

output "aviatrix_controller_url" {
  value = "https://${oci_core_instance.simple-vm.public_ip}"
}