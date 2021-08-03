#  Copyright 2019 Aviatrix Systems, Inc.
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


output "vcn_id" {
  value = !var.use_existing_network ? join("", oci_core_vcn.vcn.*.id) : var.vcn_id
}

// output "default_dhcp_options_id" {
//   value = join("", oci_core_vcn.vcn.*.default_dhcp_options_id)
// }

// output "default_security_list_id" {
//   value = join("", oci_core_vcn.vcn.*.default_security_list_id)
// }

output "subnet_id" {
  value = !var.use_existing_network ? join("", oci_core_subnet.public_subnet.*.id) : var.subnet_id
}

output "vcn_cidr_block" {
  value = !var.use_existing_network ? join("", oci_core_vcn.vcn.*.cidr_block) : var.vcn_cidr_block
}


