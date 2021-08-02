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

variable "compartment_ocid" {
}

variable "vcn_cidr_block" {
  default = ""
}

variable "vcn_dns_label" {
  default = "vcn"
}

variable "vcn_display_name" {
  default = "vcn"
}

variable "igw_display_name" {
  default = "internet-gateway"
}

variable "subnet_cidr_block" {
}

variable "subnet_display_name" {
  default = "subnet"
}

variable "subnet_dns_label" {
  default = "subnet"
}

variable "use_existing_network" {
  type = bool
  default = false
}

variable "vcn_id" {  
  default = ""
}

variable "subnet_id" {
  default = ""
}
