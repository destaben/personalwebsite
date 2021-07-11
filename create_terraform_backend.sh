#!/bin/bash
DYNAMODB_NAME=$1
BUCKET_NAME=$2
AWS_REGION=$3

DB=$(aws dynamodb describe-table --table-name $DYNAMODB_NAME --output text --query 'Table.TableName' || true)
if [ -z "$DB" ]; then
    aws dynamodb create-table --table-name $DYNAMODB_NAME --output text --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5
    echo "$DYNAMODB_NAME created"
else
    echo "$DYNAMODB_NAME already exists"
fi
BUCKET=$(aws s3 ls s3://$BUCKET_NAME || true)
if [ -z "$BUCKET" ]; then
    aws s3api create-bucket –bucket $BUCKET_NAME --output text –region $AWS_REGION –create-bucket-configuration LocationConstraint=$AWS_REGION
    aws s3api put-bucket-encryption –bucket $BUCKET_NAME --output text –server-side-encryption-configuration "{\'Rules\': [{\'ApplyServerSideEncryptionByDefault\':{\'SSEAlgorithm\': \'AES256\'}}]}"
    aws s3api put-bucket-versioning --bucket $BUCKET_NAME --output text --versioning-configuration Status=Enabled
    echo "$BUCKET_NAME created"
else
    echo "$BUCKET_NAME already exists"
fi