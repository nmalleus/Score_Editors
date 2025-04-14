# Nelson MALLÉUS settings for *Steinberg Dorico* & *Avid Sibelius*

Thanks to Jérémy Weibel, Emile Ayoub, Claire Maisonobe & Quentin Moret.

__Want to help improve these resources?__
For suggestions, questioning, testing, proofreading, completing, editing, your help is welcome!
Do not hesitate to write to me at nelson@inouisamples.com (fr/en)

## Keybord layouts
 - Keycommand index:
     - https://github.com/nmalleus/Score_Editors/blob/master/Keycommands_Index.md
 - Main:
     - http://www.keyboard-layout-editor.com/#/gists/268fec8c85147ed85300d39c7f37b1dd
 - Shift:
     - http://www.keyboard-layout-editor.com/#/gists/80e9aa7c4cfd32d7bb100726e97b4ce9
 - Ctrl:
     - http://www.keyboard-layout-editor.com/#/gists/20091dd63c21f9d368768db1916f7128
 - Alt:
     - http://www.keyboard-layout-editor.com/#/gists/60671fedbdba6d2ae1e0eaa9a10b6a44
 - Ctrl+Shift:
     - http://www.keyboard-layout-editor.com/#/gists/de22c190fe225649c48c61d76f4bdcc6
 - Ctrl+Alt:
     - http://www.keyboard-layout-editor.com/#/gists/13aad50216713bb2ae6c1514c1eb5398
 - Alt+Shift:
     - http://www.keyboard-layout-editor.com/#/gists/8814118f3b282d2ffc3dfdaac3534f99
 - Ctrl+Alt+Shift:
     - http://www.keyboard-layout-editor.com/#/gists/4e0f99598058720cc784a2fb235b4821
 - Dynamics expander:
     - http://www.keyboard-layout-editor.com/#/gists/0ca3238debe65cc375b8a7ced1f0bfd8

## Dorico
 - Popover list:
     - https://github.com/nmalleus/Score_Editors/blob/master/Dorico/Popovers.md

### Installation

Put these files and folders...

 - Keyboard shortcuts: *keycommands_en.json*
 - Scripts & macros *Script Plug-ins* directory with the *lua* files

... into:

__Win__: `C:\Users\USERNAME\AppData\Roaming\Steinberg\Dorico 5`  
__Mac__: `/Users/username/Library/Application Support/Steinberg/Dorico 5`

*Mac* users will have to free a few shotcuts by doing the following steps:
 - go to: *System preferences / Keyboard shortcuts / Application shortcuts*
 - select *Dorico*
 - add these shortcuts to avoid conflicts :
     - Show Toolbar - Ctrl+Alt+Shift+§
     - Show Left Zone - Ctrl+Alt+Shift+È
     - Show Lower Zone - Ctrl+Alt+Shift+!
     - Right Zone - Ctrl+Alt+Shift+Ç
     - Hide/Restore Zones - Ctrl+Alt+Shift+À
     - Hide Dorico - Ctrl+Alt+Shift+H
 - do to: *System preferences / Keyboards Shortcuts / Launchpad & Dock*
 - turn off *Dock hiding*

## Sibelius
 - Plugin selection:
     - https://github.com/nmalleus/Score_Editors/blob/master/Sibelius/Plugin_Selection.md

### Installation

Put this files...

 - Keyboard shortcuts: *\Keyboard Shortcuts\keycommands_Nelson.sfs*

... into:

__Win__: `C:\Users\USERNAME\AppData\Roaming\Avid\Sibelius`  
__Mac__: `/Users/username/Library/Application Support/Avid/Sibelius`

## Complementary installations

### Stream Deck

At this time, the *Stream Deck* profiles are optimised for *Windows* only.
Download from `Score_Editors/Tools/StreamDeck/`:
 - *Dorico.streamDeckProfile*
 - *Sibelius.streamDeckProfile*

In the *Stream Deck* application:
 - Click on *Edit profiles...*
 - *Profiles*
 - Click the down arrow at the very bottom
 - *Import*
 - And select the *.streamDeckProfile* you want to import

### AHK Scripts - Windows users only

After intalling *AutoHotKey* from their website:
https://www.autohotkey.com/

Download from `Score_Editors/Tools/AHK/`:
 - *CSV_Expander.ahk*
 - *Dorico4.ahk* if you plan to use it with *Dorico*
 - *Expander_Dictionary.csv*
 - *Sibelius.ahk* if you plan to use it with *Sibelius*
 - *French_Special_Characters.ahk* if you use a french keyboard

Then:
 - Store these files in the same folder on your PC.
 - Run *Dorico4.ahk* when you want to use it with *Dorico*
 - Run *Sibelius.ahk* when you want to use it with *Sibelius*

### Robobasket - Windows users only

After installing *RoboBasket* from their website:
https://www.robobasket.com/

 - Download *Sort_Sibelius_files.xml* from `Score_Editors/Tools/RoboBasket/`
 - Run *RoboBasket*
 - Click on *Rules* / *Restore Rules*
 - Select *Sort_Sibelius_files.xml*`* and click open
 - *Are you sure to overwrite the current settings?* → OK

## Future updates

### Global updates
 - Finish *Dorico* popovers

### Missing shortcuts
 - Add Page ↑/↓ to octave shift while input on *Sibelius*

### Other updates
 - *simile* as dynamic in *Dorico*
 - List Dorico popovers (fingering, lyrics, chords and playing techniques are missing)
 - Place harp pedaling bellow system
 - How to negative bar number in *Dorico*
 - *RoboBasket*: add SATB sorting
 - *RoboBasket*: continue French translation after percussions

## About Nelson

I'm passionate about orchestration and engraving since I was 15... and I've been perfecting my workflow ever since!

If you were able to find this folder, I'm happy to share my *Dorico* and *Sibelius* preferences with you.
Feel free to suggest optimizations.

Website: https://www.nelsonmalleus.com

References: https://www.imdb.com/name/nm7833586

Virtual instruments: https://www.inouisamples.com
