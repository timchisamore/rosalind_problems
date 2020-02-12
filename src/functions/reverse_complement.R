#' The Reverse Complement of DNA
#' 
#' Given a sequence of DNA, the reverse complement will be returned
#'
#' @param s A character of DNA
#'
#' @return A character
#' @export
#'
#' @examples
#' reverse_complement("CGACTGAAGGATATCGCATGACTCCTT")
#' reverse_complement("ATGGTGCCCAACACG")
reverse_complement <- function(s) {
	complement <- chartr("ATCG", "TAGC", s)
	return(paste0(rev(strsplit(complement, "")[[1]]), collapse = ""))
}
