resource "aws_instance" "expinstance" {
    ami = data.aws_ami.ubuntu.id
    associate_public_ip_address = true
    instance_type = var.instance_type
    key_name = "ysp"
     
  provisioner "file" {
    source      = "/home/ubuntu/.ssh/id_rsa.pub"
    destination = "/home/ubuntu/authorized_keys"
  }

   connection {
     type = "ssh"
     user = "ubuntu"
     private_key = file(var.privatekey)
     host = self.private_ip
   }
   provisioner "remote-exec" {
    inline = [ 
        "sudo apt update",
        "sudo apt install openjdk-17-jdk -y",
        "wget https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar",
        "java -jar spring-petclinic-2.4.2.jar --server.port=8080"
    ]
     
   }
   provisioner "file" {
    source = "praneeth.txt"
    destination = "/home/ubuntu/praneeth.txt"
     
   }
}

 
  




  
