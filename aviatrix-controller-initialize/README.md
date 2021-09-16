## Aviatrix - Terraform Modules OCI - Initialize Aviatrix Controller 

### Description

This Terraform module initializes a newly created Aviatrix Controller.

### Usage

``` terraform
module "aviatrix_controller_initialize" {
  source                        = "github.com/AviatrixSystems/terraform-module-oci.git//aviatrix-controller-initialize"
  avx_controller_public_ip      = "<< public ip address of the Aviatrix Controller >>"
  avx_controller_private_ip     = "<< private ip address of the Aviatrix Controller >>"
  avx_controller_admin_email    = "<< admin email address for the Aviatrix Controller >>"
  avx_controller_admin_password = "<< admin password for the Aviatrix Controller >>"
  oci_tenancy_id                = "<< tenancy ocid >>"
  oci_user_id                   = "<< user ocid >>"
  oci_compartment_id            = "<< compartment ocid >>"
  oci_api_key_path              = "<< private key path >>"
  account_email                 = "<< email address for the access account >>"
  access_account_name           = "<< account name mapping to the Oracle account >>"
  aviatrix_customer_id          = "<< customer license id >>"
  controller_version            = "<< desired controller version. defaults to 'latest' >>"
}
```

### Variables

- **avx_controller_public_ip**

  Aviatrix controller public IP address.

- **avx_controller_private_ip**

  Aviatrix controller private IP address.

- **avx_controller_admin_email**

  Aviatrix controller admin email address.

- **avx_controller_admin_password**

  Aviatrix controller admin password.

- **oci_tenancy_id**

  Tenancy OCID.

- **oci_user_id**

  User OCID.

- **oci_compartment_id**

  Compartment OCID.

- **oci_api_key_path**

  API key file path.

- **account_email**

  Aviatrix controller access account email.

- **access_account_name**

  Aviatrix controller access account name.

- **aviatrix_customer_id**

  Aviatrix customer license id".

- **controller_version**

  Aviatrix Controller version. Default value: "latest".
