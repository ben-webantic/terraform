/**
 * Virtual Private Cloud Resources
 */

# VPC 
resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr}"
  tags {
    Name = "${var.vpc_name}"
  }
}

# Internet gateway for the public subnet
resource "aws_internet_gateway" "gateway" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Name = "${var.vpc_gateway_name}"
  }
}

# Public subnet
resource "aws_subnet" "subnet" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.vpc_cidr}"
  availability_zone = "${var.vpc_availability_zone}"
  tags {
    Name = "${var.vpc_subnet_name}"
  }
}

# Routing table for public subnet
resource "aws_route_table" "routes" {
  vpc_id = "${aws_vpc.vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gateway.id}"
  }
  tags {
    Name = "${var.vpc_routes_name}"
  }
}

# ECS Instance Security group

resource "aws_security_group" "security-group" {
  name = "${var.vpc_security_group_name}"
  description = "Test public access security group"
  vpc_id = "${aws_vpc.vpc.id}"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  ingress {
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = [
      "${var.test_public_01_cidr}",
      "${var.test_public_02_cidr}"
    ]
  }

  egress {
    # allow all traffic to private SN
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags {
    Name = "${var.vpc_security_group_name}"
  }
}

