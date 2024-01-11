
variable "ssh_keys" {
  type = map(any)
  default = {
    pub  = "~/.ssh/id_rsa.pub"
    priv = "~/.ssh/id_rsa"
  }
}
variable "target_node" {
  default = "tnoc"

}
variable "ostemplate" {
  default = "local:vztmpl/ubuntu-23.04-standard_23.04-1_amd64.tar.zst"
}
variable "rootfs_size" {
  default = "8G"
}
variable "network_name" {
  default = "eth0"
}
variable "network_bridge" {
  default = "vmbr0"
}

variable "network_gateway" {
  default = "10.210.150.1"
}
variable "storage" {
  default = "local-zfs"

}
variable "hostname_prefix" {
  default = "k3s-0"

}
variable "user" {
  default = "root"

}
variable "ips" {
  description = "IPs of the containers, respective to the hostname order"
  type        = list(string)
  default     = ["10.210.150.24"]
}
