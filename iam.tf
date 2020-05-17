resource "aws_iam_role" "iam" {
  name_prefix        = "${var.name}-"
  assume_role_policy = "${data.aws_iam_policy_document.ec2_trust_policy.json}"
  tags               = "${var.tags}"
}

resource "aws_iam_role_policy" "server" {
  name_prefix = "${var.name}-"
  role        = "${aws_iam_role.iam.id}"
  policy      = "${data.aws_iam_policy_document.iam.json}"
}

resource "aws_iam_instance_profile" "iam" {
  name_prefix = "${var.name}-"
  role        = "${aws_iam_role.iam.name}"
}
