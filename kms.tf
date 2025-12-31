# KMS Key para criptografar objetos do S3
resource "aws_kms_key" "s3_key" {
  description             = "KMS key for S3 bucket encryption"
  deletion_window_in_days = 10
  enable_key_rotation     = false

  tags = {
    Name = "s3-encryption-key"
  }
}

# Alias para a chave KMS
resource "aws_kms_alias" "s3_key_alias" {
  name          = "alias/s3-encryption-key"
  target_key_id = aws_kms_key.s3_key.key_id
}
