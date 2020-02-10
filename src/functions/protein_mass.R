protein_mass <- function(p) {
	monoisotopic_mass <- readr::read_csv(here::here("data", "monoisotopic_mass.csv"),
																			 col_types = readr::cols(
																			 	amino_acid = readr::col_character(),
																			 	monoisotopic_mass = readr::col_double()
																			 	)
	)
	freq_table <- table(strsplit(p, ""))
	amino_acids <- data.frame(amino_acid = as.character(dimnames(freq_table)[[1]]),
														freq = as.integer(freq_table))
	combined <- merge(amino_acids,
										monoisotopic_mass,
										by = "amino_acid")
	return(format(sum(combined$freq * combined$monoisotopic_mass), nsmall = 5))
}

