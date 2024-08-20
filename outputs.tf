output "wp_stack_loadbalancer_ipv4" {
  value = module.wp_solution.loadbalancer_ipv4
}

output "wp_stack_droplet_ipv4" {
  value = module.wp_solution.droplet_ipv4
}

output "wp_stack_database_cluster_ipv4" {
  value = module.wp_solution.database_cluster_ipv4
}

output "wp_stack_database_user" {
  value = module.wp_solution.database_user
}

output "wp_stack_database_pass" {
  value     = module.wp_solution.database_pass
  sensitive = true
}
