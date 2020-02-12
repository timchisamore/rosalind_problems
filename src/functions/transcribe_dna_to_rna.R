#' Transcribing DNA to RNA
#' 
#' Given a DNA sequence, this function returns the corresponding RNA
#' sequence without reverse complementation
#'
#' @param t A character representing a DNA sequence
#'
#' @return A character
#' @export
#'
#' @examples
#' transcribe_dna_to_rna("ACGT")
#' transcribe_dna_to_rna("ACTGTAACGGGA")
transcribe_dna_to_rna <- function(t) {
	return(gsub("T", "U", t))
}