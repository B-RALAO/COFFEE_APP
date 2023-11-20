class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if user_signed_in?
      render "coffees/index", status: :unprocessable_entity
    end
  end
end
