public class PickedGuitar extends Guitar {

    public void update(int K, int down) {
             if (down) {
                 1 => pressed[K];
                 //buttonSynth[K].noteOn(1);
             } else {
                 0 => pressed[K];
                 buttonSynth[K].noteOff(1);
             }
    }

}

