output "ipv4_address" {
  description = "Ipv4 addres output"
  value = yandex_compute_instance.k8s.network_interface[0].nat_ip_address
}