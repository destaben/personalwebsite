# personalwebsite

## Prerequisites:
- Node 12 - sudo apt -y install nodejs
- Terraform cli v0.13 (https://learn.hashicorp.com/tutorials/terraform/install-cli)
- awscli v2 (https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- AWS programatic user with AmazonS3FullAccess, CloudFrontFullAccess, AWSCertificateManagerFullAccess, IAMFullAccess, AmazonSNSFullAccess, CodeBuildFullAccess, AWSCodePipeline_FullAccess and CloudWatchFullAccess.
- Github account with access token created (https://github.com/settings/tokens), with the following permissions:
    - admin:repo_hook
    - repo

## Steps:
- terraform init
- terraform apply -var-file=./pro.tfvars (Check table pro.tfvars)
- Wait until aws_acm_certificate_validation.cert_validation resource creation procress, get into AWS check DNS verification information and create given CNAME in DNS provider.
- Create a CNAME record in your DNS provider with your domain_name value and Cloudfront distribution endpoint, instructions with values will be shown as final output.

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
|aws_region                 |Region                                                           |'string'             |
|environment                |Environment name                                                 |'string'             |
|domain_name                |Domain name                                                      |'string'             |
|github_owner               |Github owner nickname                                            |'string'             |
|github_token               |Generated GitHub token                                           |'string'             |
|alerting_sms_number        |Phone number to alert                                            |'string'             |

## Additional information
Using this theme: https://github.com/wkocjan/gatsby-theme-intro