count_dna_bases <- function(s) {
	bases <- strsplit(x = s, split = "")[[1]]
	return(as.numeric(table(bases)))
}

summarize_fasta <- function(data) {
	return(data %>%
		dplyr::as_tibble() %>%
		dplyr::mutate(total_bases = stringr::str_length(sequence),
					 total_a = stringr::str_count(sequence, "A"),
					 total_c = stringr::str_count(sequence, "C"),
					 total_g = stringr::str_count(sequence, "G"),
					 total_t = stringr::str_count(sequence, "T"),
					 percent_gc = round(100 * ((total_c + total_g) / total_bases), 6),
					 percent_at = round(100 - percent_gc, 6)))
}

max_gc_content <- function(data) {
	return(data %>%
		top_n(percent_gc, n = 1)) %>%
		select(id, percent_gc)
}
	
	
	
	
	
	
	