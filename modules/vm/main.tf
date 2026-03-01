terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
}

resource "proxmox_vm_qemu" "vm" {
  count = var.vm_count
  target_node = var.target_node
  name        = "${var.base_name}-${count.index + 1}"
  vmid        = var.start_vmid + count.index
  clone       = var.template
  full_clone  = true

  cpu {
    cores = var.cpu
  }

  memory = var.memory

  network {
    id     = var.network_id
    model  = var.network_model
    bridge = var.network_bridge
  }

  disk {
    slot    = var.disk_slot
    size    = var.disk_size
    type    = var.disk_type
    storage = var.disk_storage
  }
}

