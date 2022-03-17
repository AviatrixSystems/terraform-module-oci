## Aviatrix - Terraform Modules OCI - Build Aviatrix Controller

### Description

This Terraform module creates an Aviatrix Controller and related components in OCI.

### Usage:

To create an Aviatrix Controller:

```
module "aviatrix_controller_build" {
  source           = "github.com/AviatrixSystems/terraform-module-oci.git//aviatrix-controller-build/simple"
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
```

### Variables

- **tenancy_ocid**

  Tenancy OCID.

- **compartment_ocid**

  Compartment OCID.

- **user_ocid**

  User OCID.

- **fingerprint** 

  Fingerprint of the public key.

- **ssh_public_key**

  Public key file path.

- **private_key_path**

  Private key file path.

- **region**

  Region.

- **license_model**

  Marketplace license model: "BYOL" or "PAID"

- **nsg_whitelist_ip**

  List of whitelisted CIDR blocks for ingress communication.

- **product_version**

  Aviatrix Controller Version available in the Marketplace. Default value: "6.3.0".

- **availability_domain**

  OCI Availability Domains: 1,2,3 (subject to region availability). Default value: 1.

- **vm_display_name**

  VM display name. Default value: "controller".

- **vm_compute_shape**

  VM compute shape. Default value: "VM.Standard2.2".

- **vcn_display_name**

  VCN display name. Default value: "aviatrix-vcn".

- **vcn_dns_label**

  VCN DNS label. Default value: "aviatrix".

- **vcn_cidr_block**

  VCN CIDR block. Default value: "10.0.0.0/16".

- **routetable_display_name**

  Route table display name. Default value: "controller-route-table".

- **subnet_display_name**

  Subnet display name. Default value: "controller-subnet".

- **subnet_cidr_block**

  Subnet CIDR block. Default value: "10.0.0.0/24".

- **subnet_dns_label**

  Subnet DNS label. Default value: "management".

- **nsg_display_name**

  Network security group display name. Default value: "controller-sec-group".

### Outputs

- **aviatrix_controller_public_ip**

  Controller public IP.

- **aviatrix_controller_private_ip**

  Controller private IP.

- **aviatrix_controller_url**

  Controller URL.
  