# Caps Lock Lover #

Do you hate the Caps Lock Key? Would you like to disable it? This AutoHotkey script might just give you a change of heart. Caps Lock Lover transforms that pesky caps lock key into a powerful modifier allowing you to perform many functions without needing to move your hands away from the home position of the keyboard. Fall in love with the caps lock key!

By default, the caps lock key will be disabled (no more accidental caps locking). Holding the caps lock key while pressing various other keys will trigger the designated functionality. Check out the keyboard legend graphic to see things are set up at a glance. Further details about functionality are outlined within the script. 

![Alt text](/keyboard-legend.svg?raw=true "Keyboard Legend")

This configuration suits my personal preferences but may not be right for you. For example, the cursor keys are mapped to IJKL to mirror the familiar WASD configuration used on the left side of the keyboard in many games. Other folks might prefer using HJKL for the cursor keys, and that's totaly cool. Forking is encouraged.


## Acknowledgements ##

This script is a fork of [Caps Lock Remap by Danik](https://gist.github.com/Danik/5808330/raw/d572399237ee5f1ccb3a50ba7ae3ebdc0df71883/capslock_remap_alt.ahk), which itself was based on other great scripts. Details below:

### [Caps Lock Remap by Danik](https://gist.github.com/Danik/5808330/raw/d572399237ee5f1ccb3a50ba7ae3ebdc0df71883/capslock_remap_alt.ahk) ###

Changes:

- Renamed script to Caps Lock Lover
- Customized the shortcut keys to fit my personal preferences
- Added the keyboard legend image to better communicate the configuration at a glance. The legend is based on [qwerty.svg via Wikipedia](https://en.wikipedia.org/wiki/File:Qwerty.svg).
- Disabled the insert key by default
- Removed the Control+Enter and Control+Alt shortcuts by commenting them out
- Rearranged code and reformatted comments

### [Home Row Computing by Gustavo Duarte](http://duartes.org/gustavo/blog/post/home-row-computing/) ###

Changes:

- Does not need register remapping of AppsKey using SharpKeys.
- Uses normal cursor key layout 
- Added more hotkeys for insert, undo, redo etc.

### [Linux Alt + Window Drag Functionality in Windows](http://www.howtogeek.com/howto/windows-vista/get-the-linux-altwindow-drag-functionality-in-windows/) ###

Changes:

The only change was using Caps Lock instead of Alt. This also removes problems in certain applications.

## Other Resources ##

Notepad++ and AutoHotkey resources:

- https://github.com/jNizM/ahk_notepad-plus-plus
- https://autohotkey.com/boards/viewtopic.php?t=50
