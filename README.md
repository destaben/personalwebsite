# personalwebsite

## Prerequisites:
- AWS programatic user with AmazonS3FullAccess, CloudFrontFullAccess, AWSCertificateManagerFullAccess, IAMFullAccess, AmazonSNSFullAccess, CodeBuildFullAccess, AWSCodePipeline_FullAccess, AmazonDynamoDBFullAccess and CloudWatchFullAccess.
- Github account with access token created (https://github.com/settings/tokens), with the following permissions:
    - admin:repo_hook
    - repo
- Create an S3 bucket and a DynamoDB to use in backend configuration, names need to be change in backend.tfvars file.

## Steps:
- Push code to the repo.
- Check CodeBuild console and wait until aws_acm_certificate_validation.cert_validation resource creation procress, get into AWS check DNS verification information and create given CNAME in DNS provider.
- Create a CNAME record in your DNS provider with your domain_name value and Cloudfront distribution endpoint, instructions with values will be shown as final output.

## Terraform 0.13 Providers

|     Name     |   Version   |
|--------------|-------------|
|     aws      |  ~> 3.48.0  |
|   github     |  ~> 4.12.1  |

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