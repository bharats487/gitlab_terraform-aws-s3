variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "my-s3-project"
}

variable "environment" {
  description = "Environment name (e.g., staging, production)"
  type        = string
  default     = "production"
}

variable "aws_region" {
  description = "AWS region to deploy to"
  type        = string
  default     = "us-east-1"
}

variable "acl" {
  description = "The canned ACL to apply to the S3 bucket"
  type        = string
  default     = "private"
}

variable "versioning_enabled" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "production"
  }
}
