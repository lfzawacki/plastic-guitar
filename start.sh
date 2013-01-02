#!/bin/bash

midi_synth="midi_sender.ck midi_synth.ck"
guitar_synth="guitar_synth.ck sub_synth.ck stk_synth.ck $midi_synth"
guitar="$guitar_synth noise_pick.ck guitar.ck legato_guitar.ck picked_guitar.ck"
input_handler="input_handler.ck guitar_handler.ck keyboard_handler.ck mouse_handler.ck"

chuck $guitar $input_handler main.ck:$1:$2:$3
