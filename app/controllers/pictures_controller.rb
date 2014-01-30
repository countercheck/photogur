class PicturesController < ApplicationController
  def index
    @pictures = Picture.all    
  end

  def show
    @picture = Picture.find(params[:id].to_i)
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to pictures_url
    else 
      render.new
    end
    # render :text => "Saving a picture. URL: #{params[:url]}, Title: #{params[:title]}, Artist: #{params[:artist]}"
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    if @picture.update_attributes(picture_params)
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
    
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_url
  end

  private
  def picture_params
    params.require(:picture).permit(:artist, :title, :url)
  end
  # def picture0
  #   @picture = {
  #     :title => "The old church on the coast of White Sea",
  #     :artist => "Sergey Ershov",
  #     :url => "http://monicao.s3.amazonaws.com/bitmaker/house.jpg"
  #   }
  # end

  # def picture1
  #   @picture = {
  #     :title  => "Sea Power",
  #     :artist => "Stephen Scullion",
  #     :url    => "http://monicao.s3.amazonaws.com/bitmaker/wave.jpg"
  #   }
  # end

  # def picture2
  #   @picture = {
  #     :title  => "Into the Poppies",
  #     :artist => "John Wilhelm",
  #     :url    => "http://monicao.s3.amazonaws.com/bitmaker/girl.jpg"
  #   }
  # end
  
end