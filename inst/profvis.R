library(profvis)

set.seed(42)
n <- 2000
knapsack_objects <- data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))

source(paste(getwd(),"R","knapsack.R", sep = "/"))
profvis(brute_force_knapsack(x = knapsack_objects[1:16,], W = 2000))

source(paste(getwd(),"R","Dynamic_knapsack.R", sep = "/"))
profvis(dynamic_knapsack(x = knapsack_objects[1:500,], W = 2000))

source(paste(getwd(),"R","greedy_knapsack.R", sep = "/"))
profvis(greedy_knapsack(x = knapsack_objects[1:1000000,], W = 2000))

# source(paste(getwd(),"R","knapsack.R", sep = "/"))
# tmp <- tempfile()
# Rprof(tmp, interval = 0.01)
# brute_force <- lineprof(brute_force_knapsack(x = knapsack_objects[1:12,], W = 3500))
# Rprof(NULL)
# summaryRprof(tmp)
# 
# source(paste(getwd(),"R","Dynamic_knapsack.R", sep = "/"))
# tmp <- tempfile()
# Rprof(tmp, interval = 0.01)
# dynamic_knapsack(x = knapsack_objects[1:8,], W = 3500)
# Rprof(NULL)
# summaryRprof(tmp)
# 
# source(paste(getwd(),"R","greedy_knapsack.R", sep = "/"))
# tmp <- tempfile()
# Rprof(tmp, interval = 0.01)
# greedy <- lineprof(greedy_knapsack(x = knapsack_objects[1:1500,], W = 3500))
# Rprof(NULL)
# summaryRprof(tmp)
