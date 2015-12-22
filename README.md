##Buildroot external files for FriendlyARM NanoPi/NanoPi2##

Current as of Buildroot 2015.11

##Configuration##
Clone this repo and [Buildroot](http://git.buildroot.net/buildroot)

In the Buildroot directory run:

     make BR2_EXTERNAL=/path/to/this/dir nanopi_defconfig

This will tell Buildroot to use the files in this repo. You can now build Buildroot running _make_ or configure further with _make menuconfig_. Any options this repo provides will show up in the main menu under _User-provided Options

###Options###

* **nanopi_gui_defconfig** - For a Qt based application launcher and environment. In User-provided options/packages/QAppLauncher you'll need to select your screen size.
* **nanopi2_defconfig** - For NanoPi2 Basic configuration.

###Known Issues###
NanoPi2 requires running _hciconfig hci0 up_ after boot, to bring bluetooth up.

###Precautions###
Root is the only user on initial startup, and has no password. Root can log in through SSH like this. Be sure to give root a password!!!
