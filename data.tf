data "aws_ami" "ami" {
  most_recent      = true
  owners           = ["${var.aws_account_id}"]
  executable_users = ["self"]

  filter {
    name   = "name"
    values = ["${var.ami_lookup_filter}"]
  }
}

data "template_file" "userdata" {
  template = "${file("${path.module}/files/userdata.sh")}"
}

data "aws_iam_policy_document" "ec2_trust_policy" {
  statement {
    sid    = "AllowEC2Assume"
    effect = "Allow"

    principals = {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole",
    ]
  }
}

data "aws_iam_policy_document" "iam" {
  statement {
    sid    = "AllowAttachENI"
    effect = "Allow"

    actions = [
      "ec2:AttachNetworkInterface",
    ]

    resources = ["*"]
  }
}
