variable "mp_listings" {
  type = map(string)

  default = {
    "PAID" = "ocid1.appcataloglisting.oc1..aaaaaaaawdptz5o42tuhg62defjimphzuck4fbrz4cilez2mle3bcs5t22wa"
    "BYOL" = "ocid1.appcataloglisting.oc1..aaaaaaaavalzcaxbs4hwta4uefnkdh7fjgd3uuw7lwlk6pn2uvzglrn3zt2a"
  }
}

variable "mp_byol_versions" {
  type = map(string)

  default = {
    "6.3.0" = "6.3.1"
  }
}

variable "mp_paid_versions" {
  type = map(string)

  default = {
    "6.3.0" = "6.3"
  }
}

variable "mp_byol_listing_resource_id" {
  type = map(string)

  default = {
    "6.3.1" = "ocid1.image.oc1..aaaaaaaawyzirrayoeo5ivzkf57texkiu44ytnfifkmzry2xm5uu4otfk7cq"
  }
}

variable "mp_paid_listing_resource_id" {
  type = map(string)

  default = {
    "6.3" = "ocid1.image.oc1..aaaaaaaams7arhiyikfhpvo2kj35ky76csllxdnzijqw6ves4a5saaj63mva"
  }
}

variable "product_version" {
  default = "6.3.0"
}

variable "enabled" {
  type = bool
  default = true
}

variable "use_existing_network" {
  type = bool
  default = false
}

variable "vcn_cidr_block" {
  default = "10.0.0.0/16"
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

variable "vcn_id" {
  default = ""
}

variable "subnet_cidr_block" {
  default = "10.0.0.0/24"
}

variable "subnet_display_name" {
  default = "subnet"
}

variable "subnet_dns_label" {
  default = "subnet"
}

variable "nsg_display_name" {
  default = "controller-sec-group"
}

# Standard OCI Variables for Compute and Networking Resources
variable "availability_domain" {
  default     = 1
  description = "OCI Availability Domains: 1,2,3  (subject to region availability)"
}

variable "vm_display_name" {
  default = "controller"
}

variable "vm_compute_shape" {
  default = "VM.Standard2.2" //2 cores
}

variable "subnet_id" {
  default = ""
}

# Variables required for launching Aviatrix Controller
variable "compartment_ocid" {
  description = "Compartment where infrastructure resources will be created"
}

variable "tenancy_ocid" {
}

variable "user_ocid" {
}

variable "license_model" {
}

variable "fingerprint" {
}

variable "nsg_whitelist_ip" {
  type = list(string)
}

variable "private_key_path" {
}

variable "region" {
}

variable "ssh_public_key" {
}
