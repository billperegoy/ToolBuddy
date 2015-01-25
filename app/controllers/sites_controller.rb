class SitesController < ApplicationController
  def index
    @sites = Site.all
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    if @site.save(site_params)
      redirect_to :sites
    else
      render :new
    end
  end

  private
  def site_params
    params.require(:site).permit(:name, :install_host, :install_path)
  end

end
