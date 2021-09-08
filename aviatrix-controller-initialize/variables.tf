#  Copyright 2020, 2021 Aviatrix Systems, Inc.
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

variable "avx_controller_public_ip" {
  type        = string
  description = "aviatrix controller public ip address(required)"
}

variable "avx_controller_private_ip" {
  type        = string
  description = "aviatrix controller private ip address(required)"
}

variable "avx_controller_admin_email" {
  type        = string
  description = "aviatrix controller admin email address"
}

variable "avx_controller_admin_password" {
  type        = string
  description = "aviatrix controller admin password"
}

variable "oci_tenancy_id" {
  type        = string
  description = "OCI tenancy id"
}

variable "oci_user_id" {
  type        = string
  description = "OCI user id"
}

variable "oci_compartment_id" {
  type        = string
  description = "OCI compartment id"
}

variable "oci_api_key_path" {
  type        = string
  description = "OCI api key path"
}

variable "account_email" {
  type        = string
  description = "aviatrix controller access account email"
}

variable "access_account_name" {
  type        = string
  description = "aviatirx controller access account name"
}

variable "aviatrix_customer_id" {
  type        = string
  description = "aviatrix customer license id"
}

variable "controller_version" {
  type        = string
  description = "Aviatrix Controller version"
  default     = "latest"
}
