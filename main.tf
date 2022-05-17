terraform {
  required_providers {
    virtualbox = {
      source = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}


resource "virtualbox_vm" "node" {
  count     = 1
  name      = "test-1"
  image     = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20220513.0.0/providers/virtualbox.box"
  cpus      = 1
  memory    = "512 mib"
  #user_data = "${file("user_data")}"
  

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet0"
  }



}



output "IPAddr" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 1)
}

