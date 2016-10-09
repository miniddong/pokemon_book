class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	rescue_from CanCan::AccessDenied do |exception|
		flash[:warning] = "접근권한이 없음"
		redirect_to pokemons_path
	end
end
