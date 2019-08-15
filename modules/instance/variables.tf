variable "instance_key_name" {
  description = "Name of an existing EC2 Key Pair in the target deployment region"
  type        = string
}

variable "instance_name" {
  description = "Name tag of the EC2 instance"
  type        = string
}

variable "instance_allow_ssh" {
  description = "Whether or not to allow ssh"
  type        = bool
  default     = false
}
