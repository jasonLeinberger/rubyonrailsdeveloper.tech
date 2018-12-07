class WeekpostsController < ApplicationController
  before_action :findweekpost, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @weekposts = Weekpost.all
  end

  def new
    @weekpost = Weekpost.new
  end

  def create
    @weekpost = Weekpost.new(weekpostparams)
    if @weekpost.save
      flash[:notice] = "Post has been saved."
      redirect_to @weekpost
    else
      flash.now[:alert] = "An error prevented the post from being saved."
      render :new
    end
  end

  def edit
    
  end

  def show

  end

  def update
    if @weekpost.update_attributes(weekpostparams)
      flash[:notice] = "Post has been updated"
      redirect_to @weekpost
    else
      flash.now[:alert] = "An error prevented the post from being updated."
      render :edit
    end
  end

  def destroy
    if @weekpost.destroy
      flash[:notice] = "Post has been deleted"
      redirect_to landing_index_path
    else
      flash.now[:alert] = "An error prevented the post from being deleted."
      render :show
    end
  end

  def delete_image_attachment
      @weekpost = Weekpost.find(params[:post_id])
      @wireframe = ActiveStorage::Attachment.find(params[:id])
      # @wireframe = ActiveStorage::Attachment.find(6)
      if @wireframe.purge
        flash[:notice] = "image has been removed."
        render :edit
      else
        flash.now[:alert] = "An error prevented the iamge from being deleted."
        render :edit
      end
  end

  private

  def weekpostparams
    params.require(:weekpost).permit(:title, :weeknumber, :notes, wireframes: [])
  end

  def findweekpost()
    @weekpost = Weekpost.find(params[:id])
  end

end
