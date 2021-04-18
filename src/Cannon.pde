class Cannon{
	PVector pos;
	ArrayList<Firework> fl;


	Cannon(JSONObject json){
		this.fl=new ArrayList<Firework>();
		this.pos=new PVector(json.getJSONObject("pos").getInt("x"),json.getJSONObject("pos").getInt("y"));
		JSONArray arr=json.getJSONArray("fireworks");
		for (int i=0;i<arr.size();i++){
			JSONObject fw=arr.getJSONObject(i);
			Firework nf=new Firework(this.pos.copy(),new PVector(fw.getJSONObject("vel").getFloat("x"),fw.getJSONObject("vel").getFloat("y")),fw.getInt("type"),color(fw.getJSONObject("color").getInt("r"),fw.getJSONObject("color").getInt("g"),fw.getJSONObject("color").getInt("b")),fw.getFloat("wait"));
			this.fl.add(nf);
		}
	}



	void update(float tm){
		for (int i=this.fl.size()-1;i>=0;i--){
			if (this.fl.get(i).st==false&&this.fl.get(i).tm<=tm){
				this.fl.get(i).st=true;
			}
			this.fl.get(i).update();
			if (this.fl.get(i).end==true){
				this.fl.remove(i);
			}
		}
	}



	void draw(){
		for (Firework f:this.fl){
			f.draw();
		}
		noStroke();
		rectMode(CORNER);
		fill(52);
		rect(this.pos.x-10,this.pos.y-8,20,6);
		fill(46);
		rect(this.pos.x-6,this.pos.y-2,12,height-this.pos.y+2);
		rectMode(CENTER);
	}
}
