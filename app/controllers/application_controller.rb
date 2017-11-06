class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception # ochrona przed CSRF
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters # dopuszczanie dozwolonych parametrów dla kontrolerów typu Devise
    list_keys = [:name, :age, :pesel, :phone, :address, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: list_keys) # parametry dla rejestracji
    devise_parameter_sanitizer.permit(:account_update, keys: list_keys) # parametry dla edycji danych konta
  end
end
