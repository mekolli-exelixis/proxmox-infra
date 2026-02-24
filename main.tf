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
  source = "./modules/templates/dhcp"
  template_type = "dhcp-vm"

  providers = {
    proxmox = proxmox
  }
}
module "ntp" {
  source = "./modules/templates/ntp"
  template_type = "ntp-vm"

  providers = {
    proxmox = proxmox
  }
}
module "nuc" {
  source = "./modules/templates/nuc"
  template_type = "nuc-vm"

  providers = {
    proxmox = proxmox
  }
}
module "uservm" {
  source = "./modules/templates/user-vm"
  template_type = "user-vm"
  
  providers = {
    proxmox = proxmox
  }
}

