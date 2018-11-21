class LandingController < ApplicationController
  def index
    @siteprop = Siteprop.first
  end
end
