variable "bucket_name" {
  type = string
}

variable "enable_dynamodb" {
  description = "Use dynamodb"
  type = bool
}

variable "lock_table_name" {
  type = string
}

variable "tags" {
  type = map(string)
}
