module CurrentCart

  private

    def set_cart
      if current_user.current_cart.nil?
        @cart = Cart.create
        current_user.update(current_cart: @cart.id)
      else
      @cart =  Cart.find(current_user.current_cart)
      end
    end

end