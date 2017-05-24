class AlbumsController < ApplicationController
  before_action :admin_user,     only: [:new, :create, :destroy]
  
  def index
    @albums = Album.all.paginate(page: params[:page])
  end
  
  def new
    @album = Album.new
  end
  
  def show
    begin
      @album = Album.find(params[:id])
      redirect_to root_url and return unless !@album.nil?
    rescue
      redirect_to root_url and return
    end
  end
  
  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:success] = "Álbum cadastrado com sucesso!"
      redirect_to albums_url
    else
      render 'new'
    end
  end
  
  def edit
    @album = Album.find(params[:id])
  end
  
  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      flash[:success] = "Álbum atualizado"
      redirect_to @album
    else
      render 'edit'
    end
  end
  
  def destroy
    Album.find(params[:id]).destroy
    flash[:success] = "Álbum deletado"
    redirect_to albums_url
  end
  
  private

    def album_params
      params.require(:album).permit(:name, :editor, :total, :description)
    end
    
    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
