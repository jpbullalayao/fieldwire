module ImageUploadService

  def resize(image, size)
    image = MiniMagick::Image.open(image.path)
    image.resize("#{size}x#{size}")
  end

  def upload_to_s3(bucket, file, filename)
    s3_obj = bucket.object(filename)
    s3_obj.upload_file(file.path, acl: 'public-read')
  end

end