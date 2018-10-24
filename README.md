# KeychainExportPasswords

Export you password from Keychain for another password keepers

You can try:
- [First version](https://github.com/Toxblh/KeychainExportPasswords/blob/master/README.md#first-version)
- [Second version](https://github.com/Toxblh/KeychainExportPasswords/blob/master/README.md#second-version)

<a href="https://www.patreon.com/bePatron?u=9900748" align="right">
	<img src="https://c5.patreon.com/external/logo/become_a_patron_button@2x.png" width="160">
</a>

### Before all 
<img src="https://us.v-cdn.net/5020219/uploads/editor/pc/ibknuc1xo8qz.png" width="450px" />

# First version

Steps:
- You must have TextEdit open on a new document and ready to receive the pasted info from the keychain.
- You must have the iCloud Keychain unlocked and sorted in whatever order you want to copy/paste.
- Update the "password" on line 73 to match yours.
- Add/update the keystroke order in the script to add more/less fields to each copy/paste action. I chose to the first field, username, and password to export. You might want more/less fields.
- You might have some instances where the delay's are not perfect, so pay attention to the output in TexEdit to make sure the data is coming across correctly.
- Once you get it the way you like it an are confident, increase the repeat value on line 1 to something like 50. I would not recommend more than that.
- Use at your own risk. If you know how to use AppleScript and Automator, then you might be just dangerous enough to screw things up. Good Luck!

```applescript
repeat 1 times
 delay 0.2
 tell application "Keychain Access"
     activate
     
     tell application "System Events"
         delay 0.2
         keystroke return
         
         -- Press ⌘C to copy item title
         delay 0.2
         keystroke "c" using command down
     end tell
 end tell
 
 --Switch to TextEdit
 delay 0.2
 tell application "TextEdit"
     activate
     tell application "System Events"
         -- Press ⌘V
         delay 0.2
         keystroke "v" using command down
         
         -- Type a comma
         delay 0.2
         keystroke ","
         
     end tell
 end tell
 
 --Switch to Keychain
 tell application "Keychain Access"
     activate
     tell application "System Events"
         -- Press Tab x2 
         delay 0.1
         keystroke tab
         delay 0.1
         keystroke tab
         
         -- Press ⌘C
         delay 0.2
         keystroke "c" using command down
     end tell
 end tell
 
 --Switch to TextEdit
 delay 0.2
 tell application "TextEdit"
     activate
     tell application "System Events"
         -- Press ⌘V
         delay 0.2
         keystroke "v" using command down
         
         -- Type ','
         delay 0.2
         keystroke ","
     end tell
 end tell
 
 --Switch to Keychain
 tell application "Keychain Access"
     activate
     tell application "System Events"
         -- Click the “Show password:” checkbox.
         delay 0.2
         keystroke "c" using {shift down, command down}
         
         -- Type password - update to yours
         delay 0.5
         keystroke "password"
         delay 0.2
         keystroke return
         
         -- Close keychain item window
         delay 0.3
         keystroke "w" using command down
         
         -- Go to next keychain item
         delay 0.2
         key code 125
     end tell
 end tell
 
 --Switch to TextEdit
 delay 0.2
 tell application "TextEdit"
     activate
     tell application "System Events"
         -- Press ⌘V
         delay 0.2
         keystroke "v" using command down
         
         -- Press Return
         delay 0.2
         keystroke return
     end tell
 end tell
end repeat
end run
```

Source: https://discussions.agilebits.com/discussion/comment/455708/#Comment_455708


# Second version

Steps:
- Open Safari, go to Preferences and click on the Password tab.
- Open TextEdit, go to Format menu and click "Make Plain Text".
- Open Script Editor (Applications -> Utilities -> Script Editor). Start a new document and paste in the following script text.
- Replace PASSWORD with your actual password for the Mac.
- Look for the line that says "repeat while (x ≤ 207)" and replace the 207 with whatever you are comfortable with. If you have an iPhone or iPad running iOS 12, you can go to Settings -> "Passwords & Accounts". To the right of "Website & App Passwords", you'll see the number you have saved in there. You can replace 207 with that number PLUS 1. So, if it says you have 10, type 11 instead.
- Click the Play button in script editor and you should be off and running.
- I've noticed that sometimes it won't put in the password because the field isn't highlighted. If that happens, stop the script, empty the TextEdit file and click on one of the other Preferences tabs and then click back on the Passwords tab and try running the script again.

For improve speed you can change dalays to 0.1 instead of last in `THIS FIRST REPEAT SECTION`

```applescript
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
```

Source: https://discussions.agilebits.com/discussion/comment/465689/#Comment_465689
