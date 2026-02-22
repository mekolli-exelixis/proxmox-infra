module "dhcp" {
  source = "../vm"
  vm_count = 2
  base_name = "dhcp-vm-a:"
  start_vmid = 200
  cpu = 4
  memory = 8096
  template = "dhcp-vm"
}

