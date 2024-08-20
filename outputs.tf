output "loadbalancer_ipv4" {
  value = digitalocean_loadbalancer.wps-lab-loadbalancer.ip
}

output "droplet_ipv4" {
  value = digitalocean_droplet.wps-droplet[*].ipv4_address
}

output "database_cluster_ipv4" {
  value = digitalocean_database_cluster.mysql-wps.host
}

output "database_user" {
  value = digitalocean_database_user.mysql-wps-user.name
}

output "database_pass" {
  value = digitalocean_database_cluster.mysql-wps.password
  sensitive = true
}