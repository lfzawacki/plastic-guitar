public class MidiSynth extends GuitarSynth {

    MIDIsender midi;

    0 => static int midiport;

    int instancePort;

    public void connect(UGen u) { 
        midi.open(midiport);
        instancePort => midiport;
        midiport++;
    }
    public void gain(float f) {  }
    public void setNote(int n) { n => note; }

    public void pitchBend(float bend) { midi.pitchbend((127*bend)$int); }

    public void noteOn(float velocity)  {
        1 => on;
        midi.noteon(note);
    }
    
    public void noteOff(float velocity) { 
        0 => on;
        midi.noteoff(note);
        0 => note;
    }

}
