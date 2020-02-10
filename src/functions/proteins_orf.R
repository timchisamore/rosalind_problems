proteins_orf <- function(fasta) {
	source(here::here("src",
										"functions",
										"read_fasta.R"))
	source(here::here("src",
										"functions",
										"transcribe_dna_to_rna.R"))
	source(here::here("src",
										"functions",
										"rna_to_protein.R"))
	source(here::here("src",
										"functions",
										"reverse_complement.R"))
	fasta_data <- read_fasta(fasta)
	s_dna <- fasta_data$sequence
	s_dna_reverse_complement <- reverse_complement(s_dna)
	s_rna <- transcribe_dna_to_rna(s_dna)
	s_rna_reverse_complement <- transcribe_dna_to_rna(s_dna_reverse_complement)
	
	s_rna_regex_extract <- gregexpr("(?=AUG((?:[ACGU]{3})*?)U(?:AG|AA|GA))",
														s_rna,
														perl = TRUE)
	s_rna_capture_start <- attr(s_rna_regex_extract[[1]],
												"capture.start")
	s_rna_capture_length <- attr(s_rna_regex_extract[[1]],
												 "capture.length")
	s_rna_reverse_complement_regex_extract <- gregexpr("(?=AUG((?:[ACGU]{3})*?)U(?:AG|AA|GA))",
																										 s_rna_reverse_complement,
																										 perl = TRUE)
	s_rna_reverse_complement_capture_start <- attr(s_rna_reverse_complement_regex_extract[[1]],
																								 "capture.start")
	s_rna_reverse_complement_capture_length <- attr(s_rna_reverse_complement_regex_extract[[1]],
																								 "capture.length")
	
	orfs <- paste0("AUG",
								 substring(s_rna,
								 					s_rna_capture_start,
								 					s_rna_capture_start + s_rna_capture_length - 1))
	orfs <- c(orfs,
						paste0("AUG",
									 substring(s_rna_reverse_complement,
									 					s_rna_reverse_complement_capture_start,
									 					s_rna_reverse_complement_capture_start + s_rna_reverse_complement_capture_length - 1)))
	proteins <- unique(unlist(lapply(orfs, rna_to_protein)))
	return(proteins)
}
