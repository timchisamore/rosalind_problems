gc_content <- function(s) {
	return(100 * (sum(count_dna_bases(s)[c(2, 3)]) / sum(count_dna_bases(s))))
}
