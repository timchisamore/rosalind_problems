#' Finding the GC Content
#' 
#' This function determinees the proportion (%) of a DNA string that is
#' either G or C.
#'
#' @param s A DNA sequence
#'
#' @return A numeric bounded between 0 and 1
#' @export
#'
#' @examples
#' gc_content("ACTG")
#' gc_content("ACCTGTTGACCAA")
gc_content <- function(s) {
	return(100 * (sum(count_dna_bases(s)[c(2, 3)]) / sum(count_dna_bases(s))))
}
