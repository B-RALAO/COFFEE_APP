class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    render "coffees/index", status: :unprocessable_entity if user_signed_in?
  end
end
