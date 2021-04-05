#include <Rcpp.h>
using namespace Rcpp;



int Sign(int dxy)
{
  if(dxy<0) return -1; 
  else if(dxy>0) return 1; 
  else return 0;
}

// [[Rcpp::export]]
IntegerVector BresenhamC(int x1, int y1, int x2, int y2)
{
  int Dx = x2 - x1;
  int Dy = y2 - y1;
  
  //# Increments
  int Sx = Sign(Dx); 
  int Sy = Sign(Dy);
  
  //# Segment length
  Dx = abs(Dx); 
  Dy = abs(Dy); 
  
  int D;
  if(Dx>=Dy) D = Dx;
  else D = Dy;
  
  
  //# Initial remainder
  double R = D / 2;
  
  int X = x1;
  int Y = y1;
  
  IntegerVector out(2*(D+1));
  
  if(Dx > Dy) {   
    //# Main loop
    for(int I=0; I<=D; I++) {   
      out[2*I] = X;
      out[2*I+1] = Y;
      
      //# Update (X, Y) and R
      X+= Sx; R+= Dy; //# Lateral move
      if (R >= Dx) {
        Y+= Sy; 
        R-= Dx; //# Diagonal move
      }
    }
  } else {   
    //# Main loop
    for(int I=0; I<=D; I++) {     
      out[2*I] = X;
      out[2*I+1] = Y;
      
      //# Update (X, Y) and R
      Y+= Sy; R+= Dx; //# Lateral move
      if(R >= Dy) {    
        X+= Sx; 
        R-= Dy; //# Diagonal move
      }
    }
  }
  return out;
}

// [[Rcpp::export]]
NumericVector tangentsC(int x1, int y1, double height0, IntegerVector xy2, NumericVector dsm_profile) {
  NumericVector out(dsm_profile.size());
  
  for(int i = 0; i < xy2.size(); ++i) {
    //# Distance traveled so far
    double distance_traveled = sqrt((x1 - xy2[i])*(x1 - xy2[i]) + (y1 - xy2[i+1])*(y1 - xy2[i+1]));
    //# Calculate tangent
    out[i/2] = (dsm_profile[i/2] - height0) / (distance_traveled);
    i+=1;
  }
  return out;
}

// [[Rcpp::export]]
LogicalVector isVisibleC(NumericVector x) {
  int n = x.size();
  LogicalVector out(n);
  out[0] = 1;
  
  double max_tangent = -9999;
  
  for(int i = 1; i < n; ++i) {
    double this_tangent = x[i];
    
    if (this_tangent > max_tangent) {
      max_tangent = this_tangent;
      out[i] = true;
    } else {
      out[i] = false;
    }
  }
  return out;
}