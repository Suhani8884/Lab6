#' Greedy heuristic Search for knapsack problem
#'
#' @param x is a data frame which contains w and v,weights and values
#' @param W is the maximum value for the knapsack
#'
#' @return This function will return a list of selected elements and their total values added to the knapsack
#' @references \url{ https://en.wikipedia.org/wiki/Knapsack_problem#Greedy_approximation_algorithm }
#' @examples 
#' set.seed(42)
#' n <- 2000
#' knapsack_objects <- data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))
#' greedy_knapsack(x = knapsack_objects[1:800,], W = 3500)
#' 
#' @export
#'
greedy_knapsack = function(x,W){
  stopifnot(is.data.frame(x), apply(x, c(1,2), is.numeric), is.numeric(W), W>=0, colnames(x)==c("w","v"))
  sorted=x[order(x$v/x$w,decreasing=TRUE), ]
  n=x$w
  sum=0
  value=0
  elements=c()
  j=1
  while(sum(sum,sorted$w[j]) <= W){
    sum=sum(sum,sorted$w[j])
    value=sum(value,sorted$v[j])
    elements=append(elements,as.numeric(rownames(sorted[j,])))
    j=j+1
  } 
  return(list("value"=value,"elements"=elements))
}
