ArrayList<Cannon> cannons;
ArrayList<Particle> particles;
int time;
void setup() {
  fullScreen(P2D);
  cannons=new ArrayList<Cannon>();
  particles=new ArrayList<Particle>();
  load_cannons(loadJSONArray("data-001.json"));
  frameRate(60);
  rectMode(CENTER);
  time=0;
}
void draw() {
  background(0);
  for (Cannon c : cannons) {
    c.update();
    c.draw();
  }
  for (int i=particles.size()-1; i>=0; i--) {
    particles.get(i).update();
    particles.get(i).draw();
    if (particles.get(i).done==true) {
      particles.remove(i);
    }
  }
  noStroke();
  fill(255);
  text(time, width/2, 30);
  if (particles.size()==0) {
    boolean st=true;
    for (Cannon c : cannons) {
      if (c.fireworks.size()>0) {
        st=false;
        break;
      }
    }
    if (st==true) {
      noLoop();
      exit();
    }
  }
  time+=1.0/60*1000;
}
void load_cannons(JSONArray json) {
  for (int i=0; i<json.size(); i++) {
    cannons.add(new Cannon(json.getJSONObject(i)));
  }
}
