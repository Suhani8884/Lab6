v <- c(10,7,4)
w <- c(4,2,3)
W <- 5
knapsack_objects <- data.frame(w,v)
## perform bench mark
m <- bench::mark(
  brute_forceR =brute_force_knapsack(x = knapsack_objects,W = 5) ,
  brute_forceRccp = brute_force_Rcpp(w = w,v =v,W = 5),
  relative = TRUE,
  min_iterations = 100
)

## print results
m