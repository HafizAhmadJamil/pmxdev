resource "proxmox_lxc" "basic" {
  target_node  = "nano1"
  hostname     = "lxc-basic"
  ostemplate   = "local:vztmpl/ubuntu-23.04-standard_23.04-1_amd64.tar.zst"
  password     = var.root_ct_passw
  unprivileged = true

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
}