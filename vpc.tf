resource "aws_vpc" "main" {
  cidr_block = "${var.network}"

  tags {
    Name = "gunanetwork"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "10.5.1.0/24"
  availability_zone = "${var.region}a"

  tags {
    Name = "Private_a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "10.5.2.0/24"
  availability_zone = "${var.region}b"

  tags {
    Name = "Private_b"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "gunanetwork"
  }
}

resource "aws_route_table" "rpublic" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "publicnetwork"
  }
}

resource "aws_route_table_association" "private_a" {
  subnet_id      = "${aws_subnet.private_a.id}"
  route_table_id = "${aws_route_table.rpublic.id}"
}

resource "aws_route_table_association" "private_b" {
  subnet_id      = "${aws_subnet.private_b.id}"
  route_table_id = "${aws_route_table.rpublic.id}"
}
