require 'aws-sdk'

Aws.config.update(
  {
    region:      'us-west-2',
    credentials: Aws::Credentials.new('AKIAJ65NHDV2YKMPYKEA', '08PijC+DkFoEBn68/wzm39//3Uh1yJO/o3oYuv29') # TODO: COULD'VE USED ENVIRONMENT VARIABLE
  }
)

aws_client = Aws::S3::Client.new(region: 'us-west-2') # TODO: COULD'VE USED ENVIRONMENT VARIABLE

#= S3 Buckets
AWS_S3_BUCKET_FIELDWIRE = Aws::S3::Bucket.new('fieldwire-interview', { client: aws_client })

#= CloudFront URLs
AWS_CF_FIELDWIRE_URL = 'http://d2beek8ho38l70.cloudfront.net'