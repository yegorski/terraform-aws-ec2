# AWS EC2 Instance Terraform Module

Terraform module to create an AWS EC2 instance.

> You can set up VPC and subnets with [terraform-aws-account-scaffolding][].

## Usage

Variables in all caps need to be replaced, as well as other as desired.

```terraform
module "ec2" {
  source = "git::https://github.com/yegorski/terraform-aws-ec2.git?ref=master"

  ami_id      = "AMI_ID"  # or use `ami_lookup_filter`
  name        = "SERVER_NAME"
  size        = "t3.large"    # 2 CPU, 8 GB, for example
  volume_size = "50"

  aws_account_id              = "AWS_ACCOUNT_ID"
  subnet_id                   = "${data.aws_subnet_ids.private.ids[0]}"
  associate_public_ip_address = false
  ssh_ip                      = "VISIT_IPCHICKEN"

  ssh_key_name = "PUBLIC_KEY_NAME"

  tags = {
    Owner       = "yegorski"
    Environment = "production"
  }
}
```

[terraform-aws-account-scaffolding]: https://github.com/yegorski/terraform-aws-account-scaffolding
