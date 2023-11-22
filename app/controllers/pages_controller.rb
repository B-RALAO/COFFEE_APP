class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @coffees = Coffee.limit(4).order(rating: :desc)
  end
end
