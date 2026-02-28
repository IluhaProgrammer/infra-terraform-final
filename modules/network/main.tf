terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.179.0"
}

resource "yandex_vpc_network" "net2" {
    name = var.name
}