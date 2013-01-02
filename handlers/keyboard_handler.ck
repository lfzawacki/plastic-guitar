public class KeyboardHandler extends InputHandler {

    public void openDevice(int device) {
        if( !hi.openKeyboard( device ) ) me.exit();
        <<< "keyboard '" + hi.name() + "' ready", "" >>>;
    }

    public void queryInput(Guitar guitars[]) {

        0 => int isLegato;
        while( true )
        {
            hi => now;

            isLegato ? guitars[1] : guitars[0] @=> Guitar g;

            while( hi.recv( msg ) ) {

                if (msg.isButtonDown()) {
                    msg.ascii => int K;
                    if (K >= 49 && K <= 57) {
                       K-48 => K;
                       g.update(K,1);
                    }

                    //space
                    if (K == 32) {
                      g.pickNote();
                    }

                    if (K == 10) !isLegato => isLegato;

                } else {
                    msg.ascii => int K;
                    if (K >= 49 && K <= 57) {
                       K-48 => K;
                       g.update(K,0);
                    }
                }
            }

            .1::second => now;
        }

    }

}
