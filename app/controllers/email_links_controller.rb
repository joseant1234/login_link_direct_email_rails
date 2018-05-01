class EmailLinksController < ApplicationController
  def new
  end

  def create
  	@email_link = EmailLink.generate(params[:email])

  	# si existe el usuario lo envia login pero con el mensaje q se envio un link a su correo
  	# si es nil, es porque el usuario no existe y debe reenviarlo a login
  	if @email_link
  		redirect_to new_user_session_path, notice: 'Revisa tu bandeja de correo para ingresar a tu cuenta con el link enviado'
  	else
  		redirect_to new_user_session_path, notice: 'No existe un usuario para dicho correo'
  	end
  end

  def validate
  	email_link = EmailLink.where(token: params[:token]).first
  	# si es nil el emial_link es q no existe el token o q ya expiero el token
  	unless email_link
  		return redirect_to new_user_session_path, notice: 'Link invàlido o ya expirò, intenta de nuevo'
  	end
  	# metodo de devise para iniciar sesion
  	# se envia el objecto y el tipo de objecto (User)
  	sign_in(email_link.user, scope: :user)
  	# solo se puede acceder al root_path si se inicio sesion
  	redirect_to root_path
  end
end
