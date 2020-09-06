variable "user_names" {
  description = "Create IAM user with these names"
  type        = list(string)
  default     = ["neo", "morpheous"]
}

variable "give_neo_cloudwatch_full_access" {
  description = "If true, neo gets full access to Cloudwatch"
  type        = bool
  default     = false
}
