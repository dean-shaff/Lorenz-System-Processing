//ArrayList<float[]> sol = new ArrayList<float[]>(); 
ArrayList<PVector> sol_vec = new ArrayList<PVector>() ; 

HelperFunctions help = new HelperFunctions() ; 

PVector y;
PVector ym1 ;
float sigma = 10.;
float rho = 28.;
float beta = 8./3. ;
float h = 0.005;
float factor = 0.13 ;
int upto = 2000 ;
int tranX; 
int tranY; 
boolean pause = false ; 
boolean rotate = true ; 
//float angle = PI/4.;

void setup(){
  
 size(1000,600,P3D);
 colorMode(HSB,100);
 tranX = width/2;
 tranY = height/2 ; 
 y = new PVector(0.1,0.1,0);
 ym1 = new PVector(0,0,0);
 for (int i=0; i < 3; i ++){
   y  = RungeKuttaStep(h,y) ; 
   PVector y_temp = new PVector(y.x,y.y,y.z) ; 
   sol_vec.add(y_temp) ; 
 }
 
 println(sol_vec.get(sol_vec.size() - 1)) ;
 println(sol_vec.get(sol_vec.size() - 2)) ;
 background(255);

}

void draw(){
  
 if (! pause){ 
   //PVector y ; 
   ym1 = sol_vec.get(sol_vec.size() -1) ;
   //y = sol_vec.get(sol_vec.size() -1 ) ;
   y = RungeKuttaStep(h,y);
   //y = forwardEuler(h,y);
   PVector y_temp = new PVector(y.x, y.y, y.z) ; 
   sol_vec.add(y_temp) ;
   //sol.add(yf) ; 
   if (sol_vec.size() > upto) { 
    sol_vec.remove(0) ;   
   }
   
   //strokeWeight(2);
   //colorMode(HSB,100);
   //pushMatrix();
   //translate(width/2, height/2) ;
   //float c_z = map(y.z,-20,40, 30,60);
   //stroke(c_z,100,100);
   //strokeWeight(2);
   if (rotate){
       background(0,0,100);
       pushMatrix();
       translate(tranX, tranY) ; 

       strokeWeight(2);
       for (int i = 1; i < sol_vec.size() ; i++){
         float angleX = map(mouseY, 0, width, 0,2*PI);
         float angleY = map(mouseX, 0, height,0,2*PI);
         PVector temp = sol_vec.get(i) ;
         PVector tempm1 = sol_vec.get(i-1); 
         PVector temp1 = help.rotateY(help.rotateX(temp,angleX),angleY);
         PVector tempm11 = help.rotateY(help.rotateX(tempm1,angleX),angleY);
         //sol_vec.set(i, temp1);
         
         float c_z = map(temp1.z,-20,40, 60,90);
       
         stroke(c_z,100,100);
         line(temp1.x/factor, temp1.y/factor, temp1.z/factor,
               tempm11.x/factor, tempm11.y/factor, tempm11.z/factor); 
       }
       popMatrix() ;
     
   }
   //line(ym1.x/factor, ym1.y/factor,y.x/factor,y.y/factor);
  //point(y.x/factor,y.y/factor,y.z/factor);
   //line(ym1.x/factor,ym1.y/factor,ym1.z/factor, y.x/factor, y.y/factor, y.z/factor);
   //popMatrix();
 }
 //if (pause && rotate){
 //  //colorMode(RGB,255);
 //  background(0,0,100);
 //  pushMatrix();
 //  translate(width/2, height/2) ; 
 //  float c_z = map(y.z,-20,40, 30,60);
 //  colorMode(HSB,100);
 //  stroke(c_z,100,100);
 //  strokeWeight(2);
 //  for (int i = 1; i < sol_vec.size() ; i++){
 //    float angleX = map(mouseX, 0, width, 0,2*PI);
 //    float angleY = map(mouseY, 0, height,0,2*PI);
 //    PVector temp = sol_vec.get(i) ;
 //    PVector tempm1 = sol_vec.get(i-1); 
 //    PVector temp1 = help.rotateY(help.rotateX(temp,angleX),angleY);
 //    PVector tempm11 = help.rotateY(help.rotateX(tempm1,angleX),angleY);
 //    //sol_vec.set(i, temp1);
 //    line(temp1.x/factor, temp1.y/factor, temp1.z/factor,
 //          tempm11.x/factor, tempm11.y/factor, tempm11.z/factor); 
 //  }
 //  popMatrix() ;
   
 //}
 
}

PVector f(PVector y_n){
  PVector f = new PVector(0.0,0.0,0.0);
  f.x = sigma*(y_n.y - y_n.x) ;
  f.y = y_n.x*(rho - y_n.z) - y_n.y;
  f.z = y_n.x*y_n.y - beta*y_n.z ;
  return f ;
}

PVector forwardEuler(float h, PVector y_n){
  return y_n.add(f(y_n).mult(h));
}

PVector RungeKuttaStep(float h, PVector y_n){
  PVector k1 = f(y_n);
  PVector k2 = f(y_n.add(k1.mult(h/2)));
  PVector k3 = f(y_n.add(k2.mult(h/2)));
  PVector k4 = f(y_n.add(k3.mult(h)));
  PVector y_np1 = y_n.add((k1.add((k2.mult(2))).add((k3.mult(2))).add(k4)).mult(h/6));
  return y_np1 ;
}

void keyPressed(){ 
  if (key == 'p'){
    pause = true; 
  }
  else if (key == 's') {
   pause = false ;  
  }
  else if (key == 'r') {
   rotate = true ;  
    
  }
  else if (key == 'e'){
   rotate = false ;  
    
  }
  else if (key == CODED){
    if (keyCode == UP){
      tranY -= 5 ; 
    }
    else if (keyCode == DOWN){
      tranY += 5; 
    }
    else if (keyCode == RIGHT){
      tranX += 5; 
    }
    else if (keyCode == LEFT){
      tranX -= 5;   
    }
  }
    
}