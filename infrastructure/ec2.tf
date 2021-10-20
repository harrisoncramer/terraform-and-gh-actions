variable "availability_zone" {
  description = "Availability zone of resources"
  type        = string
  default     = "us-east-1a"
}

variable "instance_ami" {
  description = "ID of the AMI used"
  type        = string
  default     = "ami-09e67e426f25ce0d7"
}

variable "instance_type" {
  description = "Type of the instance"
  type        = string
  default     = "t2.micro"
}

# Should be configured by the deployer to match key at ~/.ssh/your_public_key
variable "ssh_public_key" {
  description = "Public SSH key for logging into EC2 instances."
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCbWHJViNcyvE/RgspZgk0Ns37Wrx9zk25/t4o77e0irglTt9PJqKFSXx0c/hkPvOzgGEjXXIRYzIQgTL9SNBzn4dDE9SGjwQ3DL269BclKvzAmYErNIZaCUI37WzuVF9I/LHS5uVHV/JcIhBq6n0o+PfrkitZEyDO1FW7IQ4ivFcShRNwLT6XlTGz90DU2kg5BMTVbc3swjeC6FKx8VCQuXAVNVNgOqzLGNhjyWj5mNYW5JzHqg8fPEUxKfbGh266F8CkQsjCSQDeCSwkulSwbfhqoctkrtgzvfhKTxnJ7Nl2Fnr3LrIs+i3BlpYCHWAndSPPEh1D4WVXlxQcOOl37yzD93Z1dsODMm+7jEPSIu9dc9VCcrEtgXJDitwY8YsPZ080LmBxPFlASTSZA7pjHvjRk8THL6fW/S4NRozU0pZeDKtsJE8FLDX5xXphBsZ5JguCLvDOxJe+1Tj4TUz9IdSGILPyBUew5VlPFb0PY+Ix1JnEImqPyxFHa7RKYrVs= harrisoncramer@myPc.fios-router.home"
}

resource "aws_key_pair" "gha-terraform-key" {
  key_name   = "gha-terraform-key"
  public_key = var.ssh_public_key
}

resource "aws_instance" "terraform-gha" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  availability_zone           = var.availability_zone
  vpc_security_group_ids      = [aws_security_group.terraform-gha.id]
  associate_public_ip_address = true

  key_name = "gha-terraform-key"

  tags = {
    Name = "terraform-gha"
  }
}
