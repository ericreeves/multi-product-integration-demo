output "vault_token" {
  value = hcp_vault_cluster_admin_token.provider.token
}

output "vault_addr" {
  value = hcp_vault_cluster.hashistack.public_endpoint
}

output "boundary_addr" {
  value = hcp_boundary_cluster.hashistack.cluster_url
}