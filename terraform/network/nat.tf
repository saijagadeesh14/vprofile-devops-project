resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "vprofile-nat-eip"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name = "vprofile-nat"
  }

  depends_on = [aws_internet_gateway.igw]
}