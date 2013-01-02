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
                   else if (msg.which == 10)
                      !isLegato => isLegato;
                   else if (msg.which == 11)
                       g.pickNote();
                   else
                      g.update(mapping[msg.which],1);
                }

                if( msg.isButtonUp() ) {
                    if (msg.which > 4) continue;

                    g.update(mapping[msg.which],0);
                }

                if( msg.isAxisMotion() && msg.which == 2 ) {
                    g.bendNote(msg.axisPosition);
                }
            }

        }
    }
}
