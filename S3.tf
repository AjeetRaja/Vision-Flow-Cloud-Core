# 1. நமக்கான பிரைவேட் S3 பக்கெட் (டிஜிட்டல் லாக்கர்)
resource "aws_s3_bucket" "vision_flow_storage" {
  bucket        = "servail-groups-vision-flow-storage-2026" # இது உலகத்துக்கே தனித்துவமான பேரா இருக்கணும் மச்சா
  force_destroy = true

  tags = {
    Name        = "Vision-Flow-Storage"
    Environment = "Production"
  }
}

# 2. பக்கெட் ஓனர்ஷிப் கன்ட்ரோல் (Bucket Ownership Controls)
resource "aws_s3_bucket_ownership_controls" "vision_flow_oc" {
  bucket = aws_s3_bucket.vision_flow_storage.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

# 3. 100% பப்ளிக் ஆக்சஸ் பிளாக் (The Ultimate Security Lock)
resource "aws_s3_bucket_public_access_block" "vision_flow_crypto_lock" {
  bucket = aws_s3_bucket.vision_flow_storage.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}