class Cannon {
  PVector pos;
  JSONObject data;
  ArrayList<Firework> fireworks;
  Cannon(JSONObject json) {
    this.from_json_object(json);
  }
  void from_json_object(JSONObject json) {
    this.fireworks=new ArrayList<Firework>();
    this.pos=new PVector(json.getJSONObject("pos").getInt("x"), json.getJSONObject("pos").getInt("y"));
    JSONArray arr=json.getJSONArray("fireworks");
    for (int i=0; i<arr.size(); i++) {
      JSONObject fw=arr.getJSONObject(i);
      Firework nf=new Firework(this.pos.copy(), new PVector(fw.getJSONObject("vel").getFloat("x"), fw.getJSONObject("vel").getFloat("y")), fw.getInt("type"), color(fw.getJSONObject("color").getInt("r"), fw.getJSONObject("color").getInt("g"), fw.getJSONObject("color").getInt("b")), fw.getFloat("wait"));
      this.fireworks.add(nf);
    }
  }
  void update() {
    for (int i=this.fireworks.size()-1; i>=0; i--) {
      if (this.fireworks.get(i).start==false&&this.fireworks.get(i).time<=time) {
        this.fireworks.get(i).start=true;
      }
      this.fireworks.get(i).update();
      if (this.fireworks.get(i).done==true) {
        this.fireworks.remove(i);
      }
    }
  }
  void draw() {
    for (Firework f : this.fireworks) {
      f.draw();
    }
    noStroke();
    rectMode(CORNER);
    fill(52);
    rect(this.pos.x-10, this.pos.y-8, 20, 6);
    fill(46);
    rect(this.pos.x-6, this.pos.y-2, 12, height-this.pos.y+2);
    rectMode(CENTER);
  }
}
