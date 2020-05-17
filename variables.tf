variable "aws_account_id" {
  type        = "string"
  description = "AWS account ID. Used with `ami_lookup_filter`."
}

variable "ami_id" {
  type        = "string"
  description = "AMI ID to use for the EC2 instance's OS."
  default     = ""
}

variable "ami_lookup_filter" {
  type        = "string"
  description = "String that is used to lookup the AMI to use. To specify a specific AMI, use `ami_id`. Defaults to latest build of Amazon Linux 2."
  default     = "amzn2-ami-hvm-*-x86_64-gp2"
}

variable "associate_public_ip_address" {
  type        = "string"
  description = "Boolean to control whether the EC2 instance gets a public IP. Defaults to `false`."
  default     = false
}

variable "ip_address" {
  type        = "string"
  description = "A static IP address for the EC2 instance. Omitting it will generated an IP in the specified subnet."
  default     = ""
}

variable "name" {
  type        = "string"
  description = "Name of the project the EC2 instance is being created for."
}

variable "region" {
  type        = "string"
  description = "The AWS region to use."
  default     = "us-east-1"
}

variable "security_group_id" {
  type        = "string"
  description = "ID of security group attached to the EC2 instance."
  default     = ""
}

variable "ssh_key_name" {
  type        = "string"
  description = "SSH key to attach to the EC2 instance. Must be created beforehand."
}

variable "size" {
  type        = "string"
  description = "Size of the EC2 instance."
}

variable "ssh_ip" {
  type        = "string"
  description = "Specify IP address to allow SSH access to the EC2 instace (such as your IP)."
  default     = ""
}

variable "subnet_id" {
  type        = "string"
  description = "Subnet ID to house the EC2 instance."
}

variable "tags" {
  type        = "map"
  description = "A map of tags to apply to all resources"
}

variable "volume_size" {
  type        = "string"
  description = "Size of primary disk of the EC2 instance."
}

variable "vpc_id" {
  type        = "string"
  description = "VPC to place the EC2 instance in."
}
