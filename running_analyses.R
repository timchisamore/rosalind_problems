# loading functions
functions_to_source <- list.files(here::here("src",
																						 "functions"))

# creating the full directory for these functions
functions_to_source <- here::here("src",
																	"functions",
																	functions_to_source)

# sourcing each function in the list
invisible(lapply(functions_to_source,
			 source))

# Counting DNA Nucleotides
rosalind_dna <- readr::read_lines(here::here("data",
																						 "raw",
																						 "rosalind_dna.txt"))

count_dna_bases(rosalind_dna)

# Transcribing DNA into RNA
rosalind_rna <- readr::read_lines(here::here("data",
																						 "raw",
																						 "rosalind_rna.txt"))
transcribe_dna_to_rna(rosalind_rna)

# Complementing a Strand of DNA
rosalind_revc <- readr::read_lines(here::here("data",
																						 "raw",
																						 "rosalind_revc.txt"))
reverse_complement(rosalind_revc)

# Computing GC Content
rosalind_gc <- read_fasta(here::here("data",
																		 "raw",
																		 "rosalind_gc.txt"))
max_gc_content(rosalind_gc)

# Counting Point Mutations
rosalind_hamm <- readr::read_lines(here::here("data",
																		 "raw",
																		 "rosalind_hamm.txt"))
hamming_distance(rosalind_hamm)

# Finding a Motif in DNA
rosalind_subs <- readr::read_lines(here::here("data",
																							"raw",
																							"rosalind_subs.txt"))
finding_motif(rosalind_subs)

# Translating RNA into Protein
rosalind_prot <- readr::read_lines(here::here("data",
																					"raw",
																					"rosalind_prot.txt"))
rna_to_protein(rosalind_prot)

# Calculating Protein Mass
rosalind_prtm <- readr::read_lines(here::here("data",
																							"raw",
																							"rosalind_prtm.txt"))
protein_mass(rosalind_prtm)

# Finding a Shared Motif
shared_motif(here::here("data",
												"raw",
												"rosalind_lcsm.txt"))

# Inferring mRNA from Protein
rosalind_mrna <- readr::read_lines(here::here("data",
																					"raw",
																					"rosalind_mrna.txt"))
protein_to_mrna(rosalind_mrna)

# Open Reading Frames
proteins_orf(here::here("data",
												"raw",
												"rosalind_orf.txt"))


