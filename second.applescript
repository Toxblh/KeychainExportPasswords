-- OPEN SAFARI. GOTO PREFERENCES. CLICK PASSWORDS TAB --
-- THIS FIRST REPEAT SECTION IS JUST TO GET TO THE PASSWORDS SCREEN AND LOGIN TO ICLOUD --
repeat 1 times
    tell application "Safari"
        activate
        delay 0.5
        tell application "System Events"
            -- Ensure Password Field Selected --
            keystroke tab
            delay 0.2
            -- Type your password for you --
            keystroke "PASSWORD"
            delay 0.2
            -- Hit enter to login --
            keystroke return
            delay 0.2
        end tell
    end tell
end repeat

-- START GRABBING PASSWORDS - SET REPEAT VALUE TO NUMBER OF PASSWORDS --
set x to 1
repeat while (x ≤ 207)
    -- Switch To Safari --
    tell application "Safari"
        activate
        delay 0.5
        tell application "System Events"
            -- Switch from search field to password list field (Only needs to be done once) --
            if (x = 1) then
                keystroke tab
                delay 0.2
            end if
            -- Select first password in list (Field selected. but nothing highlighted) --
            key code 125
            delay 0.2
            -- Open Right-click Menu -- 
            tell application process "Safari"
                set _selection to value of attribute "AXFocusedUIElement"
                tell _selection to perform action "AXShowMenu"
            end tell
            -- Down arrow once to choose/highlight "Copy Website" --
            key code 125
            delay 0.2
            -- Copy Website/URL data --
            keystroke return
            delay 0.2
        end tell
    end tell
    -- Switch To TextEdit
    tell application "TextEdit"
        activate
        delay 0.5
        tell application "System Events"
            -- Print a double quote --
            keystroke "\""
            delay 0.2
            -- Paste "Website/URL" data to text file --
            keystroke "v" using command down
            delay 0.2
            -- Print ending double quote and a comma for CSV --
            keystroke "\","
            delay 0.2
            -- Print a double quote --
            keystroke "\""
            delay 0.2
            -- Paste "Websites" data to text file again (For "Title" field in 1Password) --
            keystroke "v" using command down
            delay 0.2
            -- Print ending double quote and a comma for CSV --
            keystroke "\","
            delay 0.2
        end tell
    end tell
    -- Switch To Safari --
    tell application "Safari"
        activate
        delay 0.5
        tell application "System Events"
            -- Open Window containing "User Name", "Password" and "Websites" fields --
            keystroke return
            delay 0.2
            -- Move to "User Name" field --
            keystroke tab
            delay 0.2
            -- Copy data from "User Name" field --
            keystroke "c" using command down
            delay 0.2
        end tell
    end tell
    -- Switch To TextEdit --
    tell application "TextEdit"
        activate
        delay 0.5
        tell application "System Events"
            -- Print a double quote --
            keystroke "\""
            delay 0.2
            -- Paste "User Name" data to text file --
            keystroke "v" using command down
            delay 0.2
            -- Print ending double quote and a comma for CSV --
            keystroke "\","
            delay 0.2
        end tell
    end tell
    -- Switch To Safari --
    tell application "Safari"
        activate
        delay 0.5
        tell application "System Events"
            -- Move to "Password" field --
            keystroke tab
            delay 0.2
            -- Copy from "Password" field --
            keystroke "c" using command down
            delay 0.2
        end tell
    end tell
    -- Switch To TextEdit --
    tell application "TextEdit"
        activate
        delay 0.5
        tell application "System Events"
            -- Print a double quote --
            keystroke "\""
            delay 0.2
            -- Paste "Websites" data to text file --
            keystroke "v" using command down
            delay 0.2
            -- Print ending double quote and start a new line --
            keystroke "\""
            keystroke return
        end tell
    end tell
    -- Switch To Safari --
    tell application "Safari"
        activate
        delay 0.5
        tell application "System Events"
            -- Click "Done" button --
            keystroke return
            delay 0.2
        end tell
    end tell
    set x to (x + 1)
end repeat
end run
