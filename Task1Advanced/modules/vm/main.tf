data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_disk" "data_disk" {
  name = "${var.name}-data-disk"
  size = var.disk_size
  type = "network-hdd"
}

resource "yandex_compute_instance" "vm" {
  name        = var.name
  platform_id = "standard-v2"

  resources {
    cores  = var.cpu
    memory = var.memory
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  secondary_disk {
    disk_id = yandex_compute_disk.data_disk.id
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_key}"
  }
}