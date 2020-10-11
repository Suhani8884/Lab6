set.seed(42)
n <- 2000
knapsack_objects <- data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))
x <- knapsack_objects[1:16,]
w <- x$w
v <- x$v
W <- 2000
library(Rcpp)
#

cppFunction('List brute_force_Rcpp(IntegerVector w, NumericVector v ,int W) {
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
}')


library(microbenchmark)

m <- microbenchmark(
  brute_force_knapsack(x ,W ),
  brute_force_Rcpp(w = w,v =v,W)
)
m
