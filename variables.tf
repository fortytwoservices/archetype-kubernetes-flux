variable "environment_name" {
  description = "The name of the environment, used when creating resources."
  type        = string
}

variable "location" {
  description = "Location used for all deployed resources."
  type        = string
}

variable "node_pools" {
  description = "This object is used to define the default and additional node pools."
  type = object({
    # Default node pool settings. Optionals are
    # either defined statically in the module resource
    # or left to the defaults from Azure.
    default = object({
      vm_size     = string
      name        = optional(string, "default")
      count       = optional(number)
      system_only = optional(bool)
    })
    # Additional node pools. Optionals are treated
    # in the same way that the default pool is.
    additional = optional(list(object({
      vm_size = string
      name    = optional(string)
      count   = optional(number)
    })), [])
  })
  default = {
    default = {
      count   = 1
      vm_size = "Standard_D4_v5"
    }
  }
}

variable "tags" {
  description = "Tags to be applied to all resources."
  type        = map(string)
  default     = {}
}
