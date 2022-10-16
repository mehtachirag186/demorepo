data "azurerm_virtual_machine" "az-vm" {
  name                = "production"
  resource_group_name = "networking"
}

output "virtual_machine_id" {
  value = data.azurerm_virtual_machine.example.id
}