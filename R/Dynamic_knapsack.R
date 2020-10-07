#' Dynamic programming for knapsack problem
#'
#' @param x is a data frame which contains w and v,weights and values
#' @param W is the maximum value for the knapsack
#'
#' @return This function will return a list of selected elements and their total values added to the knapsack
#' @references \url{ https://en.wikipedia.org/wiki/Knapsack_problem#0.2F1_knapsack_problem }
#' @examples 
#' set.seed(42)
#' n <- 2000
#' knapsack_objects <- data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))
#' dynamic_knapsack(x = knapsack_objects[1:8,], W = 3500)
#' @export
#'

dynamic_knapsack = function(x,W)
{
  stopifnot(is.data.frame(x), apply(x, c(1,2), is.numeric), is.numeric(W), W>=0, colnames(x)==c("w","v"))
  v = x$v
  w = x$w
  m = matrix(0, nrow = nrow(x)+1, ncol = W+1)
  for (i in 2:nrow(x)) {
    for (j in 2:W+1) {
      if(w[i] > j){
        m[i, j] = m[i-1, j]
      }
      else{
        m[i, j] = max(m[i-1, j], (m[i-1,(j-w[i])] + v[i]))
      }
    }
  }
  row = nrow(x)+1
  col = W+1
  elements = c()
  while (row>1) {
    if(m[row,col] > m[row-1,col]){
      elements = c(elements, row)
      col = col - w[row]
      row = row-1
    }
    else{
      row = row-1
    }
  }
  list_data = list(value = round(max(m)), elements = sort(elements))
  return(list_data)
}
