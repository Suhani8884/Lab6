#'Brute Force Search
#'
#' @param x A Data frame (knapsack)
#' @param w An integer(Capacity)
#' 
#' @export


set.seed(42)
n <- 2000
knapsack_objects <-
  data.frame(
    w=sample(1:4000, size = n, replace = TRUE),
    v=runif(n = n, 0, 10000)
  )

brute_force_knapsack= function(x,W){
  n=length(x$w)
  w=x$w
  v=x$v
  result_elements=c()
  result_value=0
  range=1:2^(n-1)
  for(j in range){
    element=which(intToBits(j)==01)
    total_weights=sum(w[element])
    total_value=sum(v[element])
    if(total_value > result_value && total_weights <= W){
      result_elements=element
      result_value=total_value
    }
  }
  result=list(round(result_value),result_elements) 
  return (result)
}
