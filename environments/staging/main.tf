provider "aws" {
  region = var.aws_region
}

module "s3_bucket" {
  source = "../../modules/s3_bucket"

  bucket_name        = "${var.project_name}-${var.environment}-${random_id.this.hex}"
  environment        = var.environment
  acl                = var.acl
  versioning_enabled = var.versioning_enabled
  tags               = var.tags
}

resource "random_id" "this" {
  byte_length = 4
}
