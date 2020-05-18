resource "aws_instance" "server" {
  ami                                  = "${var.ami_id == "" ? data.aws_ami.ami.id : var.ami_id}"
  iam_instance_profile                 = "${aws_iam_instance_profile.iam.id}"
  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = "${var.size}"
  key_name                             = "${var.ssh_key_name}"
  user_data                            = "${base64encode(data.template_file.userdata.rendered)}"
  subnet_id                            = "${var.subnet_id}"
  security_groups                      = ["${var.security_group_id}"]

  root_block_device {
    volume_size = "${var.volume_size}"
    volume_type = "standard"
  }

  associate_public_ip_address = "${var.associate_public_ip_address}"

  lifecycle {
    ignore_changes = [
      "security_groups",
    ]
  }

  tags = "${merge(
    map("Name", "${var.name}"),
    var.tags)
  }"
}
