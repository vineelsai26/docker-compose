resource "aws_s3_bucket" "github_backup" {
  bucket = "vineelsai-github-backup"

  tags = {
    Name        = "S3 Bucket for GitHub Backup"
    Environment = "Terraform"
  }
}