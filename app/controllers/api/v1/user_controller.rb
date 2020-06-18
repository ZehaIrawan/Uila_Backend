class Api::V1::UserController < ApiController
  before_action :authenticate_user!
def index
    puts current_user.email
    render json: { user: current_user.email, isAdmin:current_user.admin? }
  end
end