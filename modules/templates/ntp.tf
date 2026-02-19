module "ntp" {
  source = "../vm"
  vm_count = 2
  base_name = "ntp"
  start_vmid = 820
  cpu = 1
  memory = 1024
  template = "NTP-Template"
}

