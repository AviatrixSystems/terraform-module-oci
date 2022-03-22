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

#Variables declared in this file must be declared in the marketplace.yaml

############################
#  Hidden Variable Group   #
############################
variable "tenancy_ocid" {
}

variable "region" {
}

variable "mp_listing_id" {
  default = "ocid1.appcataloglisting.oc1..aaaaaaaawdptz5o42tuhg62defjimphzuck4fbrz4cilez2mle3bcs5t22wa"
}

variable "mp_listing_resource_id" {
  default = "ocid1.image.oc1..aaaaaaaams7arhiyikfhpvo2kj35ky76csllxdnzijqw6ves4a5saaj63mva"
}

variable "mp_listing_resource_version" {
  default = "6.3.0"
}

############################
#  Compute Configuration   #
############################

variable "vm_display_name" {
  description = "Instance Name"
  default     = "controller"
}

variable "vm_compute_shape" {
  description = "Compute Shape"
  default     = "VM.Standard2.2" //2 cores
}

variable "availability_domain" {
  default     = 1
  description = "OCI Availability Domains: 1,2,3  (subject to region availability)"
}

variable "ssh_public_key" {
  description = "SSH Public Key"
}

############################
#  Network Configuration   #
############################

variable "network_strategy" {
  default = "Create New VCN and Subnet"
}

variable "vcn_id" {
  default = ""
}

variable "vcn_display_name" {
  description = "VCN Name"
  default     = "aviatrix-vcn"
}

variable "vcn_cidr_block" {
  description = "VCN CIDR"
  default     = "10.0.0.0/16"
}

variable "vcn_dns_label" {
  description = "VCN DNS Label"
  default     = "aviatrix"
}

variable "subnet_type" {
  description = "Choose between private and public subnets"
  default     = "Use Public Subnet"
}

variable "subnet_span" {
  description = "Choose between regional and AD specific subnets"
  default     = "Regional Subnet"
}

variable "subnet_id" {
  default = ""
}

variable "subnet_display_name" {
  description = "Subnet Name"
  default     = "controller-subnet"
}

variable "subnet_cidr_block" {
  description = "Subnet CIDR"
  default     = "10.0.0.0/24"
}

variable "subnet_dns_label" {
  description = "Subnet DNS Label"
  default     = "management"
}

############################
# Additional Configuration #
############################

variable "compartment_ocid" {
  description = "Compartment where infrastructure resources will be created"
}

variable "nsg_whitelist_ip" {
  description = "Network Security Groups - A list of whitelisted CIDR blocks for ingress HTTPS communication"
  type = list(string)
}

variable "nsg_display_name" {
  description = "Network Security Groups - Name"
  default     = "controller-security-group"
}

variable "routetable_display_name" {
  description = "Route table Name"
  default     = "controller-route-table"
}
