locals {
  instance_defaults = {
    instance_type = "t2.micro"
    tags          = {
      Maintainer = "doz@ciklum.com"
    }
  }
}

data "aws_ami" "amazon23" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}


resource "aws_instance" "server1" {
  ami           = data.aws_ami.amazon23.id
  instance_type = local.instance_defaults.instance_type
  subnet_id     = data.aws_subnets.main.ids[0]
  root_block_device {
    volume_size = 12
  }

  tags = merge(
    local.instance_defaults.tags,
    {
      Name = "orion"
    }
  )
}

resource "aws_instance" "server2" {
  ami           = data.aws_ami.amazon23.id
  instance_type = local.instance_defaults.instance_type
  subnet_id     = data.aws_subnets.main.ids[0]
  root_block_device {
    volume_size = 11
  }

  tags = merge(
    local.instance_defaults.tags,
    {
      Name = "aquarius"
    }
  )
}

resource "aws_instance" "server3" {
  ami           = data.aws_ami.amazon23.id
  instance_type = local.instance_defaults.instance_type
  subnet_id     = data.aws_subnets.main.ids[0]
  root_block_device {
    volume_size = 10
  }

  ebs_block_device {
    device_name = "/dev/xvdb"
    volume_size = 9
  }

  tags = merge(
    local.instance_defaults.tags,
    {
      Name = "altair"
    }
  )
}
