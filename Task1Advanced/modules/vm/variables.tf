variable "name" {
  description = "Имя виртуальной машины"
  type        = string
}

variable "cpu" {
  description = "Количество CPU"
  type        = number
}

variable "memory" {
  description = "Объем RAM в ГБ"
  type        = number
}

variable "disk_size" {
  description = "Размер подключаемого диска (ГБ)"
  type        = number
}

variable "subnet_id" {
  description = "ID подсети"
  type        = string
}

variable "ssh_key" {
  description = "Публичный SSH ключ"
  type        = string
}