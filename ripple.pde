class Ripple {
  float[][] r0;
  float[][] r1;
  float[][] r2;

  float decay;
  float angle;
  float heightMulti;

  // scary variables... but not that bad.
  // xm, ym are for the position of the mouse
  // xp, yp, zp is the x, y, and z position
  // xa, ya, za, xb, yb, zb are for finding the angle to 
  // an imagined light source in order to fake a directional light
  // admittedly, this part of the code is poorly written

  float xm, ym;
  float xp, yp, zp;
  float xa, ya, za;
  float xb, yb, zb;

  Ripple() {
    r0                 = new float[xRes][yRes];
    r1                 = new float[xRes][yRes];
    r2                 = new float[xRes][yRes];
    decay              = .99;  // the speed at which the waves decay (1.0 is no decay) (0.0 is instant decay to nothing)
    heightMulti        = .02;  // a multiplier for the height of the waves
  }

  void exist() {
    if (mousePressed) {
      makeRipples();
    }

    if (raining) {
      makeRain();
    }
    findRipples();
    swapBuffers();
    render();
  }

  void makeRipples() {
    xm = constrain((int)(mouseX/(xSize/xRes)), 0, xRes-1);
    ym = constrain((int)(mouseY/(ySize/yRes)), 0, xRes-1);
    for (int y=1; y<yRes-1; y++) {
      for (int x=1; x<xRes-1; x++) {
        float d = dist(xm, ym, x, y);
        if (d < 3) {
          r1[x][y] -= pow(((3 - d)/3.0), 2) * 500.0;
        }
      }
    }
  }

  void makeRain() {
    xm = constrain((int)(random(xSize)/(xSize/xRes)), 0, xRes-1);
    ym = constrain((int)(random(ySize)/(ySize/yRes)), 0, xRes-1);
    for (int y=1; y<yRes-1; y++) {
      for (int x=1; x<xRes-1; x++) {
        float d = dist(xm, ym, x, y);
        if (d < 2) {
          r1[x][y] -= pow(((2 - d)/2.0), 2) * 250.0;
        }
      }
    }
  }

  void findRipples() {
    for (int y=1; y<yRes-1; y++) {
      for (int x=1; x<xRes-1; x++) {
        r0[x][y] = (r1[x-1][y] + r1[x+1][y] + r1[x][y-1] + r1[x][y+1]) / 4.0;
        r0[x][y] = r0[x][y] * 2.0 - r2[x][y];
        r0[x][y] *= decay;
      }
    }
  }

  void swapBuffers() {
    for (int y=0; y<yRes; y++) {
      for (int x=0; x<xRes; x++) {
        r2[x][y] -= (r2[x][y] - r1[x][y]) * decay;
        r1[x][y] -= (r1[x][y] - r0[x][y]) * decay;
      }
    }
  }

  void render() {
    colorMode(RGB, 255);
    for (int y=2; y<yRes; y++) {
      //beginShape(QUAD_STRIP);
      beginShape(TRIANGLE_STRIP);
      for (int x=1; x<xRes; x++) {

        //z1=noise(nx, ny, zoff);
        //z2=noise(nx, ny+ns, zoff);

        xp = (x - xRes/2) * res;
        yp = (y - yRes/2) * res;
        zp = r1[x][y] * heightMulti;

        //if (lighting) {
        //  ya = (y - yRes/2) * res;
        //  za = r1[x][y] * heightMulti;
        //  yb = ((y-1) - yRes/2) * res;
        //  zb = r1[x-1][y-1] * heightMulti;

        //  angle = findAngle(ya, za, yb, zb)*125.0 + 125;
        //  // fill(angle/2.0 + 125,50,angle);

        //  color d = opg2.get(x, y);
        //  // fill(d);
        //  fill(0, z2*160, z2*255, pow(10, 0.85+z2*2));
        //  // fill(0,z1*160,z1*255,pow(10,0.85+z1*2));
        //} else {
        //  // fill(r0[x][y]/5.0 + 125.0);

        //  color d = opg2.get(x, y);
        //  ///  fill(d);
        //  //fill(0,z2*160,z2*255,pow(10,0.85+z2*2));
        //  fill(0, z1*160, z1*255, pow(10, 0.85+z1*2));
        //}
        fill(zp);
        vertex(xp, yp, zp);
        nx+=ns;
        xp = (x - xRes/2) * res;
        yp = ((y-1) - yRes/2) * res;
        zp = r1[x][y-1] * heightMulti;
        //if (lighting) {
        //  ya = ((y-1) - yRes/2) * res;
        //  za = r1[x][y-1] * heightMulti;
        //  yb = ((y-2) - yRes/2) * res;
        //  zb = r1[x-1][y-2] * heightMulti;

        //  angle = findAngle(ya, za, yb, zb)*125.0 + 125;
        //  color c = color(angle/2.0 + 125, 50, angle);
        //  color d = opg2.get(x, y);
        //  fill(d);
        //  // fill(0,z2*160,z2*255,pow(10,0.85+z2*2));
        //  //fill(0,z1*160,z1*255,pow(10,0.85+z1*2));
        //} else {

        //  //fill(r0[x][y-1]/5.0 + 125.0);
        //  color d = opg2.get(x, y);
        //  // fill(d);
        //  //fill(0,z2*160,z2*255,pow(10,0.85+z2*2));
        //  fill(0, z1*160, z1*255, pow(10, 0.85+z1*2));
        //}
        fill(zp);
        vertex(xp, yp, zp);
        //rect(xp, yp, 10, 10);
      }
      endShape();
      ny+=ns;
    }
  }
}