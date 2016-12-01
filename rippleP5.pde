// I am using code from the two processing gurus
//
//www.toxi.co.uk  toxi
//http://postspectacular.com/  toxi's portfolio
//
//www.flight404.com Flight 404 Robert Hodgins
//http://roberthodgin.com Robert's Portfolio
//
//Flight 404's (Robert) code is found here
//http://processing.org/discourse/yabb2/YaBB.pl?num=1159134845
//
//http://www.flight404.com/processingBeta/_videos/ripples.mov
//
//http://www.flight404.com/processingBeta/ripples.zip
//
//Toxi's code is here
//http://toxi.co.uk/p5/index.htm
//http://toxi.co.uk/p5/water
//http://toxi.co.uk/p5/water/watertest.pde
//
//Here are some videos of what I did with it. The background image is all done by processing as well.
//
//
//http://www.youtube.com/watch?v=s3rkN3aS9qs
//
//Vimeo
//http://vimeo.com/9709955
//
//
//It's a wonder what you can create with Processing!




import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;

PImage q, w, e, r, t, y, u; 

public boolean usevideo = false;
import processing.opengl.*;
PImage leafa;
PImage windowa;
PImage pebblea;
PGraphics leaf;
PGraphics window;
PImage now;
public PImage back;
public int X, Y=0;
int xSize           = 600/2;
int ySize           = 600/2;
int xMid            = xSize/2;//
int yMid            = ySize/2;//

int xRes            = 32;//60
int yRes            = 32;//60
int res             = 60;//15
public int tt=0;
public int kkk;
public float yoff, zoff, ns=0.1, zs=8;
public  float nx, ny, z1, z2;

//Movie mm;
PImage mmpic;
PGraphics mmpg;
PImage op;
PGraphics opg;
PGraphics opg2;
Ripple ripple;
POV pov;
PImage lo;
float counter = 0.0;
boolean lighting = true;
boolean raining = false;
boolean online = false;
///

//import processing.video.*; 
public int pn=0; 

public String savename ="k-ripples-"; 
//MovieMaker mmv;  
public boolean firstpass = false; 
public int frate =  30;//60 is possible
public boolean inc = false; 
public boolean addmovframe = false; 
public boolean dovid =false; 
public boolean looponce = false; 
public boolean snap = false; 

void saveget() { 
  setupvid(); 
  if (dovid) { 
    if (inc) { 
      pn++;
    } 


    save(savename+str(pn)+".png");
  } 

  //   if (addmovframe){ 
  //    mmv.addFrame(); 
  //   }  
  //   
  if (looponce) { 
    noLoop(); 
    exit();
  } 

  //  if (keyPressed ==true && ( key=='`' || key =='~' || key == ESC)){ 
  //   mmv.finish(); 
  //  exit();  
  //  }
} 

void setupvid() { 
  // if (firstpass) 
  // {tt++;
  //   mmv = new MovieMaker(this, width, height, savename+str(tt)+".mov", 30,  
  //                     MovieMaker.ANIMATION, MovieMaker.LOSSLESS); 
  //                      
  //                     if (snap){ 
  //                       save("snap"+savename+str(pn)+".png"); 
  //                     } 
  //                     firstpass = false; 
  //                      
  //                      
  //}
} 


void loop() { 

  //   saveget();  //uncomment to save video
} 






public PFont font1; 
void setup() {


  //  font1 = createFont("arial",12);
  //  q=loadImage("fish.png");
  //  w=loadImage("ell3.png");
  //  e=loadImage("bevelm-1.png");
  //  r=loadImage("457.png");
  //  t=loadImage("processingmoney.png");
  //  y=loadImage("ell.png");


  size(800, 400, OPENGL);
  // size(xSize, ySize, P3D);
  //size(300, 300, P3D);
  //back = loadImage("stressfree.png");
  //size(screen.width,screen.height,P3D);
  //windowa = loadImage("window.jpg");
  //window = createGraphics(width, height, P3D); //<>//
  //window.loadPixels();

  //window.beginDraw();


  //window.image(windowa, 0, 0, width, height);



  //window.endDraw();


  //window.updatePixels();
  // colorMode(HSB,255);
  // if (usevideo){
  //   mm= new Movie (this,"drawing.mov");
  //   mm.loop();
  // }
  now = new PImage(width, height);
  mmpic = new PImage(255, 255);
  op = new PImage(xRes, yRes);
  lo = new PImage(xRes, yRes);
  opg = createGraphics(xRes, yRes, P3D);
  opg2 = createGraphics(xRes, yRes, P3D);
  mmpic.loadPixels();
  lo.loadPixels();
  //  if (usevideo){
  //  mmpic.pixels = mm.pixels;
  //  }
  mmpg = createGraphics(width, height, P3D);
  opg.loadPixels();

  //  mmpg.loadPixels();
  //  mmpg.beginDraw();
  //  mmpg.image(mmpic,0,0,width,height);
  //  mmpg.endDraw();
  //  mmpg.updatePixels();


  background(125);
  loadPixels();
  fill(255);
  noStroke();

  ripple         = new Ripple();
  pov            = new POV(200.0);

  smooth();
  //hint(ENABLE_OPENGL_4X_SMOOTH);
  // hint(DISABLE_OPENGL_ERROR_REPORT);
  cam = new PeasyCam (this, width);
  lights();
  frameRate(30);
}

//void movieEventx(Movie mm){
//  if (usevideo){
//          mm.read(); 
//          kkk=0;
//           X = mouseX;
//        Y = mouseY; 
//        //  mmpic.loadPixels();
//          mmpic.pixels = mm.pixels;
//          mmpic.updatePixels();
//         mmpg.loadPixels();
//         // opg = createGraphics(xRes,yRes,P3D);
//         opg2.loadPixels();  
//         mmpg.beginDraw();
//          opg2.beginDraw();
//         mmpg.image(mmpic,0,0,width,height);
//         opg2.image(mmpic,0,0,xRes,yRes);
//         mmpg.endDraw();
//          opg2.endDraw();
//          mmpg.updatePixels();
//           opg2.updatePixels();
//          op.loadPixels();
//          opg.loadPixels();
//         if(X< width-xRes){
//           
//            if (Y < height-yRes){
//              
//              
//                   for (int x1=X;x1<X+(xRes-1);x1++){
//                       for (int y1=Y;y1<Y+(yRes-1);y1++){
//                         
//                         
//                        if (kkk< (x1+xRes*y1)){ 
//                         kkk++;
//                         //op.pixels[x1+xRes*y1]= mmpg.get(x1,y1);
//                         
//                        }
//                         //op.pixels[x1+xRes*y1]= mmpg.pixels[x1+xRes*y1];
//                       //  op.pixels[kkk]=mmpg.pixels[x1+xRes*y1];
//                        op.pixels[kkk]= mmpg.get(x1,y1);
//                         // opg.pixels[x1+xRes*y1]= mmpg.get(x1,y1);
//                          //println(X);
//                          //println(Y);
//                       }
//                      }
//          
//             } 
//          }
//           
//          op.updatePixels();
//          opg.updatePixels();
//          //op.pixels=opg2.pixels;
//          
//  }
//  translate(0,0,-1600);
// 
//}
void draw() {


  //if (!online) this.frame.setTitle("FrameRate : "+str(frameRate));
  nx=yoff;
  ny=yoff;

  //z1,z2;

  noiseDetail(8, mouseY*(0.6/height));

   background(75);
  //background(back);

  // image(mmpg,0,0); 


  // now.pixels = mmpg.pixels;

  //window.mask(mmpg);
  //now.mask(mmpg);
  //image(window,0,0);
  //image(now,0,0);
  // image(opg,mouseX,mouseY);

  //pov.exist();
  ripple.exist();
  counter += 1.0;
  //  for (int ix=0;ix <pixels.length;ix++){
  //    if (ix%2==0){
  //    // pixels[ix]=lerpColor(mmpg.pixels[ix],window.pixels[ix],2);
  //    pixels[ix]=blendColor(mmpg.pixels[ix],window.pixels[ix],2);
  //    } 
  ////      if (ix%2==0){
  ////     pixels[ix]=mmpg.pixels[ix];
  ////    } 
  //  }
  // updatePixels();
  //translate(0,0);



  zoff+=0.045;
  yoff-=0.06;

  // loop();
}

void keyPressed() {
  if (keyCode == UP) {
    pov.elevation += .1;
    println(    pov.elevation);
  } else if (keyCode == DOWN) {
    pov.elevation -= .1;
    println(    pov.elevation);
  } else if (keyCode == RIGHT) {
    pov.azimuth -= .1;
    println(    pov.azimuth);
  } else if (keyCode == LEFT) {
    pov.azimuth += .1;
    println(    pov.azimuth);
  }

  if (key == ' ') {
    lighting = !lighting;
  } else if (key == 'r' || key == 'R') {
    raining = !raining;
  }

  if (!online) {
    if (key=='s')save("water.png");
  }
}

float findAngle(float x1, float y1, float x2, float y2) {
  float xd = x1 - x2;
  float yd = y1 - y2;

  float t = atan2(yd, xd);
  return t;
}

void mouseMoved() {
  //if (mousePressed== true){
  // X = mouseX;
  //Y = mouseY; 
  //  }
}