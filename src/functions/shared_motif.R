shared_motif <- function(fasta) {
	source(here::here("src",
										"functions",
										"read_fasta.R"))
	fasta_data <- read_fasta(fasta)
	maximum_motif_length <- min(nchar(fasta_data$sequence))
	maximum_motif_sequence <- fasta_data$sequence[which(nchar(fasta_data$sequence) == maximum_motif_length)][1]
	motifs <- c()
	for(i in 1:maximum_motif_length) {
		for(j in i:maximum_motif_length) {
			if(all(grepl(substr(maximum_motif_sequence, i, j),
							 setdiff(fasta_data$sequence, maximum_motif_sequence)))) {
				motifs <- c(motifs, substr(maximum_motif_sequence, i, j))
			}
			else {
				break()
			}
		}
	}
	return(motifs[which(nchar(motifs) == max(nchar(motifs)))])
}