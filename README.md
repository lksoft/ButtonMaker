ButtonMaker is a simple project that came from a [tweet](http://twitter.com/schwa/status/9288691077 "tweet") posted by @schwa yesterday (18 February 2010).  

It allows you to make nice looking glass-like buttons inside of the iPhone Simulator to use in your applications.  

It's pretty simple but allows you to control several features dynamically:  

1. The button text to see the proper size (button can be saved with or without the text)
2. Color of the button tint, using RGBA settings.
3. Width of button (between 50 and 300)
4. Height of button (between 30 and 80)

The resulting button is saved to the Documents folder in the iPhone simulator, usually found at ~/Library/Application Support/iPhone Simulator/User/Applications/[uuid]/Documents/button.png.  

Caveats:  

* Sometimes the button drawing has a thin gap on the right side, try adjusting the width a little bit.
* Entering RGB values on the keyboard is a bit of a pain.
* Most importantly, as Jonathan Wight said:

# Do Not Use This In Production Code

It uses a private API and will almost assuredly get rejected by Apple.  

Enjoy.