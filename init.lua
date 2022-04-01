




hyper = { "alt", "cmd" }
shift_hyper = { "shift", "alt", "cmd" }

-- Some apps have alternate names. Hammerspoon can find is better this way.
hs.application.enableSpotlightForNameSearches(true)

-- Show enabled hotkeys 
hs.hotkey.showHotkeys( shift_hyper, "s")

-- Spoons
-- hs.loadSpoon('reloadConfig')
-- spoon.reloadConfig.auto_reload = true
-- spoon.reloadConfig.manual_reload_key = {} -- disable manual reload
-- spoon.reloadConfig:start() -- start filepath watcher

--- start quick open applications 
function open_app(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end

function get_emacs()
    return function()
        obj = hs.application.find("Emacs")
        if obj ~= nil then
           hs.appfinder.appFromName("Emacs"):activate()
        else
           hs.execute("/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c -n", true)
        end
    end
end

-- quick apps
-- key mnemonic: app function
hs.hotkey.bind( hyper, "t", open_app("Alacritty"))      -- term
hs.hotkey.bind( hyper, "b", open_app("Google Chrome"))  -- browser
hs.hotkey.bind( hyper, "c", open_app("Slack"))          -- chat
hs.hotkey.bind( hyper, "m", open_app("Pandora"))        -- music
hs.hotkey.bind( hyper, "e", get_emacs())                -- editor
-- end quick apps

-- start quick exec commands
-- hs.hotkey.bind( hyper, "e", hs.execute("/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c -n"))

-- hs.hotkey.bind( hyper, "w", hs.execute("/opt/X11/bin/startx"))

hs.hotkey.bindSpec({ { "ctrl", "cmd", "alt" }, "h" },
  function()
    hs.notify.show("Hello World!", "Welcome to Hammerspoon", "")
  end
)

