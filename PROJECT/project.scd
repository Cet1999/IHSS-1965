b = Bus.control(s);
~b1 = Bus.control(s);
OSCdef( \ctl1, {
	arg msg;
	var val, pitch;
	val = msg[1].asFloat;
	pitch = val.linlin(0.0, 1.0, 48.0, 72.0);
	b.set(pitch);
	msg.postln;
}, "/ctl1");

OSCdef( \b1pitch, {
	arg msg;
	var val;
	val = msg[1].asFloat;
	~b1.set(val);
	msg.postln;
}, "/b1pitch");

c = Buffer.read(s, "C:/Users/Jingyu Zhuang/Desktop/glitch.wav");
e = Buffer.read(s, "C:/Users/Jingyu Zhuang/Desktop/glitch2.wav");

SynthDef(\sampy, {
	arg buf, spd=1, amp = 1;
	var sig;
	sig = PlayBuf.ar(1, buf, rate:spd, doneAction:2);
	Out.ar(0, sig*amp);
}).add;

d = Synth(\sampy, [\buf, c]);


OSCdef( \hitbtm, {
	~s1 = Synth(\sampy, [\buf, c]);
	//~s1.map(\amp, ~b1);
}, "/hitbtm");

SynthDef(\sampy, {
	arg buf, spd=1, amp = 1;
	var sig;
	sig = PlayBuf.ar(1, buf, rate:spd, doneAction:2);
	Out.ar(0, sig*amp);
}).add;

f = Synth(\sampy, [\buf, e]);


OSCdef( \hitbnm, {
	~s1 = Synth(\sampy, [\buf, e]);
	//~s1.map(\amp, ~b1);
}, "/hitbnm");

SynthDef(\siney, {
	arg pitch=60;
	var sig, freq;
	freq = pitch.midicps;
	sig = SinOsc.ar(freq);
	Out.ar(0, sig);
}).add;
a = Synth(\siney);
a.map(\pitch, b);

s.meter