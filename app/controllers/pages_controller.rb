class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @coffees = Coffee.where.not(rating: nil).limit(4).order(rating: :desc)
  end

  def about
  end



  def accept
  end

  def reject

  end
end
