#' Permute
#' 
#' This function determines the number of permutations given an integer
#' and the realization of these permutations
#'
#' @param n An integer
#'
#' @return A data.frame of all possible permutations
#' @export
#'
#' @examples
#' permute(3)
#' permute(7)
permute <- function(n) {
	number_of_permutations <- factorial(n)
	permutations <- matrix(unlist(combinat::permn(n)), ncol = n, byrow = TRUE)
	return(data.frame(permutations))
}
