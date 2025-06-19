# Fionna Manager Decompilation
This is a github repo for this games full decomp. I found this game on reddit [here](https://www.reddit.com/r/ExpansionHentai/comments/phf8d9/f_someone_made_a_free_little_growth_game/) (NSFW warning) , **I did not make this.**  all credit goes to [@bulumblebee](https://twitter.com/bulumblebee) on Twitter/X. 

### Compiling from Source
The original source code requires [Godot version 3.3](https://godotengine.org/download/archive/3.4-stable/) (I used specifically 3.3.4)
along with android sdk, and opensdk for android compilation.

The enhanced version uses Godot 4.4

for compiling apks, you need a debug.keystore. generate one with this command (assumming you have installed android studio / android sdk)
```keytool -genkey -v -keystore debug.keystore -storepass android -alias androiddebugkey -keypass android -keyalg RSA -keysize 2048 -validity 10000```


### Notes
the apk will give you permission warnings, its safe to ignore it. (or just build it from the source)

I will move things over to godot 4 a little later.

> [!IMPORTANT]
> If you have a cool feature idea please share it, I can do just about anything except adding more art!

## Original Build Changes

 - Added Buttons to instantly set maximum stats.
 - a node change for the button container (from Node2D -> VBoxContainer)
 - added android compilation
 - Fixed bug with reset button (now it resets bust correctly)

## Enhanced Version Features:

- Bust size is now interpolated
- Bust size can now grow forever (scales the last frame)
- Added a new button "+ Bust" that increases the bust size by .5
- Repositioned the anchor for the breast sprite to allow for smoother scaling.
- over 30 warnings and bugs fixed.
- commented out refrences to a "Muscle Curse" (only thing left over was the pulsing animation, I might reuse this for later endevors)
- renamed some nodes and scripts to help with readability.
- fixed the issue where the console floods with errors when breasts get too big.
- fixed issue where the background was not aligned with the viewport

## Enhanced V3 Features:

- Godot 4.4 support
- propper pixel scaling
- restored commented out rng functions
- updated tweens
- breasts jiggle when increasing bust
- direct breast value input
- interpolation when updating the breast value
- prevented the next location dialog from getting cut off
- moved clipboard UI into VBoxContainer node (only a slight visual shift)
- Breast mLs now get calculated when using manual breast controls

 
 ## How I did this
 I found a tool called [gdsdecomp.](https://github.com/bruvzg/gdsdecomp) 
 It decompiles unencrypted Godot games.
after decompiling I just kinda booted it up and tested it out.

if you do not want your games decompiled, read the [godot docs here](https://docs.godotengine.org/en/stable/contributing/development/compiling/compiling_with_script_encryption_key.html)
