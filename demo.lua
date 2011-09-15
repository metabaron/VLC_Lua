local dlg = nil -- Account Dialog
local user = nil -- Text input widget
local pass = nil -- Password input widget

local menus = { "Mon Compte..." }
local tag = "[demo-extension]: " 

-- Extension description
function descriptor()
    return { title = "Demo" ;
             version = "2011.09" ;
             author = "Mathieu Feulvarh" ;
             url = 'http://blog.metabaron.net/';
             shortdesc = "Minimum extension for VLC.";
             description = "<center><strong>You can do HTML</strong></center>";
             capabilities = { "meta-listener", "input-listener" } }
end

local function click_login()
    -- Get username
    local username = user:get_text()
    local password = pass:get_text()
    if not username or username == "" then
        vlc.msg.dbg(tag .. "Missing username.")
        return
    end
	
	if not password or password == "" then
		vlc.msg.dbg(tag .. "Missing password.")
        return
    end
	vlc.msg.dbg("Click done")
end

-- Create the dialog
local function create_dialog()
    dlg = vlc.dialog("Login box")
    dlg:add_label("<strong>Login : </strong>", 1, 1, 1, 1)
    user = dlg:add_text_input("", 2, 1, 1, 1)
    dlg:add_label("<strong>Password : </strong>", 1, 2, 1, 1)
    pass = dlg:add_password("", 2, 2, 1, 1)
    dlg:add_button("Login", click_login, 1, 3, 1, 1)
end

-- Activation hook
function activate()
    vlc.msg.dbg("Welcome")
    create_dialog()
end

-- Deactivation hook
function deactivate()
    vlc.msg.dbg("Bye bye!")
end

-- Dialog close hook
function close()
    -- Deactivate this extension
    vlc.deactivate()
end