#' Count DNA Bases
#' 
#' Given a string of DNA, this function will count how many times each
#' base appears
#'
#' @param s A string of DNA bases (A, C, G, or T)
#'
#' @return A vector of numerics representing the number of times A, C, G,
#' and T appear, respectively.
#' 
#' @export
#'
#' @examples
#' count_dna_bases("ATATC")
#' count_dna_bases("CATG")
count_dna_bases <- function(s) {
	bases <- strsplit(x = s, split = "")[[1]]
	return(as.numeric(table(bases)))
}