output "resource_group_name" {
  description = "Name of the resource group containing the AKS cluster."
  value       = azurerm_resource_group.this.name
}

output "cluster_name" {
  description = "Name of the AKS cluster."
  value       = azurerm_kubernetes_cluster.this.name
}

output "cluster_id" {
  description = "Resource ID of the AKS cluster."
  value       = azurerm_kubernetes_cluster.this.id
}

output "cluster_fqdn" {
  description = "FQDN of the AKS cluster's API server."
  value       = azurerm_kubernetes_cluster.this.fqdn
}

output "kube_config" {
  description = "Raw kubeconfig for the AKS cluster."
  value       = azurerm_kubernetes_cluster.this.kube_config_raw
  sensitive   = true
}

output "host" {
  description = "Kubernetes API server endpoint."
  value       = azurerm_kubernetes_cluster.this.kube_config[0].host
  sensitive   = true
}
