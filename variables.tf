variable "express_route_circuit_connections" {
  description = <<EOT
Map of express_route_circuit_connections, attributes below
Required:
    - address_prefix_ipv4
    - name
    - peer_peering_id
    - peering_id
Optional:
    - address_prefix_ipv6
    - authorization_key
EOT

  type = map(object({
    address_prefix_ipv4 = string
    name                = string
    peer_peering_id     = string
    peering_id          = string
    address_prefix_ipv6 = optional(string)
    authorization_key   = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.express_route_circuit_connections : (
        v.authorization_key == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.authorization_key)))
      )
    ])
    error_message = "must be a valid UUID"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_express_route_circuit_connection's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.ExpressRouteCircuitConnectionName] !ok
  # path: name
  #   source:    [from validate.ExpressRouteCircuitConnectionName] !regexp.MustCompile(`^(([a-zA-Z0-9])|([a-zA-Z0-9][a-zA-Z0-9_.-]{0,78}[a-zA-Z0-9_]))$`).MatchString(v)
  # path: peering_id
  #   source:    [from commonids.ValidateExpressRouteCircuitPeeringID] !ok
  # path: peering_id
  #   source:    [from commonids.ValidateExpressRouteCircuitPeeringID] err != nil
  # path: peer_peering_id
  #   source:    [from commonids.ValidateExpressRouteCircuitPeeringID] !ok
  # path: peer_peering_id
  #   source:    [from commonids.ValidateExpressRouteCircuitPeeringID] err != nil
  # path: address_prefix_ipv4
  #   source:    validation.IsCIDR(...) - no translation rule yet, add one
  # path: address_prefix_ipv6
  #   source:    validation.IsCIDR(...) - no translation rule yet, add one
}

