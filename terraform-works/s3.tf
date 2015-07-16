resource "aws_s3_bucket" "docker_registry" {
    bucket = "lunch-learn-docker2"
    acl = "public-read-write"
    tags {
        Name = "lunch-learn-docker"
        Environment = "Dev"
    }
}
