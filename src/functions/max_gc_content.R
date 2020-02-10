max_gc_content <- function(fasta) {
	gc_content <- lapply(fasta$sequence,
														 gc_content)
	max_gc_id <- fasta$id[which.max(gc_content)]
	max_gc <- gc_content[which.max(gc_content)]
	print(max_gc_id)
	print(max_gc)
}