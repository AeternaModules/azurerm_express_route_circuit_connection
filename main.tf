data "azurerm_key_vault_secret" "authorization_key" {
  for_each     = { for k, v in var.express_route_circuit_connections : k => v if v.authorization_key_key_vault_id != null && v.authorization_key_key_vault_secret_name != null }
  name         = each.value.authorization_key_key_vault_secret_name
  key_vault_id = each.value.authorization_key_key_vault_id
}
resource "azurerm_express_route_circuit_connection" "express_route_circuit_connections" {
  for_each = var.express_route_circuit_connections

  address_prefix_ipv4 = each.value.address_prefix_ipv4
  name                = each.value.name
  peer_peering_id     = each.value.peer_peering_id
  peering_id          = each.value.peering_id
  address_prefix_ipv6 = each.value.address_prefix_ipv6
  authorization_key   = each.value.authorization_key != null ? each.value.authorization_key : try(data.azurerm_key_vault_secret.authorization_key[each.key].value, null)
}

