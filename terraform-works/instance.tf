resource "aws_instance" "registry" {
    ami = "ami-a10897d6"                                        # AMI for the Instance
    instance_type = "t2.micro"                              # Just an Instance Type
    subnet_id = "${aws_subnet.docker_subnet.id}"                                  # What subnet to build in
    associate_public_ip_address = "True"                # This is actually up to VPC to decide
    vpc_security_group_ids = ["${aws_security_group.docker_sg.id}"]                   # List of Security groups to have applied
    key_name = "ansible"
    iam_instance_profile = "${aws_iam_instance_profile.docker_registry.name}"
    tags {
        Name = "docker-registry"
    }
}

resource "aws_iam_instance_profile" "docker_registry" {
    name = "docker_registry_instance_profile"
    roles = ["${aws_iam_role.docker_registry.name}"]
}
