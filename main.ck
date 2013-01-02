// Only used when outputting sounds, throw it all in a compressor to level volume
Dyno mixer => dac;

Guitar g[2];

if (!Guitar.setup(me.arg(0), mixer))
{
    <<< "Invalid output mode.", "Exiting.">>>;
    me.exit();
}

new PickedGuitar @=> g[0];
new LegatoGuitar @=> g[1];

InputHandler handler;
MouseHandler mouseHandler;

int device;

if (me.arg(1) == "keyboard") {
    new KeyboardHandler @=> handler;
    Std.atoi(me.arg(2)) => device;
} else if (me.arg(1) == "slider_guitar") {
    new SliderGuitarHandler @=> handler;
    0 => device;
} else if (me.arg(1) == "guitar") {
    new GuitarHandler @=> handler;
    0 => device;
} else {
    <<< "Specify an input method.", "\nAvailable: keyboard    guitar slider_guitar">>>;
    me.exit();
}

//mouseHandler.openDevice(1);
handler.openDevice(device);

//spork ~mouseHandler.queryInput(null);
spork ~handler.queryInput(g);

2::week => now;
