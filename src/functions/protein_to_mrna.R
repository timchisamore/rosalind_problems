protein_to_mrna <- function(p) {
	codons_to_amino_acids <- readr::read_csv(here::here("data",
																											"amino_acids.csv"),
																					 col_types = readr::cols(
																					 	codon = readr::col_character(),
																					 	amino_acid = readr::col_character()
																					 ))
	codons_freq_table <- table(codons_to_amino_acids$amino_acid)
	protein_freq_table <- table(strsplit(p, "")[[1]])
	codons_data <- data.frame(codon = dimnames(codons_freq_table)[[1]],
														number_of_amino_acids_per_codon = as.integer(codons_freq_table))
	protein_data <- data.frame(codon = dimnames(protein_freq_table)[[1]],
														 number_of_amino_acids_per_protein = as.integer(protein_freq_table))
	combined_data <- merge(codons_data,
												 protein_data,
												 by = "codon")
	return(as.integer(gmp::mod.bigz(gmp::prod.bigz(gmp::pow.bigz(combined_data$number_of_amino_acids_per_codon,
															 combined_data$number_of_amino_acids_per_protein)) *
		3, 1000000)))
}
