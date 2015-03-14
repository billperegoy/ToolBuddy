require "rails_helper"

feature "API URLs work as expected" do
  scenario "Home page" do
    visit "/"
    expect(page).to have_text("All Tools")
  end

  scenario "Tools page" do
    visit "/tools"
    expect(page).to have_text("All Tools")
  end

  scenario "Sites page" do
    visit "/sites"
    expect(page).to have_text("All Sites")
  end
end

feature "Main menus work as expected" do
  scenario "Clicking 'Sites' button navigates to Sites page" do
    visit "/"
    click_link 'Sites'
    expect(page).to have_text("All Sites")
  end

  scenario "Clicking 'Add Site' button navigates to Add Site page" do
    visit "/"
    click_link 'Add Site'
    expect(page).to have_text("Create a new site")
  end

  scenario "Clicking 'Add Tool' button navigates to Add Tool page" do
    visit "/"
    click_link 'Add Tool'
    expect(page).to have_text("Create a new tool")
  end

  scenario "Clicking 'Hpme' button returns you to the Home page" do
    visit "/"
    click_link 'Add Site'
    click_link 'Home'
    expect(page).to have_text("All Tools")
  end
end

feature "Can naviagte to tools and versions" do
  before(:each) do
    Tool.create(name: "regression_tool", repository_path: "/path/regression_tool")
    Tool.create(name: "gvp", repository_path: "/path/gvp")

    Version.create(name: 'v1.0.0', 
                   release_notes: "This is a release note and it really has to be long",
                   tool_id: Tool.find_by(name: "regression_tool").id)

    Site.create(name: "North Reading",
                install_host: 'nradmin.std.teradyne.com',
                install_path: '/hwnet/dig_tools')

    Site.create(name: "Agoura Hills",
                install_host: 'sinker.std.teradyne.com',
                install_path: '/hwnet/dig_tools')
  end

  scenario "Available tools are visible on the tools page" do
    visit "/tools"
    expect(page).to have_text("Version")
    expect(page).to have_text("Release Notes")
    expect(page).to have_text("regression_tool")
    expect(page).to have_text("gvp")
  end

  scenario "Clicking on a tool version takes you to the detail page for that version" do
    visit "/tools"
    click_link "v1.0.0"
    expect(page).to have_text("Version Information")
  end

  scenario "Version page should have an insall link for each site" do
    visit "/tools"
    click_link "v1.0.0"
    expect(page).to have_text("North Reading")
    expect(page).to have_text("Agoura Hills")
  end

  scenario "Version page should have an 'Install All' button" do
    visit "/tools"
    click_link "v1.0.0"
    expect(page).to have_text("Install All")
    expect(page).to have_selector('.install-all', count: 1)
  end

  scenario "Version page one 'Install' button per site" do
    visit "/tools"
    click_link "v1.0.0"
    expect(page).to have_selector('.install-one', count: 2)
  end

  scenario "Clicking an install button should result in the button text changing to installed" do
    pending "Still debugging"
    visit "/tools"
    click_link "v1.0.0"
    click_button("Install", match: :first)
    expect(page).to have_text("Installed")
  end
end
