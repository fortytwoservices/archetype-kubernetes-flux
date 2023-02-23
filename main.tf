resource "azurerm_resource_group" "cluster" {
  name     = format("rg-%s", var.environment_name)
  location = var.location
}

module "aks" {
  source              = "amestofortytwo/aks/azurerm"
  version             = "1.1.0"
  name                = format("aks-%s", var.environment_name)
  resource_group_name = azurerm_resource_group.cluster.name
  location            = azurerm_resource_group.cluster.location
  tags                = var.tags

  default_node_pool = {
    vm_size    = var.node_pools.default.vm_size
    name       = var.node_pools.default.name
    node_count = var.node_pools.default.count

    #TODO: module does not support this yet
    #system_only = var.node_pools.default.system_only
  }

  additional_node_pools = var.node_pools.additional
}
