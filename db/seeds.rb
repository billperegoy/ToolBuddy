Tool.delete_all
Version.delete_all
Installation.delete_all
Site.delete_all

Site.create(name: 'North Reading', 
            install_host: 'nradmin.std.teradyne.com',
            install_path: '/hwnet/dig_tools'
           )

Site.create(name: 'Oregon Design Center', 
            install_host: 'osinker.std.teradyne.com',
            install_path: '/hwnet/dig_tools'
           )

Site.create(name: 'Agoura Hills', 
            install_host: 'sinker.std.teradyne.com',
            install_path: '/hwnet/dig_tools'
           )

Tool.create(name: 'gvp', repository_path: '/hwnet/ttg_r2/tools/gvp')
Tool.create(name: 'regression_tool', repository_path: '/hwnet/ttg_r2/tools/regression_tool')

Version.create(name: "v1.0.0", release_notes: "this is a release note and it has to be long", tool_id: Tool.find_by(name: "regression_tool").id)
Version.create(name: "v1.0.1", release_notes: "this is a release note and it has to be long", tool_id: Tool.find_by(name: "regression_tool").id)
Version.create(name: "v2.0.1", release_notes: "this is a release note and it has to be long", tool_id: Tool.find_by(name: "gvp").id)
