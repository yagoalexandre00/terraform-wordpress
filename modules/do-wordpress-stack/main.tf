resource "digitalocean_vpc" "wps-lab-vpc" {
  name     = "wps-lab-vpc"
  region   = var.do_region
  ip_range = "10.0.254.0/24"

  timeouts {
    delete = "1m"
  }
}

resource "digitalocean_loadbalancer" "wps-lab-loadbalancer" {
  name   = "wps-lab-loadbalancer"
  region = var.do_region

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "tcp"

    target_port     = 80
    target_protocol = "tcp"
  }

  droplet_ids = digitalocean_droplet.wps-droplet[*].id
  vpc_uuid    = digitalocean_vpc.wps-lab-vpc.id
}

resource "digitalocean_droplet" "wps-droplet" {
  name     = "wps-droplet-${count.index + 1}"
  image    = "ubuntu-22-04-x64"
  size     = "s-1vcpu-1gb"
  region   = var.do_region
  vpc_uuid = digitalocean_vpc.wps-lab-vpc.id
  count    = 2
  ssh_keys = [var.ssh_key]
}

resource "digitalocean_database_cluster" "mysql-wps" {
  name                 = "wps-mysql-cluster"
  engine               = "mysql"
  version              = "8"
  size                 = "db-s-1vcpu-1gb"
  region               = "nyc1"
  node_count           = 1
  private_network_uuid = digitalocean_vpc.wps-lab-vpc.id
}

resource "digitalocean_database_user" "mysql-wps-user" {
  cluster_id = digitalocean_database_cluster.mysql-wps.id
  name       = var.wps_user
}
