terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.179.0"
}

resource "yandex_compute_disk" "disk-boot-k8s" {
  name = var.name
  type = "network-hdd"
  zone = var.zone
  size = var.disk_size
  image_id = var.image-id
}