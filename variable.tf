# variable "ami" {
#   description = "ID of AMI to use for the instance"
#   type        = string
# }

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
}

variable "associate_public_ip_address" {
  description = "Is an optional and computed value"
  type        = bool
}

variable "key_name" {
  description = "Is an name for key pair"
  type        = string 
 
}

variable "volume_size" {
  description = "Whether to create an instance Size of the root volume in gigabytes"
  type        = number
}

variable "delete_on_termination" {
  description = "the volume will automatically be deleted when you destroy the instance"
  type        = bool
}

variable "algorithm" {
  description = "AWS Backup independently encrypts a backup, it uses the industry-standard AES-256 encryption algorithm"
  type        = string
}

variable "rsa_bits" {
  description = "the key pair and give Amazon Web Services just the public key"
  type        = number
}


variable "device_name" {
  description = "The device name exposed to the EC2 instance"
  type        = string
}

# variable "volume_id" {
#   description = "ID of the Volume to be attached"
#   type        = string
# }

# variable "instance_id" {
#   description = "ID of the Instance to attach to"
#   type        = string
# }

variable "availability_zone" {
  description = "enable user to create a restore volume to a specified availability_zone"
  type        = string
}

variable "size" {
  description = "The size of the drive in GiBs."
  type        = number
}

variable "type" {
  description = "The type of EBS volume"
  type        = string
}

variable "encrypted" {
  description = "If true, the disk will be encrypted"
  type        = bool
}

variable "rule_name" {
  description = "An display name for a backup rule"
  type        = string
}


# variable "target_vault_name" {
#   description = "The name of a logical container where backups are stored."
#   type        = string
# }


variable "schedule" {
  description = "A CRON expression specifying when AWS Backup initiates a backup job."
  type        = string
}


variable "delete_after" {
  description = " Specifies the number of days after creation that a recovery point is deleted"
  type        = number
}


variable "WindowsVSS" {
  description = " This enables you to take application-consistent Windows VSS backups"
  type        = string
}

variable "resource_type" {
  description = " The type of AWS resource to be backed up. For VSS Windows backups"
  type        = string
}


variable "name" {
  description = "Name to be used on EC2 instance created"
  type        = string
}


# variable "region" {
#   description = "AWS Region the instance is launched in"
#   type        = string
# }

variable "iam_role_arn" {
  description = "The ARN of the IAM role that AWS Backup uses to authenticate when restoring and backing up the target resource"
  type        = string
}


variable "selection_name" {
  description = "The display name of a resource selection document"
  type        = string
}