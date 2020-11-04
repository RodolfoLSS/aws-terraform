# AWS + Terraform

Some Terraforms to stand up an AWS EC2 instance. 

## How to use

To build your EC2 instance, you need to set your aws credential in your terminal and change the path to your public key and the replace the name of your elastic IP in `terraform/prod.tfvars`. 

In addition, you should change the `backend s3` and `provider "aws"` configuration ins `main.tf` to yours.

After this, run the following command and it is done:

```bash 
source deploy.sh
```

If you want destroy your instance:

```bash
source destry.sh
```