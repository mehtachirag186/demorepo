variable "region" {
  default = "northeurope"
  type = string
}
variable "resource_group" {
  default = "rg-spservers"
  type = string
}

variable "Vnet" {
  default = "SP-Virtual-Network"
  type = string
}

variable "subnet" {
  default = "SP-subnet"
  type = string
}
variable "nic" {
  default = "nic"
  type = string
}
variable "ip" {
  default = "ip"
  type = string
}
variable "ServerName" {
  default = "SP2k19"
  type = string
}
variable "loadbalancer" {
  default = "sp2019lb"
  type = string
}
variable "avset" {
  default = "sp-as"
  type = string
}

variable "node_count"{
  default = 3
  type = number
}

variable "NSG" {
  default = "sp-nsg"
  type = string
}