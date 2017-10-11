SynthDef(\mt,{


}).add;



SynthDef(\test,{
	arg freq = 440;
	var sig;
	sig = SinOsc.ar(freq);
	Out.ar(0,sig);
}).add;


a = Synth(\test);
a.free;




(
SynthDef(\mt,{
	var sig, freq;
	freq = MouseY.kr(minval: 100, maxval: 5000, lag:0.01);
	sig = SinOsc.ar(freq);
	Out.ar(0,sig);

}).add;
)
a = Synth(\mt);
a.free


(
SynthDef(\mt,{
	var sig, freq, env, gate;
	gate = MouseButton.kr(lag: 0.01);
	env = EnvGen.ar(Env.asr(0.01, 1, 0.1), gate);
	freq = MouseY.kr(minval: 100, maxval: 5000, lag:0.01);
	sig = SinOsc.ar(freq);
	Out.ar(0,sig*env);
}).add;
)
a = Synth(\mt);
a.free;


(
SynthDef(\mt,{
	arg pitchlo = 40, pitchhi = 90;
	var sig, freq, env, gate, pitch;
	gate = MouseButton.kr(lag: 0.01);
	env = EnvGen.ar(Env.asr(0.01, 1, 0.1), gate);
	pitch = MouseY.kr(minval: pitchlo, maxval: pitchhi, lag:0.01);
	freq = pitch.midicps;
	sig = SinOsc.ar(freq);
	Out.ar(0,sig*env);
}).add;
)
a = Synth(\mt);
a.set(\pitchlo,60,\pitchhi,72);
a.free;




(
SynthDef(\mt,{
	arg pitchlo = 40, pitchhi = 90;
	var sig, freq, env, gate, pitch, amp;
	gate = MouseButton.kr(lag: 0.01);
	env = EnvGen.ar(Env.asr(0.01, 1, 0.1), gate);
	pitch = MouseX.kr(minval: pitchlo, maxval: pitchhi, lag:0.01).round(1);
	amp = MouseY.kr()
	freq = pitch.midicps;
	sig = SinOsc.ar(freq);
	Out.ar(0,sig*env);
}).add;
)
a = Synth(\mt);
a.free;
