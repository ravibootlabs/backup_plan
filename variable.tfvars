# ami = "ami-0149b2da6ceec4bb0"
instance_type                   = "t2.micro" 
associate_public_ip_address     = true
volume_size                     = 8
delete_on_termination           = false
algorithm                       = "RSA"
rsa_bits                        = 4690
device_name                     = "xvdh"
availability_zone               = "ap-south-1b"
size                            = 8
type                            = "standard"
encrypted                       = true
name                            = "tf_example_backup_plan"
rule_name                       = "tf_backup_rule"
schedule                        = "cron(30 7 * * ? *)"
delete_after                    = 14
 WindowsVSS = "Enabled"
 resource_type = "EC2"
 iam_role_arn = "arn:awsiam::779527285137:role/AWSdevopscerttaskrole"
 selection_name = "selection"
 key_name = "test123"