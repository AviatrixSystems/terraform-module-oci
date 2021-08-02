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

# Retrieve Marketplace listing Data
module "image_listing" {
  source          = "./listings"
  enabled         = var.enabled
  product_version = var.product_version
  license_model   = var.license_model //BYOL or PAID
}

## Subscribe to Marketplace listing
module "subscribe_to_listing" {
  source                      = "./subscription"
  enabled                     = var.subscribe
  compartment_id              = var.compartment_id
  mp_listing_id               = module.image_listing.listing_id
  mp_listing_resource_id      = module.image_listing.listing_resource_id
  mp_listing_resource_version = module.image_listing.listing_resource_version
}
