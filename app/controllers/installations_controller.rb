class InstallationsController < ApplicationController
  def install_one
    @tool = Tool.find(params[:tool_id])
    @version = Version.find(params[:version_id])
    @installation = Installation.find(params[:id])

    # FIXME - This is where I do the actual install
    #         Currently I render a view here but this
    #         shpuld start the installa and redirect.

    # redirect_to_version_page
  end

  def install_all
    @tool = Tool.find(params[:tool_id])
    @version = Version.find(params[:version_id])
    @installations = @version.installations

    # FIXME - This is where I do the actual install
    #         Currently I render a view here but this
    #         shpuld start the installa and redirect.
    #
    # redirect_to_version_page
  end

  private
  def redirect_to_version_page
    redirect_to tool_version_path(
      tool_id: @tool_id,
      id: @version_id)
  end
end
