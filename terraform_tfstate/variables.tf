variable "bucket_name" {
  type = string
}

variable "force_destroy" {
  description = "Force destroy of s3 bucket"
  type        = bool
  default     = false
}

variable "lifecycle_prevent_destroy" {
  description = "Lifecycle prevent destroy"
  type        = bool
  default     = true
}

variable "acl" {
  description = "S3 acl"
  type        = string
  default     = "private"
}

variable "versioning" {
  description = "Enable versioning"
  type        = string
  default     = "Enabled"
}

variable "lock_table_name" {
  type = string
}

variable "tags" {
  type = map(string)
}
