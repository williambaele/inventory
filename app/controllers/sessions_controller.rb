class SessionsController < ApplicationController
  def create
    # Code de connexion de l'utilisateur
    flash[:success] = "Signed in"
    redirect_to root_path
  end
end
