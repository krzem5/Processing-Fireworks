class Particle {
  PVector pos, vel, acc;
  color c;
  int lifetime;
  int total_lifetime;
  boolean done=false;
  int type;
  Particle(PVector pos, PVector vel, PVector acc, color c, int type) {
    this.pos=pos;
    this.vel=((type!=4&&type!=5)?vel.add(r(-0.2, 0.2), r(-0.2, 0.2)):vel.add(r(-0.04, 0.04), r(-0.04, 0.04)));
    this.acc=acc;
    this.c=c;
    this.total_lifetime=int(r(50, 150));
    this.lifetime=int(this.total_lifetime+0);
    this.type=type;
    if (this.type==1||this.type==4) {
      this.total_lifetime=int(r(120, 230));
      this.lifetime=int(this.total_lifetime+0);
    }
    if (this.type==2) {
      this.total_lifetime=int(r(180, 260));
      this.lifetime=int(this.total_lifetime+0);
    }
  }
  void update() {
    this.pos.add(this.vel);
    this.vel.add(this.acc);
    this.lifetime--;
    if (this.lifetime<=0) {
      this.done=true;
    }
  }
  void draw() {
    noStroke();
    fill(this.c);
    if (this.lifetime<75) {
      if (this.lifetime%10>4) {
        fill(0);
      }
    }
    if (this.lifetime<40) {
      fill(this.c, map(this.lifetime, 0, 40, 0, 100));
    }
    if (this.type==0) {
      rect(this.pos.x, this.pos.y, 1, 1);
    }
    if (this.type==3) {
      rect(this.pos.x, this.pos.y, 1.25, 1.25);
    }
    if (this.type==1||this.type==4||this.type==5) {
      rect(this.pos.x, this.pos.y, 1.5, 1.5);
    }
    if (this.type==2) {
      rect(this.pos.x,this.pos.y,2,2);
    }
  }
}
