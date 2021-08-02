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

locals {
  enabled                  = var.enabled
  listing_id               = var.license_model == "BYOL" ? var.mp_listings["BYOL"] : var.mp_listings["PAID"]
  listing_resource_version = var.license_model == "BYOL" ? var.mp_byol_versions[var.product_version] : var.mp_paid_versions[var.product_version]
  listing_resource_id      = var.license_model == "BYOL" ? var.mp_byol_listing_resource_id[var.mp_byol_versions[var.product_version]] : var.mp_paid_listing_resource_id[var.mp_paid_versions[var.product_version]]
}