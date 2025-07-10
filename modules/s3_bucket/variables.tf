variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., staging, production)"
  type        = string
}

variable "acl" {
  description = "The canned ACL to apply"
  type        = string
  default     = "private"
}

variable "versioning_enabled" {
  description = "Enable versioning for the bucket"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to the bucket"
  type        = map(string)
  default     = {}
}
