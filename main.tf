module "wp_solution" {
  source       = "./modules/do-wordpress-stack"
  wps_user     = "worpress"
  do_region    = "nyc1"
  wps_vm_count = 2
  ssh_key      = digitalocean_ssh_key.ssh.fingerprint
}

resource "digitalocean_ssh_key" "ssh" {
  name       = "terraform"
  public_key = file(var.ssh_public_key_path)
}
