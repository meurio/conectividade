class UsersController < ApplicationController

  def create
    user = User.find_by(email: user_params[:email])

    if user.nil?
      user = User.create(user_params)
    else
      user.update(user_params)
    end

    if user.save
      redirect_to root_path(anchor: 'obrigado')
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :role, :school, :age, :state, :city, :area_code, :phone)
  end
end
