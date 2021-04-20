static String[] HOUSE={
	"......#......",
	".....###.....",
	"....##.##....",
	"...##...##...",
	"..##.....##..",
	".###########.",
	".#.###.###.#.",
	".#.###.###.#.",
	".#.........#.",
	".#.###..####.",
	".#.###..#.##.",
	".#......#.##.",
	".###########."
};



ArrayList<Cannon> cl;
ArrayList<Particle> pl;
int tm;



void setup(){
	fullScreen(P2D);
	frameRate(60);
	rectMode(CENTER);
	cl=new ArrayList<Cannon>();
	pl=new ArrayList<Particle>();
	JSONArray json=loadJSONArray("data-001.json");
	for (int i=0;i<json.size();i++){
		cl.add(new Cannon(json.getJSONObject(i)));
	}
	tm=0;
}



void draw(){
	background(0);
	for (Cannon c:cl){
		c.update(tm);
		c.draw();
	}
	for (int i=pl.size()-1;i>=0;i--){
		pl.get(i).update();
		pl.get(i).draw();
		if (pl.get(i).end==true){
			pl.remove(i);
		}
	}
	noStroke();
	fill(255);
	text(tm,width/2,30);
	if (pl.size()==0){
		boolean st=true;
		for (Cannon c:cl){
			if (c.fl.size()>0){
				st=false;
				break;
			}
		}
		if (st==true){
			noLoop();
			exit();
		}
	}
	tm+=1000/60;
}
