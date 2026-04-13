variable "api_key" {
  description = "NetActuate API key (from portal.netactuate.com/account/api)"
  type        = string
  sensitive   = true
}

variable "location" {
  description = "Storage location code (e.g., \"SJC\", \"RDU\", \"AMS\") — use data.netactuate_storage_locations to discover"
  type        = string
  default     = "SJC"
}

variable "capacity" {
  description = "Storage capacity in TB"
  type        = number
  default     = 2
}
