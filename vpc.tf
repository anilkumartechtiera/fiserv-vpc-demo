resource "aws_vpc" "jenkins_vpc" {
cidr_block = var.vpcid

tags = {
    Name = "jenkins_vpc"
  }

}

resource "aws_internet_gateway" "jenkins_gw" {
    vpc_id = aws_vpc.jenkins_vpc.id

}

resource "aws_eip" "ip" {
}

resource "aws_nat_gateway" "jenkins_nat" {
  allocation_id = aws_eip.ip.id
  subnet_id     = aws_subnet.dpt2_pub_sub1.id

}
