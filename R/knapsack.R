#' Brute Force Search for knapsack problem
#'
#' @param x is a data frame which contains w and v,weights and values
#' @param W is the maximum value for the knapsack
#'
#' @return This function will return a list of selected elements and their total values added to the knapsack
#' @references \url{ https://en.wikipedia.org/wiki/Knapsack_problem }
#' @examples 
#' set.seed(42)
#' n <- 2000
#' knapsack_objects <- data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))
#' brute_force_knapsack(x = knapsack_objects[1:8,], W = 3500)
#' @export
#'

brute_force_knapsack= function(x,W){
  stopifnot(is.data.frame(x), apply(x, c(1,2), is.numeric), is.numeric(W), W>=0, colnames(x)==c("w","v"))
  n=length(x$w)
  w=x$w
  v=x$v
  result_elements=c()
  result_value=0
  range=1:2^(n) - 1
  for(j in range){
    element=which(intToBits(j)==01)
    total_weights=sum(w[element])
    total_value=sum(v[element])
    if(total_value > result_value && total_weights <= W){
      result_elements=element
      result_value=total_value
    }
  }
  result=list("value"=(result_value),"elements"=result_elements) 
  print(lengths(result))
  return (result)
}

