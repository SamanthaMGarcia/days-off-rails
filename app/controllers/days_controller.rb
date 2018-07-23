class DaysController < ApplicationController
  def show
  end

  def index
    @days = Day.all
  end

  def new
  end

  def create
  end
end
