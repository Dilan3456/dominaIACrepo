resource "oci_core_vcn" "demo_vcn" {
  compartment_id = var.compartment_ocid
  display_name   = var.vcn_display_name
  cidr_block     = var.vcn_cidr_block
}

resource "oci_core_internet_gateway" "demo_igw" {
  compartment_id = var.compartment_ocid
  display_name   = "demo-igw"
  vcn_id         = oci_core_vcn.demo_vcn.id
}

resource "oci_core_nat_gateway" "demo_natgw" {
  compartment_id = var.compartment_ocid
  display_name   = "demo-natgw"
  vcn_id         = oci_core_vcn.demo_vcn.id
}

resource "oci_core_route_table" "public_rt" {
  compartment_id = var.compartment_ocid
  display_name   = "public-rt"
  vcn_id         = oci_core_vcn.demo_vcn.id

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.demo_igw.id
  }
}

resource "oci_core_route_table" "private_rt" {
  compartment_id = var.compartment_ocid
  display_name   = "private-rt"
  vcn_id         = oci_core_vcn.demo_vcn.id

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.demo_natgw.id
  }
}
