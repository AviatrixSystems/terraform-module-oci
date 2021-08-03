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

# VCN comes with default route table, security list and DHCP options

resource "oci_core_vcn" "vcn" {
  count          = var.use_existing_network ? 0:1
  cidr_block     = var.vcn_cidr_block
  dns_label      = var.vcn_dns_label
  compartment_id = var.compartment_ocid
  display_name   = var.vcn_display_name
}

resource "oci_core_internet_gateway" "igw" {
  count          = var.use_existing_network ? 0:1
  compartment_id = var.compartment_ocid
  display_name   = var.igw_display_name
  vcn_id         = oci_core_vcn.vcn[count.index].id
}

resource "oci_core_default_route_table" "default_route_table" {
  count          = var.use_existing_network ? 0:1
  manage_default_resource_id = oci_core_vcn.vcn[count.index].default_route_table_id

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.igw[count.index].id
  }
}


resource "oci_core_subnet" "public_subnet" {
  count          = var.use_existing_network ? 0:1
  compartment_id             = var.compartment_ocid
  vcn_id                     = oci_core_vcn.vcn[count.index].id
  cidr_block                 = var.subnet_cidr_block
  display_name               = var.subnet_display_name
  route_table_id             = oci_core_vcn.vcn[count.index].default_route_table_id
  dns_label                  = var.subnet_dns_label
  prohibit_public_ip_on_vnic = "false"
}

