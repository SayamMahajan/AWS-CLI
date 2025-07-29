# List All S3 Buckets
aws s3 ls --output table

# Create a New S3 Bucket (mb: Make bucket)
aws s3 mb s3://<bucket-name> 

# Create a bucket in a specific region
aws s3 mb s3://<bucket-name> --region <region>
aws s3api create-bucket --bucket <bucket-name> --region <region> --create-bucket-configuration LocationConstraint=<region>


# Uploading, Downloading, and Copying Objects

# Upload a file to a bucket
aws s3 cp <local-file-path> s3://<bucket-name>/<object-key>

# Download a file from a bucket
aws s3 cp s3://<bucket-name>/<object-key> <local-file-path>

# Copy an object within the different buckets
aws s3 cp s3://<source-bucket>/<object-key> s3://<destination-bucket>/<object-key>



# Syncing Directories
aws s3 sync ./<local-directory>/ s3://<bucket-name>/
aws s3 sync s3://<bucket-name>/ ./<local-directory>/


# Deleting Objects

# Delete a file/object:
aws s3 rm s3://<bucket-name>/<object-key>

# Delete all objects in a bucket
aws s3 rm s3://<bucket-name> --recursive


# Enable Bucket Versioning 

# Enable versioning
aws s3api put-bucket-versioning --bucket <bucket-name> --versioning-configuration Status=Enabled

# Check status
aws s3api get-bucket-versioning --bucket my-unique-bucket

# List all versions of an object
aws s3api list-object-versions --bucket <bucket-name> --output table

# Delete a specific version of an object
aws s3api delete-object --bucket <bucket-name> --key <object-key> --version-id <version-id>

# Delete versioning from a bucket
aws s3api put-bucket-versioning --bucket <bucket-name> --versioning-configuration Status=Suspended


# Object and Bucket Metadata & Security

# View all bucket details
aws s3api get-bucket-location --bucket <bucket-name>
aws s3api get-bucket-acl --bucket <bucket-name>

# Make an object public (careful: only for safe/public data!)
aws s3api put-object-acl --bucket <bucket-name> --key <object-key> --acl public-read


# Server-Side Encryption
aws s3 cp <local-file-path> s3://<bucket-name>/ --sse AES256


# Tagging

# Add tags to a bucket
aws s3api put-bucket-tagging --bucket <bucket-name> --tagging 'TagSet=[{Key=Purpose,Value=Test}]'
aws s3api get-bucket-tagging --bucket <bucket-name>

# Add tags to an object
aws s3api put-object-tagging --bucket <bucket-name> --key <object-key> --tagging 'TagSet=[{Key=Environment,Value=Production}]'


# Cleanup: Remove Buckets

# Delete a bucket (must be empty)
aws s3 rb s3://my-unique-bucket

# Delete a bucket with force (removes all objects first)
aws s3 rb s3://my-unique-bucket --force