#Buildroot external files for FriendlyARM NanoPi#

#Configuration#
Clone this repo  and [Buildroot](git://git.buildroot.net/buildroot)

In the Buildroot directory run:

     make BR2_EXTERNAL=/path/to/this/dir nanopi_defconfig

This will tell Buildroot to use the files in this repo, you can now build Buildroot running _make_ or configure further with _make menuconfig_. Any options this repo provides will show up in the main menu under _User-provided Options_

###Precautions###
Root is the only user on initial startup, and has no password. Root can log in through SSH like this. Be sure to give root a password!!!
