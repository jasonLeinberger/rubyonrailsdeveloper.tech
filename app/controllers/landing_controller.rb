class LandingController < ApplicationController
  def index
    @weekposts = Weekpost.all
  end
end
