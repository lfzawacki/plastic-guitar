public class GuitarHandler extends InputHandler {

    public void openDevice(int device) {
        if( !hi.openJoystick( device ) ) me.exit();
        <<< "joystick '" + hi.name() + "' ready", "" >>>;
    }

     public void queryInput(Guitar guitars[]) {
        [2,0,1,3,4] @=> int mapping[];
        [-0.8, -0.3 , 0.08, 0.48, 1 ] @=> float ranges[];
        0 => float lastFingered;
        0 => int lastIndex;
        0 => int isLegato;

        while( true )
        {
            hi => now;

            isLegato ? guitars[1] : guitars[0] @=> Guitar g;

            while( hi.recv( msg ) ) {
                if( msg.isButtonDown() ) {
                   if (msg.which == 9)
                      g.octaveUp();
                   else if (msg.which == 8)
                      g.octaveDown();
                   else if (msg.which == 12)
                      !isLegato => isLegato;
                   else
                      g.update(mapping[msg.which],1);
                }

                if( msg.isButtonUp() ) {
                    if (msg.which > 4) continue;

                    g.update(mapping[msg.which],0);
                }

                if( msg.isAxisMotion() && msg.which == 5 && Std.fabs(msg.axisPosition) $ int )
                    g.pickNote();

                if( msg.isAxisMotion() && msg.which == 2 ) {
                    g.bendNote(msg.axisPosition);
                }

                if( msg.isAxisMotion() && msg.which == 3 ) {

                    if (msg.axisPosition < 0.001 && msg.axisPosition > -0.001 ) {
                        g.update(5,0);
                        g.update(6,0);
                        g.update(7,0);
                        g.update(8,0);
                        g.update(9,0);
                        <<<"muted">>>;
                        continue;
                    }

                    if ( Std.fabs(lastFingered - msg.axisPosition) < 0.1 ) {
                        lastFingered => msg.axisPosition;
                    }

                    <<< "notable" >>>;
                    -1 => int closerIndex;
                    2 => float closer;
                    for (0 => int i; i < ranges.cap(); i++ ) {
                        if ( Std.fabs(ranges[i] - msg.axisPosition) < closer) {
                            Std.fabs(ranges[i] - msg.axisPosition) => closer;
                            i => closerIndex;
                        }

                    }
                    //<<<lastIndex,closerIndex,closer>>>;
                    g.update(5+closerIndex,1);

                    for (0 => int i; i < 5; i++) {
                        if (i != closerIndex)
                            g.update(i+5,0);
                    }
                    closerIndex => lastIndex;
                    msg.axisPosition => lastFingered;
                }
            }

            .1::second => now;
        }
    }
}
