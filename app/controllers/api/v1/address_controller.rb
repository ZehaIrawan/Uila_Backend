class  Api::V1::AddressController < ApiController
  rescue_from ActionController::ParameterMissing, :with => :param_missing

  def index
    render json:current_user.address
  end

  def create
      @address = current_user.address.new(address_params)
      if @address.save
        render json: @address
      else
        render json: { errors: @address.errors }
      end
  end

  def destroy
      @address = Address.find(params[:id])
      @address.destroy
      render json:{status:'Address has been deleted'}
  end

  private
  def address_params
        params.permit(:full_name, :addressline1, :addressline2,:city, :state, :zipcode, :phone)
  end

  def param_missing(error)
    render json: { error: error.message }
  end
end
