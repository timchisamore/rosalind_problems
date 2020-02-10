read_fasta <- function(file) {
	lines <- readr::read_lines(file) # reading FASTA file in by line
	id_labels <- sub(">",
									 "",
									 lines[grepl(">",
									 						lines)]) # using the lines
	# beginning with > as labels and removing the >
	id_positions <- c(which(grepl(">",
																lines)),
										length(lines) + 1) # using the
	# positions of lines begining with > as well as the nth + 1 spot
	# which will allow the for loop below to run through all DNA sequences
	sequences <- list() # empty list to hold our sequences
	dna <- list() # empty list to hold our DNA
	for(i in 1:(length(id_positions) - 1)) { # we have an additional id_position
		# due to adding the nth + 1 position above
			sequences[[i]] <- seq(id_positions[i] + 1,
														id_positions[i + 1] - 1) # creating a sequence
			# running from one value past our label position to one value behind
			# the next label position
			dna[[i]] <- paste0(lines[sequences[[i]]],
												 collapse = "") # pulling the bases out of
			# the lines corresponding to these above sequences and
			# collapsing them into a long string
		}
	return(data.frame(id = id_labels,
										sequence = unlist(dna),
										stringsAsFactors = FALSE)) # returning a data.frame
	# with our labels and sequences
}
