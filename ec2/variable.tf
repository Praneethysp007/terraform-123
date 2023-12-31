
variable "instance_type" {
    description = "this is replace instance type"
    type = string
    default = "t2.micro"
  
}
variable "key_name" {
    description = "this is replace of key name"
    type = string
    default = "ysp"
  
}
variable "publickey" {
    type = string
    default = "/home/ubuntu/.ssh/id_rsa.pub"
  
}
variable "privatekey" {
  type = string
  default = "/home/ubuntu/.ssh/id_rsa"
}