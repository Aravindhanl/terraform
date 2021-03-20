terraform {
    backend "s3" {
     bucket = "terraform-statef"
     key = "ec2"
    }
        
}