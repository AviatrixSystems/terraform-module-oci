module "aviatrix_controller_build" {
  source             = "github.com/AviatrixSystems/terraform-module-oci.git//aviatrix-controller-build"
  tenancy_ocid       = "<< tenancy ocid >>"
  compartment_ocid   = "<<  compartment ocid  >>"
  user_ocid          = "<<  user ocid  >>"
  fingerprint        = "<<  fingerprint  >>"
  ssh_public_key     = "<<  ssh public key path  >>"
  private_key_path   = "<<  private key path  >>"
  license_model      = "<<  BYOL or PAID  >>"
  region             = "<<  controller region  >>"
  incoming_ssl_cidrs = ["<<  CIDR_1 allowed for HTTPS access  >>"]
}

module "aviatrix_controller_initialize" {
  source                        = "github.com/AviatrixSystems/terraform-module-oci.git//aviatrix-controller-initialize"
  avx_controller_public_ip      = module.aviatrix_controller_build.aviatrix_controller_public_ip
  avx_controller_private_ip     = module.aviatrix_controller_build.aviatrix_controller_private_ip
  avx_controller_admin_email    = "<<  admin email address for the Aviatrix Controller  >>"
  avx_controller_admin_password = "<<  admin password for the Aviatrix Controller  >>"
  oci_tenancy_id                = "<<  tenancy ocid  >>"
  oci_user_id                   = "<<  user ocid  >>"
  oci_compartment_id            = "<<  compartment ocid  >>"
  oci_api_key_path              = "<<  private key path  >>"
  account_email                 = "<<  email address for the access account  >>"
  access_account_name           = "<<  account name mapping to the Oracle account  >>"
  aviatrix_customer_id          = "<<  customer license id  >>"
  controller_version            = "<< desired controller version. defaults to 'latest' >>"
}


output "aviatrix_controller_public_ip" {
  value = module.aviatrix_controller_build.aviatrix_controller_public_ip
}

output "aviatrix_controller_private_ip" {
  value = module.aviatrix_controller_build.aviatrix_controller_private_ip
}

output "aviatrix_controller_url" {
  value = module.aviatrix_controller_build.aviatrix_controller_url
}


