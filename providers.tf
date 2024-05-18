## Repeating myself several times here, since Terraform does not support instantiating the provider dynamically.

provider "aws" {
  region = "us-east-2"
}

provider "aws" {
  region = "af-south-1"
  alias  = "af-south-1"
}

provider "aws" {
  region = "eu-west-2"
  alias  = "eu-west-2"
}

provider "aws" {
  region = "sa-east-1"
  alias  = "sa-east-1"
}