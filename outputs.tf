output "express_route_circuit_connections_id" {
  description = "Map of id values across all express_route_circuit_connections, keyed the same as var.express_route_circuit_connections"
  value       = { for k, v in azurerm_express_route_circuit_connection.express_route_circuit_connections : k => v.id if v.id != null && length(v.id) > 0 }
}
output "express_route_circuit_connections_address_prefix_ipv4" {
  description = "Map of address_prefix_ipv4 values across all express_route_circuit_connections, keyed the same as var.express_route_circuit_connections"
  value       = { for k, v in azurerm_express_route_circuit_connection.express_route_circuit_connections : k => v.address_prefix_ipv4 if v.address_prefix_ipv4 != null && length(v.address_prefix_ipv4) > 0 }
}
output "express_route_circuit_connections_address_prefix_ipv6" {
  description = "Map of address_prefix_ipv6 values across all express_route_circuit_connections, keyed the same as var.express_route_circuit_connections"
  value       = { for k, v in azurerm_express_route_circuit_connection.express_route_circuit_connections : k => v.address_prefix_ipv6 if v.address_prefix_ipv6 != null && length(v.address_prefix_ipv6) > 0 }
}
output "express_route_circuit_connections_authorization_key" {
  description = "Map of authorization_key values across all express_route_circuit_connections, keyed the same as var.express_route_circuit_connections"
  value       = { for k, v in azurerm_express_route_circuit_connection.express_route_circuit_connections : k => v.authorization_key if v.authorization_key != null && length(v.authorization_key) > 0 }
  sensitive   = true
}
output "express_route_circuit_connections_name" {
  description = "Map of name values across all express_route_circuit_connections, keyed the same as var.express_route_circuit_connections"
  value       = { for k, v in azurerm_express_route_circuit_connection.express_route_circuit_connections : k => v.name if v.name != null && length(v.name) > 0 }
}
output "express_route_circuit_connections_peer_peering_id" {
  description = "Map of peer_peering_id values across all express_route_circuit_connections, keyed the same as var.express_route_circuit_connections"
  value       = { for k, v in azurerm_express_route_circuit_connection.express_route_circuit_connections : k => v.peer_peering_id if v.peer_peering_id != null && length(v.peer_peering_id) > 0 }
}
output "express_route_circuit_connections_peering_id" {
  description = "Map of peering_id values across all express_route_circuit_connections, keyed the same as var.express_route_circuit_connections"
  value       = { for k, v in azurerm_express_route_circuit_connection.express_route_circuit_connections : k => v.peering_id if v.peering_id != null && length(v.peering_id) > 0 }
}

