#!/bin/bash

# This groups similar chuck files to simulate a kind of file include system, seeing that it doesnt exist in Chuck
# You can customize the files included or the values of the variables

midi_synth="midi_sender.ck synths/midi_synth.ck"
guitar_synth="synths/guitar_synth.ck synths/sub_synth.ck synths/stk_synth.ck $midi_synth"
guitar="$guitar_synth noise_pick.ck guitar.ck legato_guitar.ck picked_guitar.ck"
input_handler="handlers/input_handler.ck handlers/slider_guitar_handler.ck handlers/guitar_handler.ck handlers/keyboard_handler.ck handlers/mouse_handler.ck"

${CHUCK-chuck} $guitar $input_handler main.ck:${1-sub}:${2-guitar}:$3
