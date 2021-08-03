#  Copyright 2021 Aviatrix Systems, Inc.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

output "aviatrix_controller_public_ip" {
  value = oci_core_instance.simple-vm.public_ip
}

output "aviatrix_controller_private_ip" {
  value = oci_core_instance.simple-vm.private_ip
}

output "aviatrix_controller_url" {
  value = "https://${oci_core_instance.simple-vm.public_ip}"
}

output "aviatrix_controller_tenancy_id" {
  value = var.tenancy_ocid
}

output "aviatrix_controller_compartment_id" {
  value = var.compartment_ocid
}

output "aviatrix_controller_user_id" {
  value = var.user_ocid
}

output "aviatrix_controller_api_key_path" {
  value = var.private_key_path
}