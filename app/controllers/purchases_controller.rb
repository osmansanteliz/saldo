class PurchasesController <  ApplicationController
  
  def new
  	@purchase = Purchase.new
	end

	def show
    @purchase = Purchase.find(params[:id])
    @packages_purchased_this_month = @purchase.user.purchases
      .where('purchase_date >= ? AND purchase_date <= ?', Date.current.beginning_of_month, Date.current.end_of_month)
      .sum(:monto)
    @packages_of_gifts = calculate_promotions(@packages_purchased_this_month)
  end	

	def create
		user = User.find_by(numero: purchase_params[:numero])
		if user.nil?
			redirect_to new_user_path, alert: 'El numero no esta registrado en la base de datos'
		else
			purchase_attributes = purchase_params.except(:user_id)
			purchase_attributes[:purchase_date] = Date.current
			@purchase = user.purchases.build(purchase_attributes)
		
			if @purchase.save
				packages_of_gifts = calculate_promotions(user)
				if packages_of_gifts.to_i > 0
          redirect_to new_user_path, notice: "Compra satisfactoria. ¡Felicidades! Has obtenido #{packages_of_gifts}."
        else
					redirect_to new_user_path, notice: 'Compra satisfactoria'
				end	
			else
				redirect_to new_user_path, alert: 'Compra no efectuada, verifique usuario'
			end
		end		
	end  

	private

	def purchase_params
		params.require(:purchase).permit(:numero, :monto, :purchase_date)
	end

	def calculate_promotions(user)
		purchases_100 = user.purchases.where(monto: 100)
                                  .where('purchase_date >= ? AND purchase_date <= ?', Date.current.beginning_of_month, Date.current.end_of_month)
                                  .count
    purchases_50 = user.purchases.where(monto: 50)
                                 .where('purchase_date >= ? AND purchase_date <= ?', Date.current.beginning_of_month, Date.current.end_of_month)
                                 .count
    purchases_20 = user.purchases.where(monto: 20)
                                 .where('purchase_date >= ? AND purchase_date <= ?', Date.current.beginning_of_month, Date.current.end_of_month)
                                 .count

    if purchases_100 >= 4
      return "#{purchases_100 / 4} paquete(s) de regalo de 50"
    end

    if purchases_50 >= 4
      return "#{purchases_50 / 4} paquete(s) de regalo de 20"
    end

    if purchases_20 >= 8
      return "#{purchases_20 / 8} paquete(s) de regalo de 10"
    end

    return 0
  end
end	