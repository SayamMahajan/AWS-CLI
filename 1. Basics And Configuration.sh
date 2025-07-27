# Official documentation for AWS CLI configuration:
# https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html 


# Configuration script for AWS CLI
aws configure

# This script will prompt you to enter your AWS Access Key ID, Secret Access Key, region, and output format.
# Make sure you have the AWS CLI installed before running this script


# To check your configurations:
aws configure list
aws configure list-profiles

# To examine credentials file with cat
cat ~/.aws/credentials


# To remove credentials file (if needed):
rm -f ~/.aws/credentials
rm -f ~/.aws/config


# Test who you are authenticated as:
aws sts get-caller-identity


# For help
aws help

# Service-specific help (for S3, as example):
aws s3 help


# Try a basic IAM users listing:
aws iam list-users --output table


# Edit config files in Git Bash with Linux-style editors
nano ~/.aws/credentials


# You can use environment variables to set/override credentials in a shell session:
export AWS_ACCESS_KEY_ID=your_access_key_id
export AWS_SECRET_ACCESS_KEY=your_secret_access_key

# To unset these variables after use:
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY


# For multiple profiles in scripts:
aws s3 ls --profile dev
aws s3 ls --profile prod

# Or you can set a default profile for the session:
export AWS_PROFILE=dev
# To unset the default profile:
unset AWS_PROFILE


#List all EC2 regions:
aws ec2 describe-regions --output table