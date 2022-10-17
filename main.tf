resource "aws_instance" "server123" {
 tags = {
    Name = "HelloWorld"
  }
  ami                       = "ami-08df646e18b182346"
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = aws_key_pair.generated_key.key_name


  root_block_device {
    volume_size           = var.volume_size
    delete_on_termination = var.delete_on_termination
  }
}

resource "tls_private_key" "tls_private_key" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.tls_private_key.public_key_openssh
}


resource "aws_volume_attachment" "volume_attachment" {
  device_name = var.device_name
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = aws_instance.server123.id
}
resource "aws_ebs_volume" "ebs_volume" {
  # region = var.region
  availability_zone = var.availability_zone
  size              = var.size
  type              = var.type
  encrypted         = var.encrypted
  # region = "us-west-2"
}
resource "aws_iam_role" "example" {
  name               = "example"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": ["sts:AssumeRole"],
      "Effect": "allow",
      "Principal": {
        "Service": ["backup.amazonaws.com"]
      }
    }
  ]
}
POLICY
}


resource "aws_iam_role_policy_attachment" "example" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
  role       = aws_iam_role.example.name
}

resource "aws_backup_vault" "test" {
  name        = "example_backup_vault"
  tags = {
    Role    = "backup-vault"
  }
}

resource "aws_backup_plan" "backup_plan" {
  name = var.name

  rule {
    rule_name         = var.rule_name
    target_vault_name = aws_backup_vault.test.name
    schedule          = var.schedule
    start_window      = 60
    completion_window = 120

    lifecycle {
      delete_after = var.delete_after
    }
  }
}
resource "aws_backup_selection" "example1" {
    iam_role_arn = aws_iam_role.example.arn
    name         = var.selection_name
    plan_id      = aws_backup_plan.backup_plan.id

    resources = [
      aws_instance.server123.arn,
      aws_ebs_volume.ebs_volume.arn
    ]
}
