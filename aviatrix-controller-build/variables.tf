variable "mp_listings" {
  type = map(string)
  description = "Aviatrix Controller Marketplace listing IDs."
  default = {
    "PAID" = "ocid1.appcataloglisting.oc1..aaaaaaaawdptz5o42tuhg62defjimphzuck4fbrz4cilez2mle3bcs5t22wa"
    "BYOL" = "ocid1.appcataloglisting.oc1..aaaaaaaavalzcaxbs4hwta4uefnkdh7fjgd3uuw7lwlk6pn2uvzglrn3zt2a"
  }
}

variable "mp_byol_versions" {
  type = map(string)
  description = "Marketplace BYOL Version."
  default = {
    "6.3.0" = "6.3.1"
  }
}

variable "mp_paid_versions" {
  type = map(string)
  description = "Marketplace PAID Version."
  default = {
    "6.3.0" = "6.3"
  }
}

variable "mp_byol_listing_resource_id" {
  type = map(string)
  description = "Marketplace BYOL listing resource id."
  default = {
    "6.3.1" = "ocid1.image.oc1..aaaaaaaawyzirrayoeo5ivzkf57texkiu44ytnfifkmzry2xm5uu4otfk7cq"
  }
}

variable "mp_paid_listing_resource_id" {
  type = map(string)
  description = "Marketplace PAID listing resource id."
  default = {
    "6.3" = "ocid1.image.oc1..aaaaaaaams7arhiyikfhpvo2kj35ky76csllxdnzijqw6ves4a5saaj63mva"
  }
}

variable "product_version" {
  type        = string
  description = "Aviatrix Controller Version available in the Marketplace."
  default     = "6.3.0"
}

variable "enabled" {
  type        = bool
  description = "Enable local values."
  default     = true
}

variable "use_existing_network" {
  type        = bool
  description = "Use exist network."
  default     = false
}

variable "vcn_cidr_block" {
  type        = string
  description = "VCN CIDR block."
  default     = "10.0.0.0/16"
}

variable "vcn_dns_label" {
  type        = string
  description = "VCN DNS label."
  default     = "vcn"
}

variable "vcn_display_name" {
  type        = string
  description = "VCN display name."
  default     = "vcn"
}

variable "igw_display_name" {
  type        = string
  description = "IGW display name."
  default     = "internet-gateway"
}

variable "vcn_id" {
  type        = string
  description = "VCN id."
  default     = ""
}

variable "subnet_cidr_block" {
  type        = string
  description = "Subnet CIDR block."
  default     = "10.0.0.0/24"
}

variable "subnet_display_name" {
  type        = string
  description = "Subnet display name."
  default     = "subnet"
}

variable "subnet_dns_label" {
  type        = string
  description = "Subnet DNS label."
  default     = "subnet"
}

variable "nsg_display_name" {
  type        = string
  description = "Network security group display name."
  default     = "controller-sec-group"
}

# Standard OCI Variables for Compute and Networking Resources
variable "availability_domain" {
  type        = number
  default     = 1
  description = "OCI Availability Domains: 1,2,3  (subject to region availability)"
}

variable "vm_display_name" {
  type        = string
  description = "VM display name."
  default     = "controller"
}

variable "vm_compute_shape" {
  type        = string
  description = "VM compute shape."
  default     = "VM.Standard2.2" //2 cores
}

variable "subnet_id" {
  type        = string
  description = "Subnet id."
  default     = ""
}

# Variables required for launching Aviatrix Controller
variable "compartment_ocid" {
  type        = string
  description = "Compartment where infrastructure resources will be created"
}

variable "tenancy_ocid" {
  type        = string
  description = "Tenancy OCID."
}

variable "user_ocid" {
  type        = string
  description = "User OCID."
}

variable "license_model" {
  type        = string
  description = "Marketplace license model: 'BYOL' or 'PAID'."
}

variable "fingerprint" {
  type        = string
  description = "Fingerprint of the public key."
}

variable "incoming_ssl_cidrs" {
  type        = list(string)
  description = "The CIDRs to be allowed for HTTPS(port 443) access to the Aviatrix Controller"
}

variable "private_key_path" {
  type        = string
  description = "Private key file path."
}

variable "region" {
  type        = string
  description = "Region."
}

variable "ssh_public_key" {
  type        = string
  description = "Public key file path."
}
