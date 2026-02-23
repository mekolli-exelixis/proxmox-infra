terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
}


module "nuc" {
  source = "../vm"
  vm_count = 4
  base_name = "nuc-vm-a:"
  start_vmid = 400
  cpu = 2
  memory = 2048
  template = "nuc-vm"
}
