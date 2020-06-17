class Api::V1::UpgradeController < ApiController
  def create
    if !current_user.admin? && params[:code] === 'abc'
      current_user.update_attribute :admin, true
      render json: {success:'Upgraded!',admin:current_user.admin?,params:params[:code]}
    else
      render json: { errors: 'Your code is not valid' }
    end
  end
end
