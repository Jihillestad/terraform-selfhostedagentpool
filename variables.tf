variable "rg_name" {
  type        = string
  default     = "app-grp"
  description = "Resource Group name."
}

variable "location" {
  type        = string
  default     = "norwayeast"
  description = "Location of all resources deployed."
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "client_id" {
  description = "Azure Client ID"
  type        = string
}

variable "client_secret" {
  description = "Azure Client Secret"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "vm_name" {
  type        = string
  default     = "app-vm"
  description = "Virtual Machine name."
}

variable "vm_size" {
  type        = string
  default     = "Standard_B1s"
  description = "Virtual Machine size."
}

variable "admin_username" {
  type        = string
  description = "Admin username for the Virtual Machine."
  sensitive   = true
}

variable "admin_password" {
  type        = string
  description = "Admin password for the Virtual Machine."
  sensitive   = true
}
