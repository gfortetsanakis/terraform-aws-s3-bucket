## Terraform module for creating S3 buckets

This modules creates a new S3 bucket on AWS along with a corresponding IAM policy which provides read and write access to the bucket. This policy can then be attached to IAM users and roles.

## Module input parameters

| Parameter   | Description                                                                                                |
| ----------- | ------------------------------------------- |
| bucket_name | The name of the bucket to be created        |
| bucket_tag  | A short tag used to identify the new bucket |


## Module output parameters

| Parameter            | Description                                                                         |
| -------------------- | ----------------------------------------------------------------------------------- |
| s3_access_policy_arn | The ARN of the created IAM policy providing read and write access to the new bucket |