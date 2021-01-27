class Firework {
  PVector pos, vel, acc;
  color c;
  boolean done=false;
  int type;
  PVector[] img;
  boolean start=false;
  float time;
  Firework(PVector pos, PVector vel, int type, color c, float wait) {
    this.pos=pos;
    this.vel=vel;
    this.acc=new PVector(0, 0.05);
    this.c=c;
    this.type=type;
    this.time=wait;
    if (this.type==4) {
      this.img=this.g_i(HOUSE);
    }
  }
  void explode() {
    this.done=true;
    if (this.type==3) {
      for (float a=0; a<PI*2; a+=PI*2/30) {
        particles.add(new Particle(this.pos.copy(), new PVector(cos(a)*0.4, sin(a)*0.4).add(r(-0.2, 0.2), r(-0.2, 0.2)), new PVector(0, 0.02), this.g_c(), this.type));
      }
      return;
    }
    if (this.type==4) {
      for (PVector p : this.img) {
        if (p!=null) {
          particles.add(new Particle(this.pos.copy(), p, new PVector(0, 0.02), this.c, this.type));
          particles.add(new Particle(this.pos.copy(), p, new PVector(0, 0.02), this.c, this.type));
          particles.add(new Particle(this.pos.copy(), p, new PVector(0, 0.02), this.c, this.type));
        }
      }
      return;
    }
    if (this.type==5) {
      for (float a=0; a<PI*2; a+=PI*2/40) {
        particles.add(new Particle(this.pos.copy(), new PVector(cos(a)*0.4, sin(a)*0.4).add(r(-0.2, 0.2), r(-0.2, 0.2)), new PVector(0, 0.02), this.c, this.type));
      }
      return;
    }
    for (float a=0; a<PI*2; a+=PI*2/50) {
      if (this.type==0) {
        particles.add(new Particle(this.pos.copy(), new PVector(cos(a)*0.75, sin(a)*0.75), new PVector(0, 0.02), this.c, this.type));
        particles.add(new Particle(this.pos.copy(), new PVector(cos(a)*0.75, sin(a)*0.75), new PVector(0, 0.02), this.c, this.type));
      }
      if (this.type==1) {
        a-=PI*2/50/2; 
        particles.add(new Particle(this.pos.copy(), new PVector(cos(a)*1.25, sin(a)*1.25), new PVector(0, 0.02), this.c, this.type)); 
        particles.add(new Particle(this.pos.copy(), new PVector(cos(a)*1, sin(a)*1), new PVector(0, 0.02), this.c, this.type));
        particles.add(new Particle(this.pos.copy(), new PVector(cos(a)*1.25, sin(a)*1.25), new PVector(0, 0.02), this.c, this.type)); 
        particles.add(new Particle(this.pos.copy(), new PVector(cos(a)*1, sin(a)*1), new PVector(0, 0.02), this.c, this.type));
      }
      if (this.type==2) {
        a-=PI*2/50/4; 
        particles.add(new Particle(this.pos.copy(), new PVector(cos(a)*2.8, sin(a)*2.8), new PVector(0, 0.02), this.c, this.type)); 
        particles.add(new Particle(this.pos.copy(), new PVector(cos(a)*2.3, sin(a)*2.3), new PVector(0, 0.02), this.c, this.type)); 
        particles.add(new Particle(this.pos.copy(), new PVector(cos(a)*1.8, sin(a)*1.8), new PVector(0, 0.02), this.c, this.type));
        particles.add(new Particle(this.pos.copy(), new PVector(cos(a)*2.8, sin(a)*2.8), new PVector(0, 0.02), this.c, this.type)); 
        particles.add(new Particle(this.pos.copy(), new PVector(cos(a)*2.3, sin(a)*2.3), new PVector(0, 0.02), this.c, this.type)); 
        particles.add(new Particle(this.pos.copy(), new PVector(cos(a)*1.8, sin(a)*1.8), new PVector(0, 0.02), this.c, this.type));
      }
    }
  }
  void update() {
    if (this.start==false) {
      return;
    }
    this.pos.add(this.vel); 
    this.vel.add(this.acc); 
    if (this.vel.y>=0) {
      this.explode();
    }
    if (this.type==3) {
      for (int i=0; i<10; i++) {
        particles.add(new Particle(this.pos.copy(), this.vel.copy().mult(-1).add(r(-0.2, 0.2), r(-0.2, 0.2)), new PVector(0, 0.02), this.g_c(), this.type));
      }
    }
    if (this.type==5) {
      for (int i=0; i<3; i++) {
        particles.add(new Particle(this.pos.copy(), new PVector(0, 0), new PVector(0, 0.02), color(220), this.type));
      }
    }
  }
  color g_c() {
    int c=int(r(0, 10)); 
    if (c<6) {
      return color(230, 230, 0);
    }
    if (c<8) {
      return color(230, 120, 0);
    }
    return color(230, 0, 0);
  }
  PVector[] g_i(String[] in) {
    PVector[] out=new PVector[in.length*in[0].length()];
    int y=0;
    for (String l : in) {
      for (int x=0; x<l.length(); x++) {
        if (str(l.charAt(x)).equals("#")) {
          out[x+y*l.length()]=new PVector(x-l.length()/2, y-in.length/2).mult(0.3);
        }
      }
      y++;
    }
    return out;
  }
  void draw() {
    if (this.start==false) {
      return;
    }
    noStroke(); 
    fill(this.c); 
    if (this.type==0) {
      rect(this.pos.x, this.pos.y, 1, 1);
    }
    if (this.type==1||this.type==4) {
      rect(this.pos.x, this.pos.y, 2, 2);
    }
    if (this.type==2) {
      rect(this.pos.x, this.pos.y, 3, 3);
    }
    if (this.type==5) {
      rect(this.pos.x, this.pos.y, 6, 6);
    }
  }
}
