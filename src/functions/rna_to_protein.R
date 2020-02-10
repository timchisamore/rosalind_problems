rna_to_protein <- function(s) {
	s_length <- nchar(s)
	codons_to_amino_acids <- readr::read_csv(here::here("data",
																											"amino_acids.csv"),
																					 col_types = readr::cols(
																					 	codon = readr::col_character(),
																					 	amino_acid = readr::col_character()
																					 )
	)
	if(grepl("T", s)) {
		simpleError("This sequence is not RNA!")
	}
	else {
		if(s_length %% 3) {
			simpleError("This sequence is not a multiple of 3!")
		}
		else {
			rna_threes <- substring(s, seq(1, s_length, 3),
															seq(3, s_length, 3))
			codon_data <- data.frame(id = seq(1, length(rna_threes), 1),
															 codon = rna_threes)
			codon_amino_acid_data <- merge(codon_data,
																		 codons_to_amino_acids)
			codon_amino_acid_data <- codon_amino_acid_data[order(codon_amino_acid_data$id), ]
			protein <- paste0(na.omit(codon_amino_acid_data$amino_acid),
												collapse = "")
		return(protein)
		}
	}
}
