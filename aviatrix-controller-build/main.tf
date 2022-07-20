locals {
  enabled                  = var.enabled
  listing_id               = var.license_model == "BYOL" ? var.mp_listings["BYOL"] : var.mp_listings["PAID"]
  listing_resource_version = var.license_model == "BYOL" ? var.mp_byol_versions[var.product_version] : var.mp_paid_versions[var.product_version]
  listing_resource_id      = var.license_model == "BYOL" ? var.mp_byol_listing_resource_id[var.mp_byol_versions[var.product_version]] : var.mp_paid_listing_resource_id[var.mp_paid_versions[var.product_version]]
}

#Get Image Agreement
resource "oci_core_app_catalog_listing_resource_version_agreement" "mp_image_agreement" {
  count = local.enabled ? 1 : 0

  listing_id               = local.listing_id
  listing_resource_version = local.listing_resource_version
}

resource "oci_core_vcn" "vcn" {
  count          = var.use_existing_network ? 0:1
  cidr_block     = var.vcn_cidr_block
  dns_label      = var.vcn_dns_label
  compartment_id = var.compartment_ocid
  display_name   = var.vcn_display_name
}

resource "oci_core_internet_gateway" "igw" {
  count          = var.use_existing_network ? 0:1
  compartment_id = var.compartment_ocid
  display_name   = var.igw_display_name
  vcn_id         = oci_core_vcn.vcn[count.index].id
}

resource "oci_core_subnet" "public_subnet" {
  count          = var.use_existing_network ? 0:1
  compartment_id             = var.compartment_ocid
  vcn_id                     = oci_core_vcn.vcn[count.index].id
  cidr_block                 = var.subnet_cidr_block
  display_name               = var.subnet_display_name
  route_table_id             = oci_core_vcn.vcn[count.index].default_route_table_id
  dns_label                  = var.subnet_dns_label
  prohibit_public_ip_on_vnic = "false"
}

#Accept Terms and Subscribe to the image, placing the image in a particular compartment
resource "oci_core_app_catalog_subscription" "mp_image_subscription" {
  count = local.enabled ? 1 : 0

  compartment_id           = var.compartment_ocid
  eula_link                = oci_core_app_catalog_listing_resource_version_agreement.mp_image_agreement[0].eula_link
  listing_id               = oci_core_app_catalog_listing_resource_version_agreement.mp_image_agreement[0].listing_id
  listing_resource_version = oci_core_app_catalog_listing_resource_version_agreement.mp_image_agreement[0].listing_resource_version
  oracle_terms_of_use_link = oci_core_app_catalog_listing_resource_version_agreement.mp_image_agreement[0].oracle_terms_of_use_link
  signature                = oci_core_app_catalog_listing_resource_version_agreement.mp_image_agreement[0].signature
  time_retrieved           = oci_core_app_catalog_listing_resource_version_agreement.mp_image_agreement[0].time_retrieved

  timeouts {
    create = "20m"
  }
}

# Gets the partner image subscription
data "oci_core_app_catalog_subscriptions" "mp_image_subscription" {
  count = local.enabled ? 1 : 0

  compartment_id = var.compartment_ocid
  listing_id     = local.listing_id

  filter {
    name   = "listing_resource_version"
    values = [local.listing_resource_version]
  }
}

resource "oci_core_network_security_group" "nsg" {
  #Required
  compartment_id = var.compartment_ocid
  vcn_id         = !var.use_existing_network ? join("", oci_core_vcn.vcn.*.id) : var.vcn_id

  #Optional
  display_name = var.nsg_display_name
}

resource "oci_core_network_security_group_security_rule" "rule_egress_all" {
  network_security_group_id = oci_core_network_security_group.nsg.id

  direction   = "EGRESS"
  protocol    = "all"
  destination = "0.0.0.0/0"
}

resource "oci_core_network_security_group_security_rule" "rule_ingress_tcp443" {
  count                     = length(var.nsg_whitelist_ip)
  network_security_group_id = oci_core_network_security_group.nsg.id
  protocol                  = "6"
  direction                 = "INGRESS"
  source                    = var.nsg_whitelist_ip[count.index]
  stateless                 = false

  tcp_options {
    destination_port_range {
      min = 443
      max = 443
    }
  }
}

resource "oci_core_default_route_table" "default_route_table" {
  count          = var.use_existing_network ? 0:1
  manage_default_resource_id = oci_core_vcn.vcn[count.index].default_route_table_id

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.igw[count.index].id
  }
}

data "oci_identity_availability_domain" "ad" {
  compartment_id = var.tenancy_ocid
  ad_number      = var.availability_domain
}

resource "oci_core_instance" "simple-vm" {

  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compartment_ocid
  display_name        = var.vm_display_name
  shape               = var.vm_compute_shape

  create_vnic_details {
    subnet_id        = !var.use_existing_network ? join("", oci_core_subnet.public_subnet.*.id) : var.subnet_id
    display_name     = var.vm_display_name
    assign_public_ip = true
    nsg_ids          = [join("", oci_core_network_security_group.nsg.*.id)]
  }

  source_details {
    source_type = "image"
    source_id   = var.enabled ? local.listing_resource_id : ""
  }
}

