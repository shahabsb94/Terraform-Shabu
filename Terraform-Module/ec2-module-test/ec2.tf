module "expense" {
    source = "../ec2-module"
    sg_id = "sg-08a41470b89561bb9"
}

output "public_ip" {
  value = module.expense.public_ip
}