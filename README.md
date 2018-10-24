# KeychainExportPasswords
Export you password from Keychain for another password keepers

Notes:

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

Original https://discussions.agilebits.com/discussion/comment/455708/#Comment_455708
