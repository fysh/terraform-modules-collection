resource "time_static" "this_time" {}

################## Generate tls_private_key ##########################

resource "tls_private_key" "ecdsa-p384" {
  count       = var.algorithm == "ECDSA" ? 1 : 0
  algorithm   = "ECDSA"
  ecdsa_curve = "P384"
}

resource "tls_private_key" "rsa-4096" {
  count     = var.algorithm == "RSA" ? 1 : 0
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_private_key" "ed25519" {
  count     = var.algorithm == "ED25519" ? 1 : 0
  algorithm = "ED25519"
}

####################### Data ######################################

data "tls_public_key" "ecdsa-p384" {
  count       = var.algorithm == "ECDSA" ? 1 : 0
  private_key_pem = tls_private_key.ecdsa-p384[0].private_key_pem
}

data "tls_public_key" "rsa-4096" {
  count     = var.algorithm == "RSA" ? 1 : 0
  private_key_pem = tls_private_key.rsa-4096[0].private_key_pem
}

data "tls_public_key" "ed25519" {
  count     = var.algorithm == "ED25519" ? 1 : 0
  private_key_pem = tls_private_key.ed25519[0].private_key_pem
}

##################### local_file ####################################

resource "local_file" "this_private_ecdsa_p384" {
  count       = var.algorithm == "ECDSA" ? 1 : 0
  filename = "${var.path}/${var.name}_private_${time_static.this_time.unix}_${var.algorithm}.pem"
  content  = tls_private_key.ecdsa-p384[0].private_key_pem
}

resource "local_file" "this_private_rsa_4096" {
  count     = var.algorithm == "RSA" ? 1 : 0
  filename = "${var.path}/${var.name}_private_${time_static.this_time.unix}_${var.algorithm}.pem"
  content  = tls_private_key.rsa-4096[0].private_key_pem
}

resource "local_file" "this_private_ed25519" {
  count     = var.algorithm == "ED25519" ? 1 : 0
  filename = "${var.path}/${var.name}_private_${time_static.this_time.unix}_${var.algorithm}.pem"
  content  = tls_private_key.ed25519[0].private_key_pem
}

################## public key ########################################

resource "local_file" "this_public_ecdsa_p384" {
  count       = var.algorithm == "ECDSA" ? 1 : 0
  filename = "${var.path}/${var.name}_public_${time_static.this_time.unix}_${var.algorithm}.key"
  content  = tls_private_key.ecdsa-p384[0].public_key_openssh
}

resource "local_file" "this_public_rsa_4096" {
  count     = var.algorithm == "RSA" ? 1 : 0
  filename = "${var.path}/${var.name}_public_${time_static.this_time.unix}_${var.algorithm}.key"
  content  = tls_private_key.rsa-4096[0].public_key_openssh
}

resource "local_file" "this_public_ed25519" {
  count     = var.algorithm == "ED25519" ? 1 : 0
  filename = "${var.path}/${var.name}_public_${time_static.this_time.unix}_${var.algorithm}.key"
  content  = tls_private_key.ed25519[0].public_key_openssh
}
