public class SubSynth extends GuitarSynth {
    SqrOsc o /*=> LPF lpf*/ => ADSR adsr;
    0 => o.gain;

    //lpf.set(1000,5);
    adsr.set(0::second,.1::second, .5, .1::second);

    public void gain(float f) { f=> o.gain; }
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
    public void pitchBend(float bend) { note + ( (note+1) - note )*bend => o.freq; }

    public void connect(UGen u) { adsr => u; }
    public void disconnect(UGen u) { adsr =< u; }

}
