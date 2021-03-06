# personalwebsite
Full code of my website.

## Prerequisites:
- AWS programatic user with this "base_user_policy.json" attached. Use this information to fill pro.tfvars.
- Github account with access token created (https://github.com/settings/tokens), with the following permissions:
    - admin:repo_hook
    - repo
- Create an S3 bucket and a DynamoDB to use in backend configuration, using "./create_terraform_backend.sh DYNAMODB_NAME BUCKET_NAME AWS_REGION"

## First configuration:
- aws configure (Credentials from previous generated user)
- terraform init -backend-config=bucket=$BUCKET_NAME -backend-config=dynamodb_table="DYNAMODB_NAME" -backend-config=key="GITHUB_REPO" -backend-config=region=$AWS_REGION
- cd infrastructure
- terraform plan -target module.build -out=tfplan -var-file=./pro.tfvars -var=aws_region="AWS_REGION" -var=github_token="GITHUB_TOKEN" -var=alerting_sms_number="ALERTING_SMS_NUMBER"
- terraform apply tfplan
- Check console and wait until aws_acm_certificate_validation.cert_validation resource creation procress, get into AWS check DNS verification information and create given CNAME in DNS provider.
- Push code to the repo.
- Create a CNAME record in your DNS provider with your domain_name value and Cloudfront distribution endpoint, check Cloudfront domain name with in AWS console.


## Terraform 1.0.1 Providers

|     Name     |   Version   |
|--------------|-------------|
|     aws      |  ~> 3.48.0  |
|   github     |  ~> 4.12.1  |

## pro.tfvars

|          Nombre           |                        Descripción                              |        Tipo         |
|---------------------------|-----------------------------------------------------------------|---------------------|
|environment                |Environment name                                                 |'string'             |
|domain_name                |Domain name                                                      |'string'             |
|github_owner               |Github owner nickname                                            |'string'             |
|github_repo                |Github repo name                                                 |'string'             |
|user_policy_arn            |ARN policy generated for user                                    |'string'             |