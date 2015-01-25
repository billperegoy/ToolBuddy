class VersionsController < ApplicationController
  def new
    @tool = Tool.find(params[:tool_id])
    @version = Version.new
  end

  def create
    @tool = Tool.find(params[:tool_id])
    @version = @tool.versions.new(version_params)

    if @version.save(version_params)
      redirect_to tools_path
    else
      render :new
    end
  end

  def show
    @version = Version.find(params[:id])
  end

  private
  def version_params
    params.require(:version).permit(:name, :release_notes)
  end
end
