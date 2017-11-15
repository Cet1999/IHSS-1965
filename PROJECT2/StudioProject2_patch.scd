(

	//Sample Buffers
	~b1 = Buffer.read(s, "E:/THINGS/IHSS-1965/PROJECT2/1.wav" );
	~b2 = Buffer.read(s,  "E:/THINGS/IHSS-1965/PROJECT2/2.wav");
    ~b3 = Buffer.read(s,  "E:/THINGS/IHSS-1965/PROJECT2/3.wav");

	//Sampler
	SynthDef(\samp, {
		arg buf, amp=1;
		var sig;
		sig = PlayBuf.ar(2, buf, doneAction:2);
		Out.ar(0, sig*amp);
	}).add;


	//Subtractive Synth
	SynthDef(\subsyn, {
		arg pitch = 60, tune=0, gate=1, atk=1, rel=0.5, amp=1 , pos=0;
		var osc1, osc2, freq1, freq2, sig, env;
		env = EnvGen.ar(Env.asr(atk, 1, rel),gate,doneAction:2);
		freq1 = pitch.midicps;
		freq2 = (pitch+tune).midicps;
		osc1 = SinOsc.ar(freq1);
		osc2 = SinOsc.ar(freq2);
		sig = Mix.ar([osc1,osc2]);
		sig = Pan2.ar(sig,pos);
		Out.ar(0,sig*env*amp);
	}).add;


	//formlet
	SynthDef(\formlet, {
		arg t_tr = 0, pitch = 60, amp=0.2, atk = 0.01, dur=0.25,pos=0;
		var sig, freq;
		freq = pitch.midicps;
		sig = Formlet.ar(K2A.ar(t_tr), freq, atk, dur);
		sig = Pan2.ar(sig,pos);
		Out.ar(0, sig*amp);
	}).add;


	~gb1 = Buffer.read(s, "E:/THINGS/IHSS-1965/PROJECT2/1.wav" );
	SynthDef(\grain, {
		arg rate=5, dur = 0.1, amp = 1, buf, envbuf = -1, pitch=1, pan=0, gate=1;
		var sig, env;
		env = EnvGen.ar(Env.asr(0.01, 1, 0.3), gate, doneAction:2);
		sig = GrainBuf.ar(2, Dust.ar(rate), dur, buf, pitch, LFNoise2.kr(0.1).range(0, 1), 2, pan, envbuf);
		Out.ar(0, sig*env*amp);
	}).add;




)

~s1 = Synth(\samp,[\buf,~b1]);
~s2 = Synth(\samp,[\buf,~b2]);
~s3 = Synth(\samp,[\buf,~b3]);

~su1 = Synth(\subsyn,[\pitch,40,\tune,0.5,\gate,1,\atk,0.01,\rel,0.1,\pos,0]);
~su1 = Synth(\subsyn,[\pitch,60,\tune,2,\gate,1,\atk,0.1,\rel,0.1,\pos,0]);
~su1.set(\gate,0);
~su2 = Synth(\subsyn,[\pitch,80,\tune,-1.5,\gate,1,\atk,5.2,\rel,0.01,\pos,0]);
~su2.set(\gate,0)

~f1 = Synth(\formlet);
~f1.set(\t_tr,1,\pitch,80,\amp,5,\atk,0.01,\dur,0.25,\pos,0);
~f1.set(\t_tr,1,\pitch,90,\amp,5,\atk,0.01,\dur,0.25,\pos,0);

~g1 = Synth(\grain,[\rate,5,\dur,0.08,\buf,~gb1,\pitch,1,\pan,0,\gate,1]);
~g1.set(\gate,0)

Server.default.makeGui; //make a gui with record button



