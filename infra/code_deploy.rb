require_relative '../secrets/secrets' if Rails.env.development?
require 'zip'

module CodeDeploy

  def self.deploy
    resp = client.create_deployment({
      application_name: 'potato',
      deployment_group_name: 'potato',
      revision: {
        revision_type: 'S3',
        gibhub_location: {
          repository: 'todo',
          commit_id: 'master'
        }
      }})
  end

  private

  def self.client
    @client ||= Aws::CodeDeploy::Client.new(region: 'ap-southeast-2')
  end
end
