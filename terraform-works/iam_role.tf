resource "aws_iam_role" "docker_registry" {
    name = "docker_registry_role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "docker" {
    name = "docker_registry_policy"
    role = "${aws_iam_role.docker_registry.id}"
    policy = "${aws_iam_policy.docker_registry_policy.policy}"
}
