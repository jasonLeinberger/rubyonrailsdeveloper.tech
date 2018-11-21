class SitepropsController < ApplicationController
  def index
  end

  def new
    @siteprop = Siteprop.new
  end

  def create
    @siteprop = Siteprop.new(siteprop_params)
    if @siteprop.save
      flash[:notice] = "Site properties have been saved."
      redirect_to landing_index_path
    else
      flash.now[:alert] = "An error prevented the site properties from being saved."
      render :new
    end
  end

  def edit
    @siteprop = Siteprop.find(params[:id])
  end

  def update
    @siteprop = Siteprop.find(params[:id])
    if @siteprop.update(siteprop_params)
      flash[:notice] = "Site prop has been updated"
      redirect_to landing_index_path
    else
      flash.now[:alert] = "An error prevented the site properties from being saved."
      render :edit
    end
  end

  private 

  def siteprop_params
    params.require(:siteprop).permit(:title, :landingheader, :landingcontent)
  end

end
