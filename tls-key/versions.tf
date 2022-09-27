terraform {
  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
    local = {
      source = "hashicorp/local"
      version = "~> 2.2"
    }
    time = {
      source = "hashicorp/time"
      version = "~> 0.8"
    }
  }
}