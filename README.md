# aks-kubernetes-terraform

Terraform configuration to create an AKS (Azure Kubernetes Service) cluster.

## What it creates

- A resource group
- A virtual network and subnet for the AKS nodes
- An AKS cluster with a system-assigned managed identity, Azure CNI networking, and a single fixed-size default node pool

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.5.0
- An Azure subscription
- Authenticated with Azure, e.g. via the Azure CLI:

  ```bash
  az login
  az account set --subscription "<subscription-id-or-name>"
  ```

## Usage

1. Copy the example variables file and adjust values as needed:

   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. Initialize and apply:

   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

3. Connect to the cluster:

   ```bash
   az aks get-credentials --resource-group <resource_group_name> --name <cluster_name>
   kubectl get nodes
   ```

## Variables

| Name | Description | Default |
|---|---|---|
| `resource_group_name` | Resource group name | `aks-rg` |
| `location` | Azure region | `eastus` |
| `cluster_name` | AKS cluster name | `aks-cluster` |
| `dns_prefix` | DNS prefix for the cluster API server | `aks-cluster` |
| `kubernetes_version` | Kubernetes version (`null` = provider default) | `null` |
| `vnet_address_space` | VNet address space | `["10.10.0.0/16"]` |
| `subnet_address_prefixes` | Subnet address prefixes | `["10.10.1.0/24"]` |
| `node_count` | Number of nodes in the default node pool | `2` |
| `node_vm_size` | VM size for the default node pool | `Standard_DS2_v2` |
| `tags` | Tags applied to all resources | `{ environment = "dev", managed_by = "terraform" }` |

## Outputs

- `resource_group_name`
- `cluster_name`
- `cluster_id`
- `cluster_fqdn`
- `kube_config` (sensitive)
- `host` (sensitive)

## Cleanup

```bash
terraform destroy
```
