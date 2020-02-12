#' Maximum GC Content
#' 
#' Given DNA sequences in FASTA format, this function will return the
#' ID of the sequence with the greatest GC content, as well as the
#' percentage of GC in this sequence.
#'
#' @param fasta A file of DNA sequences in FASTA format
#'
#' @return 
#' @export
#'
#' @examples
#' max_gc_content(fasta_file)
max_gc_content <- function(fasta) {
	gc_content <- lapply(fasta$sequence,
														 gc_content)
	max_gc_id <- fasta$id[which.max(gc_content)]
	max_gc <- gc_content[which.max(gc_content)]
	print(max_gc_id)
	print(max_gc)
}