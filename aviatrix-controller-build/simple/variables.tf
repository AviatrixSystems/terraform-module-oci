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

# Variables required by the OCI Provider
variable "tenancy_ocid" {
}

variable "user_ocid" {
}

variable "fingerprint" {
}

variable "region" {
}

variable "private_key_path" {
}

variable "ssh_public_key" {
}

variable "vm_depends_on" {
  type    = any
  default = null
}

# Variables required for launching Aviatrix Controller
variable "compartment_ocid" {
  description = "Compartment where infrastructure resources will be created"
}

variable "license_model" {
  description = "Enter Marketplace License model = BYOL or PAID"
}

variable "product_version" {
  default     = "5.0.1"
  description = "Aviatrix Controller Version available in the Marketplace"
}

# Standard OCI Variables for Compute and Networking Resources
variable "availability_domain" {
  default     = 1
  description = "OCI Availability Domains: 1,2,3  (subject to region availability)"
}

variable "vm_display_name" {
  default = "controller"
}

variable "vm_compute_shape" {
  default = "VM.Standard2.2" //2 cores
}

variable "vcn_display_name" {
  default = "aviatrix-vcn"
}

variable "vcn_dns_label" {
  default = "aviatrix"
}

variable "vcn_cidr_block" {
  default = "10.0.0.0/16"
}

variable "routetable_display_name" {
  default = "controller-route-table"
}

variable "subnet_display_name" {
  default = "controller-subnet"
}

variable "subnet_cidr_block" {
  default = "10.0.0.0/24"
}

variable "subnet_dns_label" {
  default = "management"
}

variable "nsg_display_name" {
  default = "controller-sec-group"
}

variable "nsg_whitelist_ip" {
  type        = list(string)
  description = "Network Security Groups - list of whitelisted CIDR blocks for ingress https"
}

