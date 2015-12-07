
////ArrayList<float[]> solution = new ArrayList<float[]>();

//HelperFunctions help = new HelperFunctions();

//float[] y = new float[3];
//float[] ym1 = new float[3]; 

//Slider[] sliders = new Slider[3];
//float[] angles = {0,0,0};
//float sigma = 10.;
//float rho = 28.;  
//float beta = 8./3. ; 
//float h = 0.005;
//float factor = .1 ; 
//int sol_max = 1000 ; 
//int rate = 1 ;

//boolean pause = true ; 

//void setup(){
// size(1000,600,P3D);
// float[] y_init = {-0.1,-0.1,0.0} ; 
// for (int i=0; i < y.length; i++){
//   y[i] = y_init[i] ; 
//   ym1[i] = y[i] ;  
// } 
 
 
// //solution.add(y);
// //int i = 0;
// //while (i < 3){
// //  //y = forwardEuler(h,y);
// //  y = RungeKuttaStep(h,y);
// //  solution.add(y);
// //  i++; 
// //}
// //for (int j = 0; j < solution.size(); j++){
// // println(solution.get(j)); 
// //}
// sliders[0]= new Slider(20., 20., 0., PI,100., "X");
// sliders[1] = new Slider(20., 60., 0., PI,100., "Y");
// sliders[2] = new Slider(20., 100., 0., PI,100., "Z");
// background(255);
 
//}

//void draw(){
// //y = forwardEuler(h,y);
// //float[] y = new float[3] ;
// //float[] ym1 = new float[3] ;
// if (pause){
  
//     //y = solution.get(solution.size() -1);
//     //ym1.set(ym1f[0],ym1f[1],ym1f[2]) ;
//   //ym1[0] = y[0]; ym1[1] = y[1]; ym1[2] = ym1[2] ; 
//   for (int i=0; i < y.length; i++){
//     ym1[i] = y[i] ; 
//   } 
//   y = RungeKuttaStep(h,y);
//     //y = forwardEuler(h,ym1);

//   //solution.add(y);
//   strokeWeight(2);
//   colorMode(HSB,100);
//   pushMatrix();
//   translate(width/2, height/2) ;
//   float c_z = map(y[2],-20,40, 30,60);
//   stroke(c_z,100,100);
//   strokeWeight(2);
//   //line(ym1.x/factor, ym1.y/factor,y.x/factor,y.y/factor);
//   //point(y[0]/factor,y[1]/factor,y[2]/factor);
//   //line((float)ym1[0]/factor,(float)ym1[1]/factor,(float)ym1[2]/factor, 
//         //(float)y[0]/factor, (float)y[1]/factor, (float)y[2]/factor);
//   line(ym1[0]/factor,ym1[1]/factor,ym1[2]/factor, 
//         y[0]/factor, y[1]/factor, y[2]/factor);
//   popMatrix();
// }
//}

//float[] f(float[] y_n){
//  float[] f = new float[y_n.length];
//  f[0] = sigma*(y_n[1] - y_n[0]) ;
//  f[1] = y_n[0]*(rho - y_n[2]) - y_n[1];
//  f[2] = y_n[0]*y_n[1] - beta*y_n[2] ; 
//  return f ; 
//}

//float[] forwardEuler(float h, float[] y_n){
//  return help.add_array(help.mult_array(f(y_n),h),y_n);
//}

//float[] RungeKuttaStep(float h, float[] y_n){
  
//  float[] k1 = f(y_n);
//  float[] k2 = f(help.add_array(y_n, help.mult_array(k1,h/2.)));            //f(y_n.add(k1.mult(h/2))); 
//  float[] k3 = f(help.add_array(y_n, help.mult_array(k2,h/2.))); //    f(y_n.add(k2.mult(h/2))); 
//  float[] k4 = f(help.add_array(y_n, help.mult_array(k3,h)));   //f(y_n.add(k3.mult(h))); 
//  //float[] y_np1 = help.add(y_n, help.mult(help.add4(k1, help.mult(k2,2), help.mult(k3,2), k4), h/6.));//y_n.add((k1.add((k2.mult(2))).add((k3.mult(2))).add(k4)).mult(h/6)); 
//  float[] y_np1 = new float[y_n.length]; 
//  for (int i=0; i < y.length; i++){
//     y_np1[i] = y_n[i] + h/6*(k1[i] + 2*k2[i] + 2*k3[i] + k4[i]) ; 
//  }
  
//  return y_np1 ; 
//}

////void mouseDragged(){
  
//// for (int i=0; i<sliders.length;i++){
////   if (sliders[i].checkMouse()){
////     sliders[i].setX(mouseX);     
////   }
////   //sliders[i].render();   
//// }
////}

//void keyPressed(){
//  if (key == 'p'){
//    pause = false ;  
//  }
//  else if (key == 's'){
//   pause = true ;  
//  }
  
//}