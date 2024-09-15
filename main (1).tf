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
    name = "workshop"
    location = azurerm_resource_group.workshop.location
    resource_group_name = azurerm_resource_group.workshop.name
    dns_prefix = "workshop"
    default_node_pool {
        name = "default"
        node_count = 1
        vm_size = "Standard_D2_v2"
    }
    identity {
      type = "SystemAssigned"
    }
    tags = {
      Environment = "qa"
      Application = "workshop"
      Createdby = "terraform"
    }
}

resource "null_resource" "kubeconfig" {
    provisioner "local-exec" {
    command = "az aks get-credentials --resource-group ${azurerm_resource_group.workshop.name} --name ${azurerm_kubernetes_cluster.workshop.name} --overwrite-existing"
  }
}
