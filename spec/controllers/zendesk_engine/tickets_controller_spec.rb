require 'spec_helper'

describe ZendeskEngine::TicketsController do
  subject{ response }

  let(:tickets){ double("zendesk tickets") }
  let(:users){ double("zendesk users") }
  let(:zendesk_client){ double("zendesk client", tickets: tickets, users: users) }

  before do
    allow(controller).to receive(:client).and_return(zendesk_client)
  end

  describe "POST create" do
    let(:user){ double("user object", id: 1) }
    let(:name){ 'Diogo' }
    let(:email){ 'diogo@biazus.me' }
    let(:comment){ 'I want to open a ticket' }
    before do
      set_expectations
      allow(tickets).to receive(:create).with(subject: "I want to open a ticket", comment: {value: "I want to open a ticket"}, submitter_id: 1)
      get :create, user: {email: email, name: name}, ticket: {subject: comment, comment: {value: comment}}, format: :json, use_route: :zendesk_engine
    end

    context "when it's a new user" do
      let(:set_expectations) do
        allow(users).to receive(:search).with(query: "email:#{email}").and_return([])
        allow(users).to receive(:create).with(email: email, name: name).and_return(user)
      end

      it{ should be_success }
    end

    context "when user already exists" do
      let(:set_expectations) do
        allow(users).to receive(:search).with(query: "email:#{email}").and_return([user])
      end

      it{ should be_success }
    end
  end
end
