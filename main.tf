terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure     = var.pm_tls_insecure
}

module "dhcp" {
  source = "./modules/templates"
  template_type = "dhcp-vm"
}
module "ntp" {
  source = "./modules/templates"
  template_type = "ntp-vm"
}
module "nuc" {
  source = "./modules/templates"
  template_type = "nuc-vm"
}
module "uservm" {
  source = "./modules/templates"
  template_type = "user-vm"
}

