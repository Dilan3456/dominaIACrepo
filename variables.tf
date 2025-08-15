# Variables sensibles (se pueden pasar como entorno o CLI)
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}

# Variables no sensibles
variable "compartment_ocid" {
  description = "OCID del compartimento donde se creará la VCN"
  type        = string
}

variable "vcn_display_name" {
  description = "Nombre para la VCN"
  type        = string
  default     = "demo-vcn"
}

variable "vcn_cidr_block" {
  description = "Bloque CIDR para la VCN"
  type        = string
  default     = "10.0.0.0/16"
}
