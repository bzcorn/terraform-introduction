resource "aws_subnet" "docker_subnet" {
    vpc_id = "${var.vpc_id}"               # Which VPC to build this subnet in
    cidr_block = "172.31.128.0/24"                             # What CIDR Block to Assign
    availability_zone = "eu-west-1a"                      # What AZ to put this subnet in
    tags {
        Name = "Docker"
    }
}
