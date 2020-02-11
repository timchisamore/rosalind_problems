restriction_sites <- function(fasta) {
	source(here::here("src",
										"functions",
										"read_fasta.R"))
	source(here::here("src",
										"functions",
										"reverse_complement.R"))
	fasta_data <- read_fasta(fasta)
	s_dna <- fasta_data$sequence
	s_length <- nchar(s_dna)
	pal_position <- c()
	pal_length <- c()
	for(i in 1:(s_length - 3)) {
		for(j in (i + 3):(i + 11)) {
			if(substring(s_dna, i, j) == reverse_complement(substring(s_dna, i, j))) {
				pal_position <- c(pal_position, i)
				pal_length <- c(pal_length, nchar(substring(s_dna, i, j)))
			}
		}
	}
	pal_data <- unique(data.frame(position = pal_position,
												 length = pal_length))
	return(pal_data)
}
