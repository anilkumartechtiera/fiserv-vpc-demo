variable "vpcid" {}
variable "priv_sub_cidr" {}
variable "priv_sub_az" {}
variable "pub_sub1_cidr" {}
variable "pub_sub1_az" {}
variable "pub_sub2_cidr" {}
variable "pub_sub2_az" {}
variable "rt_destination_cidr" {}
variable "region" {}
variable "access_key" {
    type = string
}
variable "secret_key" {
    type = string
}
