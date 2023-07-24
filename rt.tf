
resource "aws_route_table" "jenkins_priv_rt" {
    vpc_id = aws_vpc.jenkins_vpc.id
}

resource "aws_route_table" "jenkins_pub_rt" {
    vpc_id = aws_vpc.jenkins_vpc.id
}


resource "aws_route_table_association" "jenkins-pub-sub1-rt-association" {
    route_table_id = aws_route_table.jenkins_pub_rt.id
    subnet_id = aws_subnet.jenkins_pub_sub1.id
}

resource "aws_route_table_association" "jenkins-pub-sub2-rt-association" {
    route_table_id = aws_route_table.jenkins_pub_rt.id
    subnet_id = aws_subnet.jenkins_pub_sub2.id
}

resource "aws_route_table_association" "jenkins-priv-rt-association" {
    route_table_id = aws_route_table.jenkins_priv_rt.id
    subnet_id = aws_subnet.jenkins_priv_sub.id
}



resource "aws_route" "route-pub-rt" {
  route_table_id = aws_route_table.jenkins_pub_rt.id
  destination_cidr_block = var.rt_destination_cidr
  gateway_id = aws_internet_gateway.jenkins_gw.id

}

resource "aws_route" "route-priv1-rt" {
  route_table_id = aws_route_table.jenkins_priv_rt.id
  destination_cidr_block = var.rt_destination_cidr
  gateway_id = aws_internet_gateway.jenkins_gw.id

}
