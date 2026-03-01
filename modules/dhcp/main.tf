terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
}

module "dhcp" {
  source      = "../vm"
  vm_count    = var.vm_count
  base_name   = var.base_name
  start_vmid  = var.start_vmid
  cpu         = var.cpu
  memory      = var.memory
  template    = var.template_type
  target_node = var.target_node
}
