require "zendesk_api"

class ZendeskEngine::BaseController < ZendeskEngine.parent_controller.constantize
  private
  def client
    @client ||= ZendeskAPI::Client.new do |config|
      config.url = ZendeskEngine.url

      # Basic / Token Authentication
      config.username = ZendeskEngine.user

      # Choose one of the following depending on your authentication choice
      config.token = ZendeskEngine.token

      # OAuth Authentication
      #config.access_token = "your OAuth access token"

      # Optional:

      # Retry uses middleware to notify the user
      # when hitting the rate limit, sleep automatically,
      # then retry the request.
      config.retry = true
    end
  end
end

