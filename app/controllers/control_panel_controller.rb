class ControlPanelController < ApplicationController
	def index
		@users = User.all

    if params[:fecha].present?
      fecha = Date.parse(params[:fecha])
      @users = @users.joins(:purchases).where(purchases: { purchase_date: fecha })
    end
    
    if params[:usuario].present?
      @users = @users.where("usuario ILIKE ?", "%#{params[:usuario]}%")
    end

    if params[:telefono].present?
      @users = @users.where("numero ILIKE ?", "%#{params[:telefono]}%")
    end

    if params[:monto].present?
    	monto = params[:monto].to_i
      @users = @users.joins(:purchases).where(purchases: {monto: monto})
    end
  end  

	def show
		@user = User.find(params[:id])
		@saldo_final = @user.saldo_final
	end	


end