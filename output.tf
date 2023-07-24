output "vpc_id" {
    value = aws_vpc.jenkins_vpc.id
}

output "pub_subnet1" {
    value = aws_subnet.jenkins_pub_sub1.id
}
output "pub_subnet2" {
    value = aws_subnet.jenkins_pub_sub2.id
}

output "priv_subnet" {
    value = aws_subnet.jenkins_priv_sub.id
}
