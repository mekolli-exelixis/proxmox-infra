module "dhcp" {
  source = "../vm"
  vm_count = 4
  base_name = "nuc-vm-a:"
  start_vmid = 400
  cpu = 2
  memory = 2048
  template = "nuc-vm"
}
