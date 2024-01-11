terraform {
  required_providers {
    proxmox = {
      source  = "Terraform-for-Proxmox/proxmox"
      version = "0.0.1"
    }
  }

}

variable "pm_api_url" {
  type = string
}

variable "pm_api_token_id" {
  type = string
}
variable "pm_api_token_secret" {
  type      = string
  sensitive = true

}
variable "root_ct_passw" {
  type      = string
  sensitive = true
}
variable "PM_TLS_INSECURE" {
  type    = bool
  default = true
}
provider "proxmox" {
  pm_api_token_id     = var.pm_api_token_id
  pm_api_url          = var.pm_api_url
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure     = true
}
