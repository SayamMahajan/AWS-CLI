# Listing and Inspecting IAM Users, Groups, and Roles

# List all IAM users
aws iam list-users --output table

# List all IAM groups
aws iam list-groups --output table

# List all IAM roles
aws iam list-roles --output table

# Get detailed info on a specific user
aws iam get-user --user-name <username> --output table
# Describe a specific IAM group
aws iam get-group --group-name <groupname> --output table


# Creating and Managing Users

# Create a new IAM user
aws iam create-user --user-name <username> 
# Attach to a group
aws iam add-user-to-group --user-name <username> --group-name <groupname>

# Create an access key for a user
aws iam create-access-key --user-name <username> --output table

# List user's access keys:
aws iam list-access-keys --user-name <username> 

# Delete an access key
aws iam delete-access-key --user-name <username> --access-key-id <access-key-id

# Delete a user
aws iam delete-user --user-name <username>


# Creating and Managing Groups and Policy Attachments 

# Create a new IAM group
aws iam create-group --group-name <groupname>

# Attach a managed policy to a group
aws iam attach-group-policy --group-name Developers --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess

# List all policies attached to a group
aws iam list-attached-group-policies --group-name Developers --output table

# Detach a managed policy from a group
aws iam detach-group-policy --group-name Developers --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess

# Remove a user from a group
aws iam remove-user-from-group --user-name <username> --group-name <groupname>

# Delete a group
aws iam delete-group --group-name <groupname>


# Roles for EC2 and Services

# Create a role for EC2 (trust policy inline as a file)
aws iam create-role --role-name EC2Role --assume-role-policy-document file://trust-policy.json

# Attach a policy to a role
aws iam attach-role-policy --role-name EC2Role --policy-arn arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess

# List policies attached to a specific role
aws iam list-attached-role-policies --role-name EC2Role --output table

# Detach a policy from a role
aws iam detach-role-policy --role-name EC2Role --policy-arn arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess

# Delete a role
aws iam delete-role --role-name EC2Role


# Inline Policies

# Create an inline policy for a user
aws iam put-user-policy --user-name <username> --policy-name <policyname> --policy-document file://inline-policy.json

# Show all policies attached to a user
aws iam list-user-policies --user-name <username> --output table

# Delete an inline policy from a user
aws iam delete-user-policy --user-name <username> --policy-name <policyname>


# Password and Login Profile Management

# Create a login profile (enable AWS Console sign-in) for a user
aws iam create-login-profile --user-name <username> --password 'StrongP@ssw0rd!' --password-reset-required

# Get the login profile for a user
aws iam get-login-profile --user-name <username> --output table

# Update user password (force reset)
aws iam update-login-profile --user-name <username> --password 'NewStr0ngP@ssw0rd!' --password-reset-required

# Delete a login profile
aws iam delete-login-profile --user-name <username> 


# Multi-Factor Authentication (MFA) with CLI

# List MFA devices for a user
aws iam list-mfa-devices --user-name <username> --output table

# Enable MFA device for a user
aws iam enable-mfa-device --user-name <username> --serial-number arn:aws:iam::<account-id>:mfa/<mfa-device-name> --authentication-code1 <code1> --authentication-code2 <code2>  --output table

# Deactivate an MFA device
aws iam deactivate-mfa-device --user-name <username> --serial-number arn:aws:iam::<account-id>:mfa/<mfa-device-name> --output table