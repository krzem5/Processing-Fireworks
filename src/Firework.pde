class Firework{
	PVector pos;
	PVector vel;
	PVector acc;
	color c;
	boolean end=false;
	int t;
	PVector[] img;
	boolean st=false;
	float tm;



	Firework(PVector pos,PVector vel,int t,color c,float tm_off){
		this.pos=pos;
		this.vel=vel;
		this.acc=new PVector(0,0.05);
		this.c=c;
		this.t=t;
		this.tm=tm_off;
		if (this.t==4){
			this.img=this._gen_image(HOUSE);
		}
	}



	void update(){
		if (this.st==false){
			return;
		}
		this.pos.add(this.vel);
		this.vel.add(this.acc);
		if (this.vel.y>=0){
			this.explode();
		}
		if (this.t==3){
			for (int i=0;i<10;i++){
				pl.add(new Particle(this.pos.copy(),this.vel.copy().mult(-1).add(random(0.4)-0.2,random(0.4)-0.2),new PVector(0,0.02),this._gen_color(),this.t));
			}
		}
		if (this.t==5){
			for (int i=0;i<3;i++){
				pl.add(new Particle(this.pos.copy(),new PVector(0,0),new PVector(0,0.02),color(220),this.t));
			}
		}
	}



	void draw(){
		if (this.st==false){
			return;
		}
		noStroke();
		fill(this.c);
		if (this.t==0){
			rect(this.pos.x,this.pos.y,1,1);
		}
		if (this.t==1||this.t==4){
			rect(this.pos.x,this.pos.y,2,2);
		}
		if (this.t==2){
			rect(this.pos.x,this.pos.y,3,3);
		}
		if (this.t==5){
			rect(this.pos.x,this.pos.y,6,6);
		}
	}



	void explode(){
		this.end=true;
		if (this.t==3){
			for (float a=0;a<PI*2;a+=PI*2/30){
				pl.add(new Particle(this.pos.copy(),new PVector(cos(a)*0.4,sin(a)*0.4).add(random(0.4)-0.2,random(0.4)-0.2),new PVector(0,0.02),this._gen_color(),this.t));
			}
			return;
		}
		if (this.t==4){
			for (PVector p : this.img){
				if (p!=null){
					pl.add(new Particle(this.pos.copy(),p,new PVector(0,0.02),this.c,this.t));
					pl.add(new Particle(this.pos.copy(),p,new PVector(0,0.02),this.c,this.t));
					pl.add(new Particle(this.pos.copy(),p,new PVector(0,0.02),this.c,this.t));
				}
			}
			return;
		}
		if (this.t==5){
			for (float a=0;a<PI*2;a+=PI*2/40){
				pl.add(new Particle(this.pos.copy(),new PVector(cos(a)*0.4,sin(a)*0.4).add(random(0.4)-0.2,random(0.4)-0.2),new PVector(0,0.02),this.c,this.t));
			}
			return;
		}
		for (float a=0;a<PI*2;a+=PI*2/50){
			if (this.t==0){
				pl.add(new Particle(this.pos.copy(),new PVector(cos(a)*0.75,sin(a)*0.75),new PVector(0,0.02),this.c,this.t));
				pl.add(new Particle(this.pos.copy(),new PVector(cos(a)*0.75,sin(a)*0.75),new PVector(0,0.02),this.c,this.t));
			}
			if (this.t==1){
				a-=PI*2/50/2;
				pl.add(new Particle(this.pos.copy(),new PVector(cos(a)*1.25,sin(a)*1.25),new PVector(0,0.02),this.c,this.t));
				pl.add(new Particle(this.pos.copy(),new PVector(cos(a)*1,sin(a)*1),new PVector(0,0.02),this.c,this.t));
				pl.add(new Particle(this.pos.copy(),new PVector(cos(a)*1.25,sin(a)*1.25),new PVector(0,0.02),this.c,this.t));
				pl.add(new Particle(this.pos.copy(),new PVector(cos(a)*1,sin(a)*1),new PVector(0,0.02),this.c,this.t));
			}
			if (this.t==2){
				a-=PI*2/50/4;
				pl.add(new Particle(this.pos.copy(),new PVector(cos(a)*2.8,sin(a)*2.8),new PVector(0,0.02),this.c,this.t));
				pl.add(new Particle(this.pos.copy(),new PVector(cos(a)*2.3,sin(a)*2.3),new PVector(0,0.02),this.c,this.t));
				pl.add(new Particle(this.pos.copy(),new PVector(cos(a)*1.8,sin(a)*1.8),new PVector(0,0.02),this.c,this.t));
				pl.add(new Particle(this.pos.copy(),new PVector(cos(a)*2.8,sin(a)*2.8),new PVector(0,0.02),this.c,this.t));
				pl.add(new Particle(this.pos.copy(),new PVector(cos(a)*2.3,sin(a)*2.3),new PVector(0,0.02),this.c,this.t));
				pl.add(new Particle(this.pos.copy(),new PVector(cos(a)*1.8,sin(a)*1.8),new PVector(0,0.02),this.c,this.t));
			}
		}
	}



	private color _gen_color(){
		int c=int(random(10));
		if (c<6){
			return color(230,230,0);
		}
		if (c<8){
			return color(230,120,0);
		}
		return color(230,0,0);
	}



	private PVector[] _gen_image(String[] in){
		PVector[] out=new PVector[in.length*in[0].length()];
		int y=0;
		for (String l : in){
			for (int x=0;x<l.length();x++){
				if (str(l.charAt(x)).equals("#")){
					out[x+y*l.length()]=new PVector(x-l.length()/2,y-in.length/2).mult(0.3);
				}
			}
			y++;
		}
		return out;
	}
}
