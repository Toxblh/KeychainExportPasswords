set the logFile to ((path to desktop) as text) & "log.txt"
try
	open for access file the logFile with write permission
	
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
				delay 0.1
				set myText to (the clipboard as text) & ","
				
				-- Press Tab x2 
				delay 0.1
				keystroke tab
				delay 0.1
				keystroke tab
				
				-- Press ⌘C
				delay 0.2
				keystroke "c" using command down
				set myText to myText & (the clipboard as text) & ","
				
				-- Click the “Show password:” checkbox.
				delay 0.2
				keystroke "c" using {shift down, command down}
				
				-- Type password - update to yours
				delay 0.5
				keystroke "Passwort hier"
				delay 0.2
				keystroke return
				
				-- Close keychain item window
				delay 0.3
				keystroke "w" using command down
				set myText to myText & (the clipboard as text)
				write (myText & return) to file the logFile starting at eof
				-- Go to next keychain item
				delay 0.2
				key code 125
			end tell
		end tell
	end repeat
	
	close access file the logFile
on error
	try
		close access file the logFile
	end try
end try

end run
