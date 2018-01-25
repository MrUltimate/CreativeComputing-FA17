import processing.sound.*;

AudioIn in;
Amplitude amp;

float[] sample = new float[500];

void setup()
{
  size(640, 400);
  background(255);
  frameRate(300);
  
  in = new AudioIn(this, 0);
  in.start();
  amp = new Amplitude(this);
  amp.input(in);
  
}

void draw()
{
    float volume = amp.analyze();
    .//println(volume);
    ellipse(width*0.5, height*0.5, volume*200, volume*200);
}