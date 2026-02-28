terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.179.0"
}

resource "yandex_vpc_subnet" "k8s-subnet" {
  name = var.name
  zone = var.zone
  network_id = var.network_id
  v4_cidr_blocks = var.cidr4_subnet
}