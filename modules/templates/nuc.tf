module "dhcp" {
  source = "../vm"
  vm_count = 2
  base_name = "nuc-vm-a:"
  start_vmid = 200
  cpu = 2
  memory = 2048
  template = "nuc-vm"
}
