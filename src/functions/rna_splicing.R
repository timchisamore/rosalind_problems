#' RNA Splicing
#' 
#' This function reads a FASTA file of DNA sequences in and returns
#' the protein constructed upon removing the introns and keeping only
#' the exons
#'
#' @param fasta A file of DNA in FASTA formatting
#'
#' @return A character
#' @export
#'
#' @examples
#' rna_splicing(fasta_data)
rna_splicing <- function(fasta) {
	source(here::here("src",
				 "functions",
				 "read_fasta.R"))
	source(here::here("src",
										"functions",
										"transcribe_dna_to_rna.R"))
	source(here::here("src",
										"functions",
										"rna_to_protein.R"))
	fasta_data <- read_fasta(fasta)
	s_dna <- fasta_data$sequence[which(nchar(fasta_data$sequence) == max(nchar(fasta_data$sequence)))]
	introns <- setdiff(fasta_data$sequence,
										 s_dna)
	exons <- s_dna
	for(intron in introns) {
		exons <- unlist(strsplit(unlist(exons),
						 intron))
	}
	exons <- paste0(exons,
									collapse = "")
	exons <- transcribe_dna_to_rna(exons)
	return(rna_to_protein(exons))
}