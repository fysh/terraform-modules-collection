output "secret_key_filename" {
  value = "Secret key filename ==>  ${var.path}/${var.name}_private_${time_static.this_time.unix}_${var.algorithm}.pem"
}

output "public_key_filename" {
  value = "Public key filename ==>  ${var.path}/${var.name}_public_${time_static.this_time.unix}_${var.algorithm}.key"
}