public class SubSynth extends GuitarSynth {
    SqrOsc o => LPF lpf => ADSR adsr;
    0 => o.gain;
    4400 => lpf.freq;
    11 => lpf.Q;

    //lpf.set(1000,5);
    adsr.set(.5::second,.4::second, 1, .5::second);

    public void gain(float f) { f*12 => o.gain; }
    public void setNote(int n) { n => note; Std.mtof(n) => o.freq; }
    public void noteOn(float velocity) { 
        1 => o.gain;
        adsr.keyOn();
        1 => on;

        xmit.startMsg("/hit", "i");
        note => xmit.addInt;
        <<< "on ", note >>>;
    }

    public void noteOff(float velocity) { 
        adsr.keyOff(); 
        0 => on;
        <<<"off">>>;
    }
//    public void pitchBend(float bend) { Std.mtof(note) + ( Std.mtof(note+2) - Std.mtof(note) )*bend => o.freq; }
    public void pitchBend(float bend) { 4400 - 3800*bend => lpf.freq; }


    public void connect(UGen u) { adsr => u; }
    public void disconnect(UGen u) { adsr =< u; }

}
