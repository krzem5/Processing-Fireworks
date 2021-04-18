class Particle{
	PVector pos;
	PVector vel;
	PVector acc;
	color c;
	int tm;
	int t_tm;
	boolean end=false;
	int t;



	Particle(PVector pos,PVector vel,PVector acc,color c,int t){
		this.pos=pos;
		this.vel=((t!=4&&t!=5)?vel.add(random(0.4)-0.2,random(0.4)-0.2):vel.add(random(0.08)-0.04,random(0.08)-0.04));
		this.acc=acc;
		this.c=c;
		this.t_tm=int(random(100)+50);
		this.tm=int(this.t_tm+0);
		this.t=t;
		if (this.t==1||this.t==4){
			this.t_tm=int(random(110)+120);
			this.tm=int(this.t_tm+0);
		}
		if (this.t==2){
			this.t_tm=int(random(80)+180);
			this.tm=int(this.t_tm+0);
		}
	}



	void update(){
		this.vel.add(this.acc);
		this.pos.add(this.vel);
		this.tm--;
		if (this.tm<=0){
			this.end=true;
		}
	}



	void draw(){
		noStroke();
		fill(this.c);
		if (this.tm<75){
			if (this.tm%10>4){
				fill(0);
			}
		}
		if (this.tm<40){
			fill(this.c,map(this.tm,0,40,0,100));
		}
		if (this.t==0){
			rect(this.pos.x,this.pos.y,1,1);
		}
		if (this.t==3){
			rect(this.pos.x,this.pos.y,1.25,1.25);
		}
		if (this.t==1||this.t==4||this.t==5){
			rect(this.pos.x,this.pos.y,1.5,1.5);
		}
		if (this.t==2){
			rect(this.pos.x,this.pos.y,2,2);
		}
	}
}
