#Hi, in this code I will intend recreate the figures of Paradis (2012) from 4.2 to 4.16 without 4.13

##Installing librarys
install.packages("ape")
library(ape)

##Configuring the work directory
getwd()
setwd("c:/Users/JoJo/Desktop/")

###Are you sure you've the tree?
list.files(pattern="rodent")
tr<-read.tree("rodent.tree")
plot(tr)
###Yes you have it, I hope.

##Fig. 4.2
plot(tr, type="c", direction="l", main="Cladograma hacia la izquierda sin justificación ni longitudes de rama", use.edge.length=F)
##Fig. 4.3
plot(tr, type="c", direction="l", main="Cladograma hacia la izquierda justificado sin longitudes de rama", use.edge.length=F, adj="0")
##Fig. 4.4
plot(tr, type="u",lab4ut="axial",main="Árbol desenraizado para rodent.tree", no.margin=T, use.edge.length=F)
##Fig. 4.5
plot(tr, type="f",lab4ut="axial",main="Árbol en ventilador para rodent.tree", no.margin=T)
##Fig. 4.6
plot(tr, type="f",lab4ut="axial",main="Árbol en circulo para rodent.tree", no.margin=T)
##Fig. 4.7
plot(tr, main="Cladograma con valores de nodos")
nodelabels(bg="white")
##Fig. 4.8
tr2<- read.tree (text="((Homo,Pan),Gorilla);")
plot(tr2, main="Cladograma de Simios con fecha de divergencia")
nodelabels("6.4 Ma", 4, frame = "c", bg = "white")
nodelabels("5.4 Ma", 5, frame = "c", bg = "white")

###To be continued###
