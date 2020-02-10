finding_motif <- function(seqs) {
	s <- seqs[which.max(nchar(seqs))]
	t <- setdiff(seqs, s)
	s_length <- nchar(s)
	t_length <- nchar(t)
	positions <- c()
	for(i in 1:(s_length - t_length)) {
		if(all(strsplit(s, "")[[1]][i:(i + (t_length - 1))] == strsplit(t, "")[[1]])) {
			positions <- c(positions, i)
		}
	}
	return(positions)
}

finding_motif_alt <- function(seqs) {
	s <- seqs[which.max(nchar(seqs))]
	t <- setdiff(seqs, s)
	s_length <- nchar(s)
	t_length <- nchar(t)
	positions <- c()
	for(i in 1:(s_length - t_length)) {
		if(paste0(strsplit(s, "")[[1]][i:(i + (t_length - 1))], collapse = "") == t) {
			positions <- c(positions, i)
		}
	}
	return(positions)
}


