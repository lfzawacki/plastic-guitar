public class NoisePick {
    Noise o => ADSR adsr => blackhole;
    0 => o.gain;

    adsr.set(0::second,0::second, 1, .1::second);

    public void noteOn(float velocity) { 0.5 => o.gain; adsr.keyOn(); }
    public void noteOff(float velocity) { adsr.keyOff(); }
    public void connect(UGen u) { adsr => u; }
}

