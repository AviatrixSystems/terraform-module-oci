# OCI Aviatrix - Terraform Module

## Descriptions
This Terraform module allows you to launch the Aviatrix Controller and create the Aviatrix access account connecting to the existing Controller on OCI.

## Prerequisites
1. [Terraform 0.13](https://www.terraform.io/downloads.html) - execute terraform files
2. [Python3](https://www.python.org/downloads/) - execute `aviatrix_controller_init.py` python script

## Available Modules
Module  | Description |
| ------- | ----------- |
|[aviatrix_controller_build](./aviatrix-controller-build) |Builds the Aviatrix Controller VM on OCI <br />[Source Code] https://github.com/oracle-quickstart/oci-aviatrix|
|[aviatrix_controller_initialize](./aviatrix-controller-initialize) | Initializes the Aviatrix Controller (setting admin email, setting admin password, upgrading controller version, and setting access account) <br />[Source Code] https://github.com/AviatrixSystems/terraform-module-azure|


## Procedures for Building and Initializing a Controller in OCI
### 1. Create the Python virtual environment and install required dependencies in the terminal
``` shell
 python3 -m venv venv
```
This command will create the virtual environment. In order to use the virtual environment, it needs to be activated by the following command
``` shell
 source venv/bin/activate
```
In order to run `aviatrix_controller_init.py` python script, dependencies listed in `requirements.txt` need to be stalled by the following command
``` shell
 pip install -r requirements.txt
```

### 2. Build the Controller VM on OCI

**build_controller.tf**
```
module "aviatrix_controller_build" {
  source           = "github.com/AviatrixSystems/terraform-module-oci.git//aviatrix-controller-build"
  tenancy_ocid     = "<< tenancy ocid >>"
  compartment_ocid = "<< compartment ocid >>"
  user_ocid        = "<< user ocid >>"
  fingerprint      = "<< fingerprint >>"
  ssh_public_key   = "<< ssh public key path >>"
  private_key_path = "<< private key path >>"
  license_model    = "<< BYOL or PAID >>"
  region           = "<< controller region >>"
  nsg_whitelist_ip = ["<< CIDR_1 allowed for HTTPS access >>", "<< CIDR_2 allowed for HTTPS access >>", ...]
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
```
*Execute*
```shell
cd aviatrix-controller-build
terraform init
terraform apply
cd ..
```
### 3. Initialize the Controller

**controller_init.tf**
```
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
*Execute*
```shell
cd aviatrix-controller-initialize
terraform init
terraform apply
cd ..
```

### Putting it all together
The controller buildup and initialization can be done using a single terraform file.
```
module "aviatrix_controller_build" {
  source           = "github.com/AviatrixSystems/terraform-module-oci.git//aviatrix-controller-build"
  tenancy_ocid     = "<< tenancy ocid >>"
  compartment_ocid = "<< compartment ocid >>"
  user_ocid        = "<< user ocid >>"
  fingerprint      = "<< fingerprint >>"
  ssh_public_key   = "<< ssh public key path >>"
  private_key_path = "<< private key path >>"
  license_model    = "<< BYOL or PAID >>"
  region           = "<< controller region >>"
  nsg_whitelist_ip = ["<< CIDR_1 allowed for HTTPS access >>", "<< CIDR_2 allowed for HTTPS access >>", ...]
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

module "aviatrix_controller_initialize" {
  source                        = "github.com/AviatrixSystems/terraform-module-oci.git//aviatrix-controller-initialize"
  avx_controller_public_ip      = module.aviatrix_controller_build.aviatrix_controller_public_ip
  avx_controller_private_ip     = module.aviatrix_controller_build.aviatrix_controller_private_ip
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
*Execute*
```shell
terraform init
terraform apply
```