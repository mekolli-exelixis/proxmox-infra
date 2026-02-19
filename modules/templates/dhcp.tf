module "dhcp" {
  source = "../vm"
  vm_count = 2
  base_name = "dhcp"
  start_vmid = 800
  cpu = 2
  memory = 2048
  template = "DHCP-Template"
}

