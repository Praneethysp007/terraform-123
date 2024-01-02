resource "aws_instance" "expinstance" {
    ami = data.aws_ami.ubuntu.id
    associate_public_ip_address = true
    instance_type = var.instance_type
    key_name = "ysp"
    vpc_security_group_ids = [ "sg-083730b909982cac3" ]
    

   connection {
     type = "ssh"
     user = "ubuntu"
     private_key = file(var.privatekey)
     host = self.public_ip

   }
   provisioner "remote-exec" {
    inline = [ 
      
    ]
     
   }
   provisioner "file" {
    source = "praneeth.txt"
    destination = "/home/ubuntu/praneeth.txt"
     
   }


}
 
  




  
