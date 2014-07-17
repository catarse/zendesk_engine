class ZendeskEngine::TicketsController < ZendeskEngine::BaseController
  respond_to :json

  delegate :users, :tickets, to: :client

  def create
    render json: tickets.create(permitted_params[:ticket].merge(submitter_id: user.id))
  end

  private
  def user
    users.search(query: "email:#{params[:user][:email]}").first || users.create(permitted_params[:user])
  end

  def permitted_params
    params.permit user: [:name, :email], ticket: [:subject, :priority, comment: [:value]]
  end
end
