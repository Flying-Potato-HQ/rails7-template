require_relative '../secrets/secrets' if Rails.env.development?
require 'zip'

module CodeDeploy

  def self.deploy_code
    build_contents
    # create_buckets

    puts "Uploading app contents to S3 bucket #{deploy_bucket}"
    s3.put_object(bucket: deploy_bucket, key: deploy_bucket_key, body: zip_project)
    puts "Finished uploading app contents to S3 bucket #{deploy_bucket}"

    # puts "Creating CodeBuild project #{project_name}"
    # codebuild.create_project({
    #   name: 'test-project',
    #   source: source,
    #   environment: environment,
    #   artifacts: artifacts,
    #   service_role: 'arn:aws:iam::123456789012:role/service-role/codebuild-my-role',
    #   buildspec: buildspec
    # })
    # puts "Finished creating CodeBuild project #{project_name}"
  end

  private

  def self.s3
    @s3 ||= Aws::S3::Client.new
  end

  def self.codebuild
    @code_deploy_client ||= AWS::CodeDeploy::Client.new
  end

  def self.app_contents
    @app_contents ||= build_contents
  end

  def self.build_contents
    @app_contents = []

    Dir.glob("#{project_dir}/**/*", File::FNM_DOTMATCH).each do |file|
      next if ['.', '..', '.git'].include?(File.basename(file)) || File.directory?(file)
      @app_contents << File.read(file)
    end

    @app_contents
  end

  def self.create_buckets
    deploy_bucket_exists = false
    deploy_artifacts_bucket_exists = false

    # check if bucket deploy_bucket exists
    Aws::S3::Client.new.list_buckets.buckets.each do |bucket|
      if bucket.name == deploy_bucket
        puts "Bucket #{deploy_bucket} already exists"
        deploy_bucket_exists = true
      elsif bucket.name == deploy_artifacts_bucket_exists
        puts "Bucket #{deploy_artifacts_bucket_exists} already exists"
        deploy_artifacts_bucket_exists = true
      elsif deploy_bucket_exists && deploy_artifacts_bucket_exists
        break
      end

      unless deploy_bucket_exists
        puts "Creating bucket #{deploy_bucket}"
        Aws::S3::Client.new.create_bucket(bucket: deploy_bucket)
        puts "Bucket #{deploy_bucket} created"
      end

      unless deploy_artifacts_bucket_exists
        puts "Creating bucket #{deploy_artifacts_bucket}"
        Aws::S3::Client.new.create_bucket(bucket: deploy_artifacts_bucket)
        puts "Bucket #{deploy_artifacts_bucket} created"
      end
    end
  end

  def self.build_spec
    yaml_file = File.join(__dir__, 'build_spec.yml')
    YAML.parse(yaml_file)
  end

  def self.contents

    @contents ||= File.read(__dir__)
  end

  def self.source
    {
      # type: 'GITHUB',
      # location: 'https://github.com/my-org/my-repo'
      type: 'S3',
      location: "s3://#{deploy_bucket}/#{key}"
    }
  end

  def self.environment
    {
      type: 'LINUX_CONTAINER',
      image: 'aws/codebuild/ruby:3.2.1',
      compute_type: 'BUILD_GENERAL1_SMALL'
    }
  end

  def self.artifacts
    {
      type: 'S3',
      location: "#{deploy_artifacts_bucket}/#{ Time.zone.now.to_date}/artifacts.zip"
    }
  end

  def self.project_dir
    Dir.pwd
  end

  def self.deploy_bucket
    ENV['DEPLOY_BUCKET']
  end

  def self.deploy_bucket_key
    ENV['DEPLOY_BUCKET_KEY']
  end

  def self.deploy_artifacts_bucket
    ENV['DEPLOY_ARTIFACTS_BUCKET']
  end

  def self.deploy_artifacts_bucket_key
    ENV['DEPLOY_ARTIFACTS_BUCKET_KEY']
  end

  def self.zip_project
    zip_filename = 'rails-app.zip'

    rails_dir = Dir.pwd

    Zip::File.open(zip_filename, Zip::File::CREATE) do |zipfile|
      Dir[File.join(rails_dir, '**', '**')].each do |file|
        zipfile.add(file.sub(rails_dir + '/', ''), file)
      end
    end

  end
end
