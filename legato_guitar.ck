public class LegatoGuitar extends Guitar {

    public void update(int K, int down) {
        down => pressed[K];

        -1 => int selected;
        for (pressed.cap()-1=> int i; i >= 0; i--) {
            if (pressed[i]) {
                i => selected;
                break;
            }
        }

        for (pressed.cap()-1=> int i; i >= 0; i--) {
             if (i == selected) continue;

             buttonSynth[i].noteOff(1);
             //if ( !buttonSynth[i].isOn() ) buttonSynth[i].noteOff(1);
        }

        if ( selected != -1 && !buttonSynth[selected].isOn() ) {
            getPitch(selected) => buttonSynth[selected].setNote;
            if (! buttonSynth[selected].isOn()) {
                buttonSynth[selected].noteOn(1);
                <<<"on", selected>>>;
            }
        }

    }

}
