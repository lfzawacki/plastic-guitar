public class NoisePick {
    Noise o => ADSR adsr => blackhole;
    0 => o.gain;

    adsr.set(0::second,.05::second, 0, 0::second);

    public void noteOn(float velocity) { 0.5 => o.gain; adsr.keyOn(); }
    public void connect(UGen u) {}
}

