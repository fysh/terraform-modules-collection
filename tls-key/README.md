# Usage

# module
module "tls-key" {
  source = "../tls-key"

  # Avaliable algorithm RSA,ECDSA,ED25519.
  name = "<here_is_your_name>"
  path = "/tmp"
  algorithm = "ED25519"
}

# outputs

output "public" {
   value = module.tls-private-key.secret_key_filename
}

output "secret" {
   value = module.tls-private-key.public_key_filename
}

# Avaliable variables
## name - keys name
## path - path to save private and public keys

# supported algorithm
## algorithm = "ECDSA"
## algorithm = "RSA"
## algorithm = "ED25519"