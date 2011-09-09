Dyno mixer => dac;

Guitar g[2];
Guitar.setup(me.arg(0),mixer);

new PickedGuitar @=> g[0];
new LegatoGuitar @=> g[1];

InputHandler handler;
MouseHandler mouseHandler;

int device;

if (me.arg(1) == "keyboard") {
    new KeyboardHandler @=> handler;
    Std.atoi(me.arg(2)) => device;
}

if (me.arg(1) == "guitar") {
    new GuitarHandler @=> handler;
    0 => device;
}

//mouseHandler.openDevice(1);
handler.openDevice(device);

//spork ~mouseHandler.queryInput(null);
spork ~handler.queryInput(g);

2::week => now;
