resource "azurerm_resource_group" "cluster" {
  name     = format("rg-%s", var.environment_name)
  location = var.location
}

resource "azurerm_virtual_network" "cluster" {
  name                = format("vnet-%s", var.environment_name)
  resource_group_name = azurerm_resource_group.cluster.name
  location            = azurerm_resource_group.cluster.location
  address_space       = var.azure_network.vnet_cidr
  tags                = var.tags
}

resource "azurerm_subnet" "aks" {
  name                 = "snet-aks"
  resource_group_name  = azurerm_resource_group.cluster.name
  virtual_network_name = azurerm_virtual_network.cluster.name
  address_prefixes     = var.azure_network.subnet_cidr
}

module "aks" {
  source              = "amestofortytwo/aks/azurerm"
  version             = "3.5.0"
  name                = var.environment_name
  resource_group_name = azurerm_resource_group.cluster.name
  location            = azurerm_resource_group.cluster.location
  tags                = var.tags

  network_profile = {
    network_plugin = "azure"
    vnet_subnet_id = azurerm_subnet.aks.id
  }

  default_node_pool = {
    vm_size    = var.node_pools.default.vm_size
    name       = var.node_pools.default.name
    node_count = var.node_pools.default.count

    #TODO: module does not support this yet
    #system_only = var.node_pools.default.system_only
  }

  additional_node_pools = var.node_pools.additional
}
