#' Tha Hamming Distance
#' 
#' Given DNA sequences of equal length, this function will return how
#' many base pairs differ
#'
#' @param seqs A character vector of DNA sequences of equal length
#'
#' @return An integer
#' @export
#'
#' @examples
#' hamming_distance(c("ACTG", "ACCC"))
#' hamming_distance(c("ATCGGGTTA", "AAGGGGTTT"))
hamming_distance <- function(seqs) {
	n <- length(seqs)
	combinations <- combn(n, 2)
	ham_dist <- c()
	for(i in 1:ncol(combinations)){
		s <- seqs[combinations[, i][1]]
		t <- seqs[combinations[, i][2]]
		if(nchar(s) == nchar(t)) {
			ham_dist <- c(ham_dist, sum(strsplit(s, "")[[1]] != strsplit(t, "")[[1]]))
		}
		else {
			warning("You need to provide strings of equal length!")
		}
	}
	return(ham_dist)
}