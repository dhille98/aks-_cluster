resource "azurerm_resource_group" "workshop" {
    name = "workshop"
    location = "eastus"
    tags = {
      Environment = "qa"
      Application = "workshop"
      Createdby = "terraform"
    }
}

resource "azurerm_kubernetes_cluster" "workshop" {
  name                = "workshop"
  location            = "eastus"
  resource_group_name = "workshop"
  dns_prefix          = "workshop"

  default_node_pool {
    name       = "agentpool"
    vm_size    = "Standard_D2pls_v5"  # Update the VM size here
    node_count = 3
  }

  identity {
    type = "SystemAssigned"
  }
}


resource "null_resource" "kubeconfig" {
    provisioner "local-exec" {
    command = "az aks get-credentials --resource-group ${azurerm_resource_group.workshop.name} --name ${azurerm_kubernetes_cluster.workshop.name} --overwrite-existing"
  }
}
