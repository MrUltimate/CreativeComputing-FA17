import processing.sound.*;
import processing.pdf.*;

AudioIn in;
Amplitude amp;

float[] sample = new float[500];
int index = 0;
boolean isRecording = false;
float scale = 700;

void setup()
{
  size(640, 400, P3D);
  background(255);
  frameRate(300);
  
  in = new AudioIn(this, 0);
  in.start();
  amp = new Amplitude(this);
  amp.input(in);
}

void draw()
{
    background(255);
    //fill(0);
    float volume = amp.analyze();
    //println(volume);
    //ellipse(width*0.5, height*0.5, volume*2000, volume*2000);
    
    if(isRecording == true)
    {
      //save volume in array
      sample[index] = volume;
      index++;
      if(index == 500)
         {
           //stop recording
           isRecording = false;
         }
    }
    else
    {
      //draw waveform
      stroke(0);
      for(int i = 1; i< sample.length ; i++)
      {
        line(50 + i-1, height*.5 + sample[i-1]*scale, 
             50 + i,   height*.5 + sample[i]  *scale);
        line(50 + i-1, height*.5 - sample[i-1]*scale, 
             50 + i,   height*.5 - sample[i]  *scale);
      }
    }
}

void keyPressed()
{
   if(key == ' ')
   {
      if(isRecording == false)
      {
         isRecording = true; 
         index = 0;
      }
   }
   
   if(key == 's')
   {
       beginRaw(PDF, "output.pdf");
       endRaw();
   }
}