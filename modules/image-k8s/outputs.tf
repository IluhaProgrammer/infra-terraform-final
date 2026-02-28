output "image-id" {
  description = "Image id for disk"
  value = yandex_compute_image.ubuntu-vm-k8s.id
}