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

## Subscribe to Marketplace listing
module "marketplace" {
  source          = "github.com/AviatrixSystems/terraform-module-oci.git//aviatrix-controller-build/terraform-modules/marketplace"
  compartment_id  = var.compartment_ocid
  product_version = var.product_version
  license_model   = var.license_model //BYOL or PAID
  subscribe       = true
}

## Creates a VCN with a public subnet and default IGW and Route Table
module "default_vcn_plus_subnet" {
  source              = "github.com/AviatrixSystems/terraform-module-oci.git//aviatrix-controller-build/terraform-modules/vcn-plus-subnet-default"
  compartment_ocid    = var.compartment_ocid
  vcn_display_name    = var.vcn_display_name
  vcn_cidr_block      = var.vcn_cidr_block
  vcn_dns_label       = var.vcn_dns_label
  subnet_display_name = var.subnet_display_name
  subnet_cidr_block   = var.subnet_cidr_block
  subnet_dns_label    = var.subnet_dns_label
}

## Allow Ingress HTTPS from 
module "default_network_sec_group" {
  source           = "github.com/AviatrixSystems/terraform-module-oci.git//aviatrix-controller-build/terraform-modules/network-security-groups"
  compartment_ocid = var.compartment_ocid
  nsg_display_name = var.nsg_display_name
  nsg_whitelist_ip = var.nsg_whitelist_ip
  vcn_id           = module.default_vcn_plus_subnet.vcn_id
  vcn_cidr_block   = var.vcn_cidr_block
}

data "oci_identity_availability_domain" "ad" {
  compartment_id = var.tenancy_ocid
  ad_number      = var.availability_domain
}

resource "oci_core_instance" "simple-vm" {
  depends_on = [module.marketplace]

  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compartment_ocid
  display_name        = var.vm_display_name
  shape               = var.vm_compute_shape

  create_vnic_details {
    subnet_id        = module.default_vcn_plus_subnet.subnet_id
    display_name     = var.vm_display_name
    assign_public_ip = true
    nsg_ids          = [module.default_network_sec_group.nsg_id]
  }

  source_details {
    source_type = "image"
    source_id   = module.marketplace.marketplace_resource_id
  }
}

