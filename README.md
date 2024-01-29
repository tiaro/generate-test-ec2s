# About
This is project to generate a few EC2 instances for test task

# Usage
just run
```bash
terraform init
terraform apply
```
after that switch to new candidate test directory and
```bash
export AWS_PROFILE=mywork
```
and run test

# Validate results
This terraform code will produce 3 servers:

| Name     | Number of disks | Disks size |
|----------|-----------------|------------|
| aquarius | 1               | 11         |
| orion    | 1               | 12         |
| altair   | 2               | 19=10+9    |

Total: 42 GBs

# TODO:
 - Add creation of test VPC, put one instance to public subnet, two to private subnet.
 - Add outputs: private ip, public ip, instance id, instance name etc
