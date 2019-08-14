class SessionsController < ApplicationController
  skip_before_action :logged_in_user, only: %i[new create]

  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase) # busca como identificador del user el mail, lo guarda en una variable, y lo autentica con el password
    if user && user.authenticate(params[:session][:password]) # autenticando un metodo de una instancia. primero colocar user porque nill no tiene el metodo authehticate
      log_in user
      redirect_to rooms_path
    else
      flash[:danger] = 'invalid email/password'
      redirect_to login_url
  end
end

  def destroy
    log_out
    redirect_to root_url # hace un override del render de destroy
  end
end
