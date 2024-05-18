## Repeating myself several times here, since Terraform does not support referencing the provider instance (tied to the region) dynamically yet.


module "spot_eu_west_2" {
  source = "./modules/ec2"

  instance_count       = 1
  iam_instance_profile = local.iam_instance_profile
  user_data            = local.user_data
  spot_price           = local.spot_price
  instance_type        = local.instance_type
  volume_size_gb       = local.volume_size_gb
  ssh_keypair_name     = local.key_name
  ssh_public_key       = tls_private_key.private_key.public_key_openssh

  providers = {
    aws = aws.eu-west-2
  }
}

module "spot_sa_east_1" {
  source = "./modules/ec2"

  instance_count       = 1
  iam_instance_profile = local.iam_instance_profile
  user_data            = local.user_data
  spot_price           = local.spot_price
  instance_type        = local.instance_type
  volume_size_gb       = local.volume_size_gb
  ssh_keypair_name     = local.key_name
  ssh_public_key       = tls_private_key.private_key.public_key_openssh

  providers = {
    aws = aws.sa-east-1
  }
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
