permute <- function(n) {
	number_of_permutations <- factorial(n)
	permutations <- matrix(unlist(combinat::permn(n)), ncol = n, byrow = TRUE)
	return(data.frame(permutations))
}
