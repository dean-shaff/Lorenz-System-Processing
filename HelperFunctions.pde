import java.lang.Math ; 

public class HelperFunctions {
    
    public HelperFunctions () {
        
    }
    double[] add_array(double[] array1, double[] array2){
      double[] final_array = new double[array1.length] ;
       if (array1.length != array2.length){
         println("Error: arrays not of equal length");
         return final_array;
       }
       for (int j=0; j < array1.length ; j++){
          final_array[j] = array1[j] + array2[j]; 
       }
       return final_array;
    }
    double[] add4(double[] array1, double[] array2, double[] array3, double[] array4){
      double[] final_array = new double[array1.length] ;
       if (array1.length != array2.length){
         println("Error: arrays not of equal length");
         return final_array;
       }
       for (int j=0; j < array1.length ; j++){
          final_array[j] = array1[j] + array2[j] + array3[j] + array4[j]; 
       }
       return final_array;
    }
    float[] add_array(float[] array1, float[] array2){
      float[] final_array = new float[array1.length] ;
       if (array1.length != array2.length){
         println("Error: arrays not of equal length");
         return final_array;
       }
       for (int j=0; j < array1.length ; j++){
          final_array[j] = array1[j] + array2[j]; 
       }
       return final_array;
    }
    double[] mult_array(double[] array, double factor){
      for (int i=0; i < array.length; i++){
         array[i] = factor*array[i]; 
      }
      return array;
    }
    
    float[] mult_array(float[] array, float factor){
      for (int i=0; i < array.length; i++){
         array[i] = factor*array[i]; 
      }
      return array;
    }
    
    double[] rotateX(double[] array, double angle){
      double[] fin = new double[array.length] ; 
      double x = array[0]; double y = array[1]; double z = array[2] ; 
      fin[0] = x ; 
      fin[1] = Math.cos(angle)*y + Math.sin(angle)*z ; 
      fin[2] = -Math.sin(angle)*y + Math.cos(angle)*z ; 
      return fin ;
    }
    
    double[] rotateY(double[] array, double angle){
      double[] fin = new double[array.length] ; 
      double x = array[0]; double y = array[1]; double z = array[2] ; 
      fin[0] = Math.cos(angle)*x - Math.sin(angle)*z ; 
      fin[1] = y ; 
      fin[2] = Math.sin(angle)*x + Math.cos(angle)*z ; 
      return fin ;
    }
    
    double[] rotateZ(double[] array, double angle){
      double[] fin = new double[array.length] ; 
      double x = array[0]; double y = array[1]; double z = array[2] ; 
      fin[0] = Math.cos(angle)*x + Math.sin(angle)*y  ; 
      fin[1] = Math.cos(angle)*y - Math.sin(angle)*x ; 
      fin[2] = y ; 
      return fin ;
    }
    
    
    PVector rotateX(PVector array, float angle){
      PVector fin = new PVector(0.0,0.0,0.0); 
      float x = array.x; float y = array.y; float z = array.z ; 
      fin.x = x ; 
      fin.y = cos(angle)*y + sin(angle)*z ; 
      fin.z = -sin(angle)*y + cos(angle)*z ; 
      return fin ;
    }
    
    PVector rotateY(PVector array, float angle){
      PVector fin = new PVector(0.0,0.0,0.0); 
      float x = array.x; float y = array.y; float z = array.z ;  
      fin.x = cos(angle)*x - sin(angle)*z ; 
      fin.y = y ; 
      fin.z = sin(angle)*x + cos(angle)*z ; 
      return fin ;
    }
    
    PVector rotateZ(PVector array, float angle){
      PVector fin = new PVector(0.0,0.0,0.0); 
      float x = array.x; float y = array.y; float z = array.z ; 
      fin.x = cos(angle)*x + sin(angle)*y  ; 
      fin.y = cos(angle)*y - sin(angle)*x ; 
      fin.z = y ; 
      return fin ;
    }
    
    
    
    
    
    
    
    
    
    
    
    
}