getwd()
setwd("c:/Users/JoJo/Desktop/")
list.files()
list.files(pattern= "prim")
library(ape)

treprimates<-read.tree("primfive.tre")
treprimates$edge.length
length(treprimates$edge.length)
#¿Está enraizado?
is.rooted.phylo(treprimates)

plot(treprimates)
body <- c(4.09434, 3.61092, 2.37024, 2.02815, -1.46968) 
longevity <- c(4.74493, 3.3322, 3.3673, 2.89037, 2.30259)
?names
names(body)<- names(longevity) <- c("Homo","Pongo","Macaca","Ateles", "Galago")
?pic
pic.body<- pic(body,treprimates)
pic.body
pic.longevity <- pic(longevity, treprimates)
pic.body
pic.longevity
?read.tree
class(treprimates)
#arbol primates pero longitud 1 para todos
treprimates1<- treprimates
treprimates1<- treprimates1$edge.length<- rep(1,8)
#salio mal VERIFICAR
plot.phylo(treprimates)
plot.phylo(treprimates1)
#verificar longitudes de los dos arboles#
treprimates$edge.length
treprimates1$edge.length

treprimates$edge
pic.body1<- pic(body,treprimates)
pic.body1
pic.body

#nodelabels para poner los valores en los nodos, vamos a comparar con BL desigual y BL 1

#FIGURA 6.1 PARADIS 2012#
?nodelabels
plot.phylo(treprimates, use.edge.length = T)
?plot.phylo
nodelabels(round(pic.body,3), adj= c(0,-0.5), frame= "n", col = "blue")
nodelabels(round(pic.longevity,3),adj= c(0,1), frame= "n", col= "red")
treprimates$edge.length

#FIGURA 6.2 PARADIS 2012 CORRELACIÓN#
?cor
ls()
plot(pic.body,pic.longevity)
?abline
abline(x,y)
lm(pic.longevity ~ pic.body)
lm(pic.longevity ~ pic.body - 1)
lmorigin(pic.longevity ~ pic.body, nperm = 1e4)

#arbol cofenetico
w <- 1/cophenetic(treprimates)
w
str(w)
z<- w
diag(z) <- 0
z

Moran.I(body,z)


#vamos a calcular la significancia del indice de Moran
install.packages("ade4")
library(ade4)
gearymoran(z,data.frame(body,longevity))
Moran.I(longevity, cophenetic(treprimates))

install.packages("adephylo")
library(adephylo)
abouheif.moran(cbind(body,longevity),z)

#cargar libreria phylobase para phylo4d
library(phylobase)
x<- phylo4d(treprimates, data.frame(body,longevity))
x
str(x)
abouheif.moran(x)
data(carnivora)
ls()
str(carnivora)

frm <- SW ~ Order/SuperFamily/Family/Genus

class(frm)
str(frm)

correl.gran<- correlogram.formula(frm, data=carnivora)
correl.gran
class(correl.gran)
plot(correl.gran, col= c("red","green"))
?rnorm
?replicate
?rTraitCont

tr<- rtree(30)
tr
length(tr$edge.length)
plot(tr)

X<- matrix(rnorm(150),30,5)
Y<- matrix(abs(rnorm(150)),30,5)
head(X)
tail(X)
rownames(X)<- tr$tip.label
rownames(Y)<- tr$tip.label
head(X)

X2<- replicate(5, rTraitCont(tr))
rTraitCont(tr)

dat<- phylo4d(tr,X)
dat1<- phylo4d(tr, Y)
dat2<- phylo4d(tr, X2)

par(mfrow= c(1,2)
res<- ppca(dat)
res2<- ppca(dat2)
res1<- ppca(dat1)
dev.off()

#minimos cuadrados
library(nlme)
?corGrafen
?corBrownian
?corPagel

#model fitting by residual ML

bm.prim<- corBrownian(phy=treprimates)
class(bm.prim)
bm.prim
str(bm.prim)

data<- data.frame(body,longevity)
data
m1<- gls(longevity~body, data, correlation = bm.prim)
m1
summary(m1)

?exp

##no linear

mod<- longevity~exp(beta*body)+alpha
str(mod)
init<- list(alpha=1, beta=1)
str(init)
?gnls
exm1<- gnls(mod, data, start = init, correlation = bm.prim)
summary(exm1)
str(exm1)
class(exm1)
exm1$method

#GEE Generalized estimating equations si sirve para politomias
install.packages("gee")
library(gee)
compar.gee(longevity~body, phy= treprimates)

## mixed models and variance partitioning ##
vcv()

### THe Ornstein-Uhlenbeck Model (OU) es un tipo de movimiento browniano pero con limitaciones en su cambio o divergencia, CONSTRIÑE sobre un valor EL CAMBIO INDEFINIDO DEL MB #


?cumsum

x<- cumsum(c(0,rnorm(99)))
x2<- cumsum(c(0,rnorm(99)))
?pl
plot(x)
class(x)
y<- numeric(100)    
plot(y)

for (i in 1:99)
  {
  y[i+1] <- y[i] - 0.2 * y[i] + rnorm(1)
}

plot(y)

Y<- replicate(5,cumsum(c(0,rnorm(99))))

sim.ou<- function(){
  x<- numeric(100)
  for(i in 1:99)
    x[i+1]<- x[i] - 0.2 * x[i] + rnorm(1)}


Y2<- replicate(5,sim.ou())

layout(matrix(1:2,1,2))
dev.off()
yl<- range(Y)
matplot(y, ylim = yl, type = "l", col = 1, main="Brownian")
matplot(Y2,ylim = yl, type = "l", col = 1, main="OU"))

compar.ou(longevity, treprimates, alpha = 0.2)
compar.ou(longevity, treprimates, alpha = 2)
compar.ou(longevity, treprimates, alpha = 2, node = 8)
