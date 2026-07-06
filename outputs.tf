output "express_route_circuit_connections" {
  description = "All express_route_circuit_connection resources"
  value       = azurerm_express_route_circuit_connection.express_route_circuit_connections
  sensitive   = true
}
output "express_route_circuit_connections_address_prefix_ipv4" {
  description = "List of address_prefix_ipv4 values across all express_route_circuit_connections"
  value       = [for k, v in azurerm_express_route_circuit_connection.express_route_circuit_connections : v.address_prefix_ipv4]
}
output "express_route_circuit_connections_address_prefix_ipv6" {
  description = "List of address_prefix_ipv6 values across all express_route_circuit_connections"
  value       = [for k, v in azurerm_express_route_circuit_connection.express_route_circuit_connections : v.address_prefix_ipv6]
}
output "express_route_circuit_connections_authorization_key" {
  description = "List of authorization_key values across all express_route_circuit_connections"
  value       = [for k, v in azurerm_express_route_circuit_connection.express_route_circuit_connections : v.authorization_key]
  sensitive   = true
}
output "express_route_circuit_connections_name" {
  description = "List of name values across all express_route_circuit_connections"
  value       = [for k, v in azurerm_express_route_circuit_connection.express_route_circuit_connections : v.name]
}
output "express_route_circuit_connections_peer_peering_id" {
  description = "List of peer_peering_id values across all express_route_circuit_connections"
  value       = [for k, v in azurerm_express_route_circuit_connection.express_route_circuit_connections : v.peer_peering_id]
}
output "express_route_circuit_connections_peering_id" {
  description = "List of peering_id values across all express_route_circuit_connections"
  value       = [for k, v in azurerm_express_route_circuit_connection.express_route_circuit_connections : v.peering_id]
}

