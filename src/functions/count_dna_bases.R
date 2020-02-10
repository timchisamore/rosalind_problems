count_dna_bases <- function(s) {
	bases <- strsplit(x = s, split = "")[[1]]
	return(as.numeric(table(bases)))
}