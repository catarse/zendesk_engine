require 'spec_helper'

describe ZendeskEngine::TicketsController do
  describe "POST create" do
    before do
      get :create, ticket: {}, format: :json, use_route: :zendesk_engine
    end
    it{ should be_success }
  end
end
