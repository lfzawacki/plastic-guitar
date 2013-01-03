Plastic Guitar
===============

This is a silly Chuck program that enables you to use your plastic guitar and maybe other plastic instruments as real sound or MIDI emmiting devices.

## How To Use

You first need the [Chuck Programming Language](http://chuck.cs.princeton.edu) installed, the official home page has instructions on how to install it in your flavor of operating system.

Then you'll have to run the `start.sh` script passing some parameters to configure it. Use it as follows:

    # Running with default parameters (sub_synth.ck and keyboard input handler)
    $ ./start.sh

    # Using a Guitar Hero Guitar and sending MIDI events
    $ ./start.sh midi guitar

    # Using a Guitar Hero 3 slider guitar and the sub_synth.ck
    $ ./start.sh midi sub

For running on Windows you may need to use [Cygwin](http://www.cygwin.com/) or [Msys](http://www.mingw.org/wiki/MSYS) to have access to a good terminal and then run the `start.sh` script.