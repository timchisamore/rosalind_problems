reverse_complement <- function(s) {
	complement <- chartr("ATCG", "TAGC", s)
	return(paste0(rev(strsplit(complement, "")[[1]]), collapse = ""))
}
