# terraform block - terraform configaration file
# This block is used to specify the required providers and their versions for the terraform configuration. In this case, we are specifying that we need the AWS provider with a version of 6.0 or higher.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

#