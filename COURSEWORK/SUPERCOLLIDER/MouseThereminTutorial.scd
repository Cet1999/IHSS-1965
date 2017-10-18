//MOUSE THEREMIN
//v1 - basic
//v2 - click to sound
//v3 - adjustable pitch range
//v4 - autotune
//v5 - amplitude

//A Theremin like instrument that you control with the mouse
/*
In this first version, we make a SynthDef that has a sine wave oscillator as its basic sound generator.  We also track the mouse-Y position and use this data to control the pitch of the sine wave.

*/

(//v1 - Basic Frequency control from mouseY
SynthDef(\mousey, {
	var osc, freq;
	//Frequency is determined by the mouse-y position
	//The minval argument of the MouseY ugen corresponds to the top of the screen,
	//so you actually put the high range of the frequency there
	//The lag argument is a smoothing filter that will interpolate values
	//between the last MouseY and the current over the amount of time
	//specified in this argument
	freq = MouseY.kr(minval:1000, maxval:100, lag:0.0001);
	//A simple sine oscillator with the freqency controlled by MouseY
	osc = SinOsc.ar( freq );
	//Out to the audio interface channel 0, usually left speaker
	Out.ar(0, osc);
}).add;
)

(//v2 - Turn on and off sound with mouse button
/*
In version 2, we use data from the mouse button to turn the synth on and off.  We use a basic envelope to implement this and have the mouse button trigger the attack portion of the envelope when pressed and the release portion of the envelope when released.
*/
SynthDef(\mousey, {
	var osc, freq, env, envgate;
	//The MouseButton ugen is used as the envelope gate
	//When the mouse is pressed, MouseButton gives 1, if it is not it gives 0
	envgate = MouseButton.kr(lag:0.0001);
	//An envelope using the sustaining envelope shape 'asr'
	//When the gate argument is 1, the envelope will run the attack and sustain at the sustain level
	//until gate is 0 which will release the envelope
	//The gate is being controlled by the mouse button
	env = EnvGen.ar( envelope:Env.asr(releaseTime:0.001), gate:envgate );
	freq = MouseY.kr(minval:1000, maxval:100, lag:0.0001);
	osc = SinOsc.ar( freq );
	//Don't forget to multiply the oscillator by the envelope
	Out.ar(0, osc*env);
}).add;
)


(//v3 - Change pitch range through arguments
/*
This version introduces arguments to our SynthDef and lets us set the max and min pitches for our instrument.  Here we also begin to use a midinote scale for pitches instead of hz.
*/
SynthDef(\mousey, {
	//Low and high arguments for pitch range which are now expressed as midi note numbers
	arg pitchLo=30, pitchHi=80;
	var osc, freq, env, envgate, pitch;
	//Reappropriated the MouseY ugen from freq above
	//However now it will output a range of midi note numbers between
	//the range fixed in the arguments pitchLo and pitch Hi
	pitch = MouseY.kr(minval:pitchHi, maxval:pitchLo, lag:0.0001);
	envgate = MouseButton.kr(lag:0.0001);
	env = EnvGen.ar( envelope:Env.asr(releaseTime:0.001), gate:envgate );
	//Convert midi note to hz
	freq = pitch.midicps;
	osc = SinOsc.ar( freq );
	Out.ar(0, osc*env);
}).add;
)

(//v4 - Autotune
/*
This version uses a rounding function so that we always play in tune.
*/
SynthDef(\mousey, {
	//Argument pitchres is a rounding factor to 'autotune' the sine wave to a pitch increment
	arg pitchLo=30, pitchHi=80, pitchres=0.5;
	var osc, freq, env, envgate, pitch;
	//Here the .round() function rounds the output
	//of MouseY to the nearest pitchres
	//0.5 would be rounded to the semitone
	pitch = MouseY.kr(minval:pitchHi, maxval:pitchLo, lag:0.0001).round(pitchres);
	envgate = MouseButton.kr(lag:0.0001);
	env = EnvGen.ar( envelope:Env.asr(releaseTime:0.001), gate:envgate );
	freq = pitch.midicps;
	osc = SinOsc.ar( freq );
	Out.ar(0, osc*env);
}).add;
)

(//v5 - Control volume with mouse x
/*
This version allows us to control the amplitude/volume with data from the mouse-x coordinate.
*/
SynthDef(\mousey, {
	arg pitchLo=30, pitchHi=80, pitchres=0.5;
	var osc, freq, env, envgate, pitch, amp;
	//Assign mouse x to a decibel value between
	//-40db and 10db
	//The function .dbamp will convert to a linear amplitude
	//This is important otherwise the synth will be incredibly loud
	amp = MouseX.kr(-40, 10).dbamp;
	pitch = MouseY.kr(minval:pitchLo, maxval:pitchHi, lag:0.0001).round(pitchres);
	envgate = MouseButton.kr(lag:0.0001);
	env = EnvGen.ar( envelope:Env.asr(releaseTime:0.001), gate:envgate );
	freq = pitch.midicps;
	osc = SinOsc.ar( freq );
	//Multiply the output by the amp controlled by mouse x
	Out.ar(0, osc*env*amp);
}).add;
)

a = Synth(\mousey);
a.set(\pitchLo, 70, \pitchHi, 75);(//v5 - Control volume with mouse x


/*
x-axis pitch
*/

SynthDef(\mousey, {
	arg pitchLo=40, pitchHi=90, pitchres=1;
	var osc, freq, env, envgate, pitch, amp;
	//Assign mouse x to a decibel value between
	//-40db and 10db
	//The function .dbamp will convert to a linear amplitude
	//This is important otherwise the synth will be incredibly loud
	amp = MouseY.kr(-40, 10).dbamp;
	pitch = MouseX.kr(minval:pitchLo, maxval:pitchHi, lag:0.0001).round(pitchres).poll;
	envgate = MouseButton.kr(lag:0.0001);
	env = EnvGen.ar( envelope:Env.asr(releaseTime:0.001), gate:envgate );
	freq = pitch.midicps;
	osc = SinOsc.ar( freq );
	//Multiply the output by the amp controlled by mouse x
	Out.ar(0, osc*env*amp);
}).add;


a = Synth(\mousey);
a.free();
a.set(\pitchLo, 70, \pitchHi, 75);