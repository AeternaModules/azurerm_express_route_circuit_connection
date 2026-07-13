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
    - authorization_key_key_vault_id (alternative to authorization_key - read from Key Vault instead)
    - authorization_key_key_vault_secret_name (alternative to authorization_key - read from Key Vault instead)
EOT

  type = map(object({
    address_prefix_ipv4                     = string
    name                                    = string
    peer_peering_id                         = string
    peering_id                              = string
    address_prefix_ipv6                     = optional(string)
    authorization_key                       = optional(string)
    authorization_key_key_vault_id          = optional(string)
    authorization_key_key_vault_secret_name = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.express_route_circuit_connections : (
        v.authorization_key == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.authorization_key)))
      )
    ])
    error_message = "must be a valid UUID"
  }
  # Note: 8 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

