class Api::V1::UpgradeController < ApiController
  def create
    if !current_user.admin? && params[:upgrade_key] === Rails.application.credentials[:upgrade_key]
      current_user.update_attribute :admin, true
      render json: {success:'Upgraded!',admin:current_user.admin?}
    else
      render json: { errors: 'Your code is not valid' }
    end
  end
end
