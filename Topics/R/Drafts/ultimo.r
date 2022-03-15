getwd()
setwd("c:/Users/JoJo/Desktop/")
list.files(pattern= "tree")

tree.primates<- ape::read.tree("primfive.tre")
x<- c(2,2,2,2,1)
##equal rates
xer<- ape::ace(x,tree.primates,type = "discrete")
xer
## all rates diferent
xard<- ape::ace(x,tree.primates, type = "d", model="ARD")
xard
###matriz cíclica
matrizciclica<- rbind(c(0,1,0), c(0,0,2), c(3,0,0),c())
matrizciclica
xcicli<-ape::ace(x,tree.primates,type = "d",model = matrizciclica)
