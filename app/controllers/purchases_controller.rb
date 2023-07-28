class PurchasesController <  ApplicationController
  
  def new
  	@purchase = Purchase.new
	end

	def create
		user = User.find_by(numero: purchase_params[:numero])
		if user.nil?
			redirect_to new_user_path, alert: 'El numero no esta registrado en la base de datos'
		else
			purchase_attributes = purchase_params.except(:user_id)
			@purchase = user.purchases.build(purchase_attributes)
		
			if @purchase.save
				redirect_to new_user_path, notice: 'Compra satisfactoria'
			else
				redirect_to new_user_path, alert: 'Compra no efectuada, verifique usuario'
			end
		end		
	end  

	private

	def purchase_params
		params.require(:purchase).permit(:numero, :monto)
	end	

end	