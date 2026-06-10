# Resource Block - This is a VPC resource
resource "aws_vpc" "main" {
  cidr_block = "192.168.0.0/19" // This is the CIDR block for the VPC. It defines the IP address range for the VPC. total 8192 IP addresses are available in this range.
  instance_tenancy = "default"
  region = "ap-south-1" // This is the region where the VPC will be created. We are specifying that the VPC will be created in the "ap-south-1" region.

  tags = {
    Name = "terra-vpc1" // This is a tag for the VPC. It is used to identify the VPC with a name. In this case, we are naming the VPC as "vpc1".
  }
}

# Subnet Resource Block - This is a subnet resource
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.main.id // This is the ID of the VPC that the subnet will be created in. We are referencing the ID of the VPC resource that we created above.
  cidr_block = "192.168.0.0/20"
  availability_zone = "ap-south-1b" // This is the availability zone for the subnet. We are specifying that the subnet will be created in the "ap-south-1b" availability zone.

  tags = {
    Name = "terra-subnet1" // This is a tag for the subnet. It is used to identify the subnet with a name. In this case, we are naming the subnet as "subnet1".
  }
}

# Internet Gateway Resource Block - This is an internet gateway resource
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id // This is the ID of the VPC that the internet gateway will be attached to. We are referencing the ID of the VPC resource that we created above.
    
    tags = {
        Name = "terra-igw" // This is a tag for the internet gateway. It is used to identify the internet gateway with a name. In this case, we are naming the internet gateway as "igw".
    }
}

# Route Table Resource Block - This is a route table resource [Route Table <---> VPC]
resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.main.id // This is the ID of the VPC that the route table will be created in. We are referencing the ID of the VPC resource that we created above.
    
    tags = {
        Name = "terra-rt" // This is a tag for the route table. It is used to identify the route table with a name. In this case, we are naming the route table as "rt".
    }
}

# Route Resource Block - This is a route resource
# Add a route in the Route Table pointing to the Internet Gateway [Route Table <---> Internet Gateway]
resource "aws_route" "route1" {
    route_table_id = aws_route_table.rt.id // This is the ID of the route table that the route will be added to. We are referencing the ID of the route table resource that we created above.
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id // This is the ID of the internet gateway that the route will point to. We are referencing the ID of the internet gateway resource that we created above.
}

# Route Table Association Resource Block - This is a route table association resource
# Associate the Route Table with the Subnet [Route Table <---> Subnet]
resource "aws_route_table_association" "rta1" {
    route_table_id = aws_route_table.rt.id // This is the ID of the route table that the association will be created with. We are referencing the ID of the route table resource that we created above.
    subnet_id = aws_subnet.subnet1.id // This is the ID of the subnet that the route table will be associated with. We are referencing the ID of the subnet resource that we created above.
}