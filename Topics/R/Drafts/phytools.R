###Phytools, exercis 7: reconstructing ancestral states for continuous and discrete characters###

library(ape)
library(phytools)

setwd("c://Users/JoJo/Desktop/")

x<-read.csv("elopomorph.csv",row.names=1)
feed.mode<- setNames(x[,1],rownames(x))
feed.mode


el.tree<-read.tree("elomoprh.tre")

plotTree(el.tree,type="fan",fsize=0.7,ftype="i",lwd=1)

cols<-setNames(c("red","blue"),levels(feed.mode))

tiplabels(pie=to.matrix(feed.mode[el.tree$tip.label],              levels(feed.mode)),piecol=cols,cex=0.3)

add.simmap.legend(colors=cols,prompt=FALSE,x=0.9*par()$usr[1],y=0.8*par()$usr[3],fsize=0.8)

#Marginal ancestral state reconstruction

?ace
fitER<-ace(feed.mode,el.tree,model="ER",type="discrete")
fitER

?phytools::anc.ML

fitER$lik.anc

xard<- ape::ace(x,tree.primates, type = "d", model="ARD")

mtree<-make.simmap(el.tree,feed.mode,model="ER", nsim = 1000)
?make.simmap
?phylo

tree<-read.tree("fitPagel-tree.tre")
X<-read.csv("fitPagel-data.csv",row.names=1,header=TRUE)
x<-setNames(X$x,rownames(X))
y<-setNames(X$y,rownames(X))
z<-setNames(X$z,rownames(X))

#aquí empieza construcción arbol

par(mfrow=c(1,2))

plot(tree,show.tip.label=FALSE,no.margin=TRUE)

par(fg="transparent")

tiplabels(pie=to.matrix(x[tree$tip.label],c("a","b")),piecol=c("blue","red"), cex=0.3)

par(fg="black")

add.simmap.legend(colors=setNames(c("blue","red"),c("a","b")),prompt=FALSE,
                  x=0,y=10,fsize=1)

par(fg="transparent")

plot(tree,show.tip.label=FALSE,no.margin=TRUE,direction="leftwards")

tiplabels(pie=to.matrix(y[tree$tip.label],c("a","b")),piecol=c("blue","red"),
          cex=0.3)

par(fg="black")
dev.off()
