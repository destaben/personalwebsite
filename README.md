# personalwebsite

## Prerequisites:
- Node 12 (sudo apt -y install nodejs)
- Terraform cli v0.13 (https://learn.hashicorp.com/tutorials/terraform/install-cli)

## Steps:
- terraform init
- terraform apply -var-file=./pro.tfvars (Check table)
- Wait until cert_validation resource creation procress, get into AWS and create needed CNAME in DNS provider.
- Create a CNAME record in your DNS provider with your domain_name value and the output from this command: terraform state show aws_cloudfront_distribution.www_distribution | grep ^domain_name

## Terraform 0.13 Providers

|     Name     |   Version   |
|--------------|-------------|
|     aws      |  ~> 3.44.0  |
|   archive    |  ~> 2.2.0   |
|    null      |  ~> 3.1.0   |

## pro.tfvars

|          Nombre           |                        Descripción                              |        Tipo         |
|---------------------------|-----------------------------------------------------------------|---------------------|
|aws_access_key             |AWS access key                                                   |'string'             |
|aws_secret_key             |AWS secret key                                                   |'string'             |
|location                   |Region                                                           |'string'             |
|environment                |Environment name                                                 |'string'             |
|domain_name                |Domain name                                                      |'string'             |

## Additional information
Using this theme: https://github.com/wkocjan/gatsby-theme-intro