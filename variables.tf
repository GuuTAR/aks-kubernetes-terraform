variable "resource_group_name" {
  description = "Name of the resource group that will hold the AKS cluster and its networking."
  type        = string
  default     = "aks-rg"
}

variable "location" {
  description = "Azure region to deploy into."
  type        = string
  default     = "eastus"
}

variable "cluster_name" {
  description = "Name of the AKS cluster."
  type        = string
  default     = "aks-cluster"
}

variable "dns_prefix" {
  description = "DNS prefix used when creating the AKS cluster's public FQDN."
  type        = string
  default     = "aks-cluster"
}

variable "kubernetes_version" {
  description = "Kubernetes version to use. Leave null to use the current default version from the Azure provider."
  type        = string
  default     = null
}

variable "vnet_address_space" {
  description = "Address space for the AKS virtual network."
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for the subnet used by the AKS node pool."
  type        = list(string)
  default     = ["10.10.1.0/24"]
}

variable "node_count" {
  description = "Number of nodes in the default node pool."
  type        = number
  default     = 2
}

variable "node_vm_size" {
  description = "VM size for the default node pool."
  type        = string
  default     = "Standard_DS2_v2"
}

variable "tags" {
  description = "Tags applied to all resources."
  type        = map(string)
  default = {
    environment = "dev"
    managed_by  = "terraform"
  }
}
