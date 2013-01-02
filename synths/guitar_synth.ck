public class GuitarSynth {

    "localhost" => string hostname;
    9090 => int port;

    // send object
    OscSend xmit;

    // aim the transmitter
    xmit.setHost( hostname, port );

    0 => int on;
    0 => int note;

    public void synth(Object o) { }
    public int isOn() { return on; }
    public void gain(float f) { }
    public void setNote(int n) { }
    public void noteOn(float velocity) { <<<"on">>>; }
    public void noteOff(float velocity) { <<<"off">>>; }
    public void pitchBend(float bend) { }

    public void connect(UGen u)    {  }
    public void disconnect(UGen u) {  }

}
