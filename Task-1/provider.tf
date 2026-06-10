# credentials of the provider - This block is used to specify the credentials for the AWS provider. In this case, we are using the default profile from the AWS CLI configuration.

provider "aws" {
  region = "ap-south-1"
  access_key = "***"
  secret_key = "***"
}