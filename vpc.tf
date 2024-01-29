# Take first avaiable VPC and first available subnet
data "aws_vpc" "main" {
  state = "available"
}

data "aws_subnets" "main" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }
}