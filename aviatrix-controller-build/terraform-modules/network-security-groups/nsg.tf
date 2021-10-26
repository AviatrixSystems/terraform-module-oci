#  Copyright 2019, 2021 Aviatrix Systems, Inc.
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

resource "oci_core_network_security_group" "nsg" {
  #Required
  compartment_id = var.compartment_ocid
  vcn_id         = var.vcn_id

  #Optional
  display_name = var.nsg_display_name
}

resource "oci_core_network_security_group_security_rule" "rule_egress_all" {
  network_security_group_id = oci_core_network_security_group.nsg.id

  direction   = "EGRESS"
  protocol    = "all"
  destination = "0.0.0.0/0"
}

resource "oci_core_network_security_group_security_rule" "rule_ingress_tcp443" {
  count                     = length(var.nsg_whitelist_ip)
  network_security_group_id = oci_core_network_security_group.nsg.id
  protocol                  = "6"
  direction                 = "INGRESS"
  source                    = var.nsg_whitelist_ip[count.index]
  stateless                 = false

  tcp_options {
    destination_port_range {
      min = 443
      max = 443
    }
  }
}
