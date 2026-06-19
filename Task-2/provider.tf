# credentials of the provider - This block is used to specify the credentials for the AWS provider. In this case, we are using the default profile from the AWS CLI configuration.

provider "aws" {
  access_key = "**"
  secret_key = "**"
  region     = "ap-south-1" # default region for the provider
}

# Default provider - Mumbai
# provider "aws" {
#   alias  = "mumbai" // not required but good practice to use alias for default provider
#   region = "ap-south-1"
# }

# # Alias provider - Singapore
# provider "aws" {
#   alias  = "singapore"
#   region = "ap-southeast-1"
# }
