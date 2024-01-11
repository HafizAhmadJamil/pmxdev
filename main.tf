resource "proxmox_lxc" "server" {

  target_node     = var.target_node
  ostemplate      = var.ostemplate
  password        = var.root_ct_passw
  unprivileged    = true
  start           = true
  count           = 1
  vmid            = count.index + 701
  hostname        = "CT${count.index + 1}"
  ssh_public_keys = file(var.ssh_keys["pub"])

  rootfs {
    storage = var.storage
    size    = var.rootfs_size
  }

  network {
    name   = var.network_name
    bridge = var.network_bridge
    ip     = "10.210.150.23${count.index + 1}/24"
    gw     = var.network_gateway
  }
  connection {
    host        = "10.210.150.23${count.index + 1}"
    user        = var.user
    private_key = file(var.ssh_keys["priv"])
    agent       = false
    timeout     = "3m"
  }
  provisioner "remote-exec" {
    inline = [
      "apt-get update",
      "apt-get install -y ansible"
    ]
  }
}
