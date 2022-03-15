A  acgt aaa a a a a n - 
B  acgt cgt a a a c a a 
C  acgt cgt c g t g a a 
D  acgt cgt c g t t a a
fasta phylip nexus

install.packages("ape")
library(ape)
?ape

?rtree
getwd

setwd("c://Users/JoJo/Desktop/")

fastago <- read.FASTA("gogogofasta.fasta")
fastago
class(fastago)
class(fastago) <- NULL
class(fastago)
str(fastago)
fastago$A
class(fastago) <- "DNAbin"
class(fastago)
fastago




phylipgo <- read.dna("phylipgogogo.phy")
phylipgo
class(phylipgo)
class(phylipgo) <- "DNAbin"
class(phylipgo)
class 
alin <- as.alignment(phylipgo)


nexgo <- read.nexus.data("gogogodefastaanexus.fasta.nex")
nexgo
class(nexgo)
nexgo$A

morphy <- read.dna("gogogomorfophy.phy")
morphy

###datos morfológicos sólo en formato nexus###
mornex <- read.nexus.data("gogogomorfonex.nex")
mornex
class(mornex)
mornex$brah

install.packages("seqinr")
library(seqinr)

s <- choosebank("genbank")
?query
query("rampho", "sp=Ramphocelus@")
x <- paste("AJ5345", 26:49, sep = "")
x <- c("Z73494", x)
x
sequences <- read.GenBank(x)
sequences
class(sequences)
class(sequences) <- "DNAbin"
class(sequences)
sequences$Z73494
sequences
class(sequences$Z73494)
write.FASTA(sequences, "sequencesfasta.fasta")
?write.FASTA

abc <- read.FASTA("sequencesalignment.fas")
abc
as.alignment(abc)

###secuencias de DNA para 3 terminales ACGT, n, ?###
###morfo 3 terminales 01, 02, 03,###
###construir desde R###

misec <- list()
