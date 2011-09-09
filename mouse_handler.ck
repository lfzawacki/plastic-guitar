public class MouseHandler extends InputHandler {

    public void openDevice(int device) {
        if( !hi.openMouse( device ) ) me.exit();
        <<< "mouse '" + hi.name() + "' ready...", "" >>>;
    }

    public void queryInput(Guitar guitars[]) {
        hi => now;

        while (true) {

            while( hi.recv( msg ) ) {

                if( msg.isMouseMotion() ) {

                    <<< "delta x ", msg.deltaX >>>;
                    <<< "delta y ", msg.deltaY >>>;
                }
            }

            .1::second => now;
        }

    }

}
