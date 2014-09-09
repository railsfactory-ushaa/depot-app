class ApplicationController < ActionController::Base
  before_action :set_i18n_locale_from_params
  # ...
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protected
  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale]
      else
        flash.now[:notice] = "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
   end
  end
  def default_url_options
    { locale: I18n.locale }
  end

  def authorize
    unless User.find_by(id: session[:user_id])
    redirect_to login_url, notice: "Please log in"
   end
 end
def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up){|u|u.permit(:name, :email, :address, :password, :password_confirmation, :user_name, :gender, :image)}
  devise_parameter_sanitizer.for(:account_update) << :name
end
end

