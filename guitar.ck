public class Guitar {

    [ 0, 2, 3, 5, 7, 8, 10] @=> int buttons[];
    [ 0 ,0, 0, 0, 0, 0, 0, 0, 0, 0 ] @=> int pressed[];
    4 => int octave;
    0 => int pick;
    0 => int lifted;
    0 => float bend;
    4 => int base;
    0 => int offset;

    fun static int button_cap() { return 10; }

    static GuitarSynth buttonSynth[];
    NoisePick noise;

    fun static void setup(string mode, UGen u) {
        new GuitarSynth[10] @=> buttonSynth;
        if (mode == "normal") {
            for (0 => int i; i < button_cap(); i++) {
                new SubSynth @=> buttonSynth[i];
                buttonSynth[i].connect(u);
            }
        }

        if (mode == "stk") {
            for (0 => int i; i < button_cap(); i++) {
                new StkSynth @=> buttonSynth[i];
                new Moog => buttonSynth[i].synth;
                buttonSynth[i].connect(u);
            }
        }
        
        if (mode == "midi") {
            for (0 => int i; i < button_cap(); i++) {
                new MidiSynth @=> buttonSynth[i];
                buttonSynth[i].connect(blackhole);
            }
        }
    }

    public int getPitch(int i) {

        // just need a proper mod function
        int octave_offset;
        if (offset < 0) {
            -1 + (i+offset)/buttons.cap() => int octave_offset;
            buttons.cap() + offset%buttons.cap() => offset;
        } else {
             (i+offset)/buttons.cap() => octave_offset;
        }

        (offset + i)%buttons.cap() => int noteIndex;

        return base + (octave+octave_offset)*12 + buttons[noteIndex];
    }

    public void bendNote(float f) {
        for (0=> int i; i < pressed.cap(); i++) {
            if (pressed[i]) {
                //getPitch(i) + ( getPitch(i+1) -getPitch(i) )*f => buttonSynth[i].freq;
                buttonSynth[i].pitchBend(f);
            }
        }

    }

    public void update(int K, int down) {}

    public void pickNote() {
        for (0=> int i; i < pressed.cap(); i++) {
            if (pressed[i]) {
                getPitch(i) => buttonSynth[i].setNote;
                buttonSynth[i].noteOn(1);
            }
        }
        noise.noteOn(1);
    }

    public void octaveUp() { if (octave > 5) return; octave++; }
    public void octaveDown() { if (octave < 2) return; octave--; }

}
