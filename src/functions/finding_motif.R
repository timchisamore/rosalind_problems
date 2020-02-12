#' Finding a Motif
#'
#' Given a character vector of two DNA sequences, this function finds
#' the positions where the smaller of the two strings appears in the
#' larger string
#'
#' @param seqs A character vector of two DNA sequences
#'
#' @return A numeric vector indicating the positions the motif appears
#' @export
#'
#' @examples
#' finding_motif(c("ATGCCATGCCC", "ATG"))
#' finding_motif(c("ACGTAT", "AGGCTAAGCTAGACGTAT"))
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


