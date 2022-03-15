### 2021 12 17
#### construcción arbol
##
## DRME
##

ls()

set.seed(13)

## bibliotecas
library(ape)

arbol5 <- rtree(5)
arbol5
plot.phylo(arbol5)

arbol5$edge

sarbol5 <- stree(5,"right")
plot.phylo(sarbol5)
?ape

#
#dev.off()

class(arbol4$edge)

str(arbol4)

arbol4$edge
## arbol por partes


edge <- matrix(as.integer(c(4,1,4,2,4,3)),ncol=2,byrow=T)
miedge <- matrix(as.integer(c(6,7,7,8,7,9,8,10,8,11,9,12,9,13,6,14)), ncol=2, byrow = T)

edge
miedge

class(edge)
str(edge)

tip.label <- c("hoja1","hoja2","hoja3")

arbol <- list()

arbol$edge <- edge

arbol$tip.label <- tip.label

class(arbol) <- "phylo"

plot.phylo(arbol)

## sniff algo malo pasó!!!

arbol$Nnode <- 1

plot.phylo(arbol)

str(arbol)



## Quizas podria ser util

##
attr(arbol, "order") <- "cladewise"


##
plot(arbol)

