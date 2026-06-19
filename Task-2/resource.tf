# Resource Block -

# The resource block is used to define the resources that you want to create in your infrastructure. In this case, we are creating an AWS EC2 instance using the "aws_instance" resource type. The resource block specifies the region, instance type, and tags for the instance.
resource "aws_instance" "example" {
  region        = "ap-south-1" # Mumbai region
  ami           = "ami-01a00762f46d584a1" # This is the Amazon Machine Image (AMI) ID for the instance. The AMI ID is a unique identifier for the image that you want to use to launch the instance. In this case, we are using an Ubuntu 20.04 LTS AMI.
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}



# S3 Bucket Resource
resource "aws_s3_bucket" "example" {
  bucket = "indranil-mondal-tf-test-bucket-2026"
  region = "ap-southeast-1" # singapore region 

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}