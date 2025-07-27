# All AWS CLI commands follow this structure:
aws <service> <operation> [parameters] [options]

# Example: 
aws ec2 describe-instances --region us-east-1 --output table
aws s3 ls --region us-east-1 --profile myprofile


# Output Formats- Json, Text, Table
aws ec2 describe-regions --output json
aws ec2 describe-regions --output text
aws ec2 describe-regions --output table

# Set your default output in ~/.aws/config or via:
aws configure set output json


# Filtering & Querying with --query
aws ec2 describe-regions --query "Regions[].RegionName" --output table
aws iam list-users --query "Users[].UserName" --output table

# Filter results using JMESPath syntax
aws ec2 describe-instances --query "Reservations[].Instances[?State.Name=='running'].InstanceId" --output table 
# Use --filter for specific attributes
aws ec2 describe-instances --filters "Name=instance-state-name,Values=running"
aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text


# Pagination

# Use --max-items to limit results
aws ec2 describe-instances --max-items 5 --output table
# To get the next page
aws ec2 describe-instances --starting-token <token> --max-items 5 --output table

# Use --page-size, AWS CLI will request 5 instances per internal API call.
aws ec2 describe-instances --max-items 10 --page-size 5
