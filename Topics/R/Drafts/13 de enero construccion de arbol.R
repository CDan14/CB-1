###Ejercicio clase CONSTRUCCIÓN DE ÁRBOLES EN R###

##A mano##

#matriz,nombres,conteo de nodos, algunos longitud###

#1#
#Construcción del edge#
#Se juega con 2 columnas, ancestro y descendiente
#en ancestro no hay descendiente
#en descendiente hay ancestro, sólo si ese ancestro tiene ancestro
#en otras palabras:
#ancestro incluye raíz, nodos internos
#descendiente incluye terminales, nodos internos
miedge <- matrix(as.integer(c(6,1,6,7,7,8,7,9,8,2,8,3,9,4,9,5)), ncol=2, byrow = T)
miedge

class(miedge)
str(miedge)

#2#
#Nombres de destinos(descendientes) o tips#

tip.label<- c("1","2","3","4","5")

#3#
#Crear el arbol#
arbol<- list()
class(arbol)

arbol$edge<- miedge
arbol$tip.label <- tip.label
class(arbol)<- "phylo"
library(ape)
plot.phylo(arbol)

str(arbol)
#error#

#asigno los nodos internos para que se pueda graficar###
arbol
arbol$Nnode<- 4
plot.phylo(arbol)

compute.brlen(arbol,"Grafen",2)
plot.phylo(arbol)

arbol$edge.length<- c()

###prueba con edge de 3 columnas, lo aceptará?###
pedge <- matrix(as.integer(c(6,1,"A",6,7,"B",7,8,"A",7,9,"B",8,2,"A",8,3,"B",9,4,"A",9,5,"C")), ncol=3, byrow = T)
pedge
pajarito<- 
parbol<- list()
parbol$edge<- pedge
parbol$tip.label<- c("1","2","3","4","5")
class(parbol)<- "phylo"
plot.phylo(parbol)
####
?rtree
pino<- rtree(3)
str(pino)
pino$edge[,3] <- c(1,2,3,4)
pino$edge
