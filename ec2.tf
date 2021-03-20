resource "aws_instance" "fuv1"{
    ami = var.ami_id
    instance_type = "t2.micro"
    tags = {
        name = "aravind0-terraform"
    }
    key_name = "aravind-1"
    vpc_security_group_ids = [aws_security_group.instance.id]
    user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > /var/www/html/index.html
              apt-get update
              apt-get install apache2 
              systemctl start apache2.service
              EOF
    connection {
      private_key = "${("${var.private_key_path}")}"
      host        = self.network_interface[0].ip_address
      user        = "ubuntu"
    }
}
output "instance_ip_addr" {
  value = aws_instance.fuv1.public_ip
}
