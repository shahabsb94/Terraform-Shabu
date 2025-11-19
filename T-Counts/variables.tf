variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "This is an RHEL9 AMI"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "This is the instance type of EC2"
}

variable "Enviroment" {
  type    = string
  default = "dev"
}

variable "instances" {
  default = ["mysql", "backend", "frontend"]
}

variable "instance_tags" {
  type = map(any)
  default = {
    project    = "expense"
    Component  = "backend"
    Enviroment = "dev"
    Name       = "expense-backend-dev"
  }
}

variable "ingress_from_port" {
  type    = number
  default = 22
}
variable "ingress_to_port" {
  type    = number
  default = 22
}

variable "egress_from_port" {
  type    = number
  default = 0
}
variable "egress_to_port" {
  type    = number
  default = 0
}

variable "ingress_protocol" {
  type    = string
  default = "tcp"
}
variable "egress_protocol" {
  type    = number
  default = "-1"
}

variable "cidr_blocks" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  type = map(any)
  default = {
    Name = "expense-backend-dev"
  }
}

variable "sg-name" {
  type    = string
  default = "Shabu-Security"
}

variable "Sg_description" {
  type    = string
  default = "allow-all with out any restriciton"
}

# 1. command line variables are high priority variables ------> -var "var_name"="var-value"
# 2. terraform.tfvars are 2nd high priority and terraform variables 
# 3. Enviromental variable takes 3rd priority
# 4. default values present in variable.tf 
# 5. if default values and no other variableare defined then terraform ask in the user prompt
