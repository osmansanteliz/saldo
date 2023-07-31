class UsersController <  ApplicationController
  def new
    @user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  	  redirect_to control_panel_path notice: 'Usuario Registrado'
  	else
  	  render :new, status: :unprocessable_entity
  	end  	  
  end	

  private
  def user_params
  	params.require(:user).permit(:usuario, :numero, :captcha, :saldo_inicial)
  end	
end	