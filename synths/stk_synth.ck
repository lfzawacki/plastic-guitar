public class StkSynth extends GuitarSynth {

    StkInstrument s;

    public void synth(StkInstrument ins) { ins @=> s; }
    public void gain(float f) { }
    public void setNote(int n) { Std.mtof(note) => s.freq; }
    public void noteOn(float velocity)  { s.noteOn(velocity); 1 => on; }
    public void noteOff(float velocity) { s.noteOff(velocity); 0 => on;}
    public void pitchBend(float bend) { }

    public void connect(UGen u)    { s => u; }
    public void disconnect(UGen u) { s =< u; }

}
