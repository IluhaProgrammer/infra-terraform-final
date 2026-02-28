terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.179.0"
}

resource "yandex_compute_instance" "k8s" {
  name = var.name
  platform_id = "standard-v3"
  zone = var.zone

  resources {
    cores = var.cores
    memory = var.memory
  }

  boot_disk {
    disk_id = var.boot_disk_id
  }

  network_interface {
    index = 0
    subnet_id = var.subnet_id
    security_group_ids = [ var.ids-sg ]
    nat = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("/home/hasler/final/infra/ssh/id_ed.pub")}"
    serial-port-enable = "1"
  }
}