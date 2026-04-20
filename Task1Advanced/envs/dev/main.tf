terraform {
  required_version = ">= 1.5.0"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.110.0"
    }
  }
}

provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

module "vm" {
  source   = "../../modules/vm"
  name     = "dev-vm"
  cpu      = var.cpu
  memory   = var.memory
  disk_size = var.disk_size
  subnet_id = var.subnet_id
  ssh_key   = var.ssh_key
}

variable "yc_token" {}
variable "cloud_id" {}
variable "folder_id" {}

variable "cpu" {}
variable "memory" {}
variable "disk_size" {}
variable "subnet_id" {}
variable "ssh_key" {}