resource "aws_iam_policy" "docker_registry_policy" {
    name = "docker_registry_policy"
    path = "/"
    description = "Docker Registry Policy"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.kozak.id}/*"
    }
  ]
}
EOF
}
