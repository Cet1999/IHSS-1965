

//SUPERCOLLIDER BASICS//

//EVALUATING CODE
////cmd-return
//To evaluate code you use command return.

////Evaluating Single Lines
/*
If you're evaluating a single line of code,
just place your cursor anywhere on the line and hit command return.
*/
"power".postln;
62*89;

////Evaluating Multiple Lines
/*
If you'd like to evaluate more than one line of code,
or if you want to evaluate one part of a line,
then you just highlight whatever you want to evaluate,
and press command return.
*/

"powder".postln;
83*22;

////Declaring Scope w/Parenthesis
/*
You can also use parentheses to declare a scope of code to evaluate.
The parentheses work similar to evaluating a single line.
Your cursor can be anywhere within the parentheses
and when you press command period,
everything within the parentheses is evaluated.
*/
(
"There was a young lady named Bright".postln;
"who traveled much faster than light".postln;
"She set out one day".postln;
"in a relative way".postln;
"and came back the previous night".postln;
)


//BASIC SYNTAX
////Semi-colons
/*
The semi-colon delineates the end of one statement,
and the beginning of another
*/
(
"She set out one day".postln;
"in a relative way".postln;
)

////Spaces
/*
In most cases spaces are not taken into account in supercollider.
For example this line has a few extra spaces,
but supercollider evaluates the line just as if the spaces weren't there.
*/

"There was a young lady named Bright"    . postln;

////Wrapping
/*
The supercollider IDE will wrap your text,
and wrapped text is treated as a single line.
*/
"There was a young lady named Bright".postln;"who traveled much faster than light".postln;"She set out one day".postln;"in a relative way".postln;"and came back the previous night".postln;

//POSTING
/*
As you as you've already seen the post line  or post LN command
posts items the post window.
Post L N post the item and then adds a line, a hard return.
The post command does not add a new line.
*/

////postln
"how-now".postln;

////post
"how".post; "-".post; "now".postln;
"brown cow".postln;

//COMMENTING
/*
Commenting a single-line is done with two forward slashes
and you use the slash astrisk notation
to comment out out multiple lines or a paragraph.
*/

////Single Line
////Paragraphs
/*
Use /* */ to
comment out
multiple lines at
once
*/

//POST WINDOW
/*
The post window will post things you've posted to it,
and it will also display errors.
*/


//BOOTING THE SERVER
/*
The supercollider environment consists of a server and a client
The server handles all of the audio processes,
and the client is a programming environment.
So to make sound you have to boot the server.
You can do this with command b.
or the command s.boot;
You can reboot the server with s.reboot
*/

////cmd-b
s.boot;
////others (see Server help doc)
s.reboot;

//STOPPING
/*
To stop sound, and this is very important, you use command-period.
If you want to do a complete restart of everything,
you can recompile the server,
and the keyboard shortcut for that is command shift L.
*/
////cmd-.
{Pulse.ar(300)}.play;
////Recompile cmd-shift-l

//HELP
/*
you get help by pressing command D
If there's a particular item you want to look into
you highlight the word and press command D
This will bring up the help doc for that item.
You can evaluate code directly from the help files
or from examples in the help files
*/

////cmd-d
Gendy3

//SERVER UTILITIES
/*
ou can make a little GUI for the server
by using the s.makeWindow command
The GUI has volume control
you can quit and reboot the server
and it has a quick recording button
with S.meter can bring up a little audio meter
and it shows you signal levels of ins and outs
The freak scope shows you a waveform visualization
*/

s.makeWindow;
s.meter;
s.freqscope;




