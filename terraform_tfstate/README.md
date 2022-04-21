#Connection of this module 

##main.tf
locals {
  tags = {
    environment = var.environment
    project     = var.project
    terraform   = true
  }
}

module "terraform_tfstate" {
  source          = "../../modules/terraform_tfstate"
  bucket_name     = "${var.project}-tfstate-${var.environment}"
  lock_table_name = "${var.project}-tfstate-lock-${var.environment}"
  tags            = local.tags
}


##variables.tf
variable "aws_region" {}
variable "environment" {}
variable "project" {}