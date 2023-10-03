class AuthenticationController < ApplicationController
  skip_before_action :authorize
  
  def login
    user = User.find_by(username:params[:username])
    if user && user.authenticate(params[:password])
      token = encode(user_id: user.id)
      render json: {token:token,user:user}
    else
      render json: {error:"Invalid username or password"}
    end
  end
end