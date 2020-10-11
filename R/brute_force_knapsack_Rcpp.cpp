#include <Rcpp.h> 
#include <vector>
#include <math.h>
using namespace Rcpp;
using namespace std;


//[[Rcpp::export]]
List brute_force_Rcpp(IntegerVector w, NumericVector v ,int W) {
  int  n=w.length();
  NumericVector result(0);
  int range = pow(2, n);
  int total_value = 0;
  for (int i = 0; i < range;++ i) {
    NumericVector subs(0);
    int mask = i;
    int total_weights = 0;
    int result_value = 0;
    int count;
    for(int count=0;count<n;++count){
      if(mask&1){
        total_weights += w[count];
        result_value += v[count];
        subs.push_back(count+1);
      }
      if(total_weights>W){
        break;
      }
      mask = mask >> 1;
      if( result_value > total_value && total_weights <= W){
        total_value=result_value;
        result=subs;
      }
    }
  }

  return List::create(_["value"]=total_value,_["elements"] = result);
}
