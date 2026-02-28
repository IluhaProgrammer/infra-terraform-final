terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.179.0"
}

resource "yandex_compute_image" "ubuntu-vm-k8s" {
  source_family = "ubuntu-2004-lts"
}