output "resource_group_name" {
    value = azurerm_resource_group.Challenge-01-Azure-RG.rg_name
    description = "Name of the resource group."
}

output "location_id" {
    value = azurerm_resource_group.Challenge-01-Azure-RG.rg_location
    description = "Location id of the resource group"
}