variable "instance_count" {
  description = "Number of OpenStack virtual machines"
  type        = number
  default     = 2
}

variable "instance_flavor" {
  description = "OpenStack instance flavor"
  type        = string
  default     = "1"
}

variable "instance_image" {
  description = "OpenStack image ID"
  type        = string
  default     = "3e763664-5f14-40d4-86fa-66d5ba66f7b0"
}

variable "network_id" {
  description = "OpenStack private network ID"
  type        = string
  default     = "02fb4f1d-e11c-4d46-aa6d-73a538164ee6"
}
