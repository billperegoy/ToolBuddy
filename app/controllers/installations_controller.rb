class InstallationsController < ApplicationController
  def install_one
    @tool = Tool.find(params[:tool_id])
    @version = Version.find(params[:version_id])
    @installation = Installation.find(params[:id])

    # FIXME - This is where I do the actual install
 
    respond_to do |format|
      format.js {}
    end

  end

  def install_all
    @tool = Tool.find(params[:tool_id])
    @version = Version.find(params[:version_id])
    @installations = @version.installations

    # FIXME - This is where I do the actual install

    respond_to do |format|
      format.js {}
    end

  end
end
