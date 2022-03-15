##
##
# https://rfunctions.blogspot.com/2014/02/measuring-phylogenetic-signal-in-r.html
###
#####
#######

## signal

## libraries

### library(ape)
library(picante)
library(adephylo)
library(ade4)
library(phylobase)
#### library(geiger)
library(phytools)

#ruta de acceso
setwd("c:/Users/JoJo/Desktop/")
getwd()
## data : tree
arbol <- read.tree("primfive.tre")
arbol

list.files("../data/")

##pdf(file="/tmp/myplotfile.pdf")
##plot(arbol)
##dev.off()

longInicial <- arbol$edge.length
arbol$edge.length <- arbol$edge.length/10
arbol$edge.length[7] <- arbol$edge.length[7]/1000
arbol$edge.length <- rep(1,8)
arbol$edge.length
## data : variables

body      <- c(4.09434, 3.61092, 2.37024, 2.02815, -1.46968)
longevity <- c(4.74493, 3.33220, 3.36730, 2.89037,  2.30259)

names(body) <- names(longevity) <- c("Homo","Pongo", "Macaca", "Ateles", "Galago")

## signal
x <- list(body = body, longevity = longevity)

sapply(x, phylosignal, arbol)
##var(body)

##pic.body <- pic(body, arbol)

## var(pic.body)

plot(arbol)
?vcv.phylo

?Kcalc

Kcalc(body, arbol, checkdata = TRUE)
?phylosignal()
phylosignal(body, arbol, reps = 999, checkdata = TRUE)

###NO ME CAMBIO###
##AYUDA ESTAN HABLANDO DE MUSULMANES MALVADOS Y ASOCIADOS##

x <- list(body = body, longevity = longevity)

sapply(x, phylosignal, arbol)


## repetir con long
### muy cortas [1/(10/100/1000)] actual
### todas iguales cortas
### todas iguales largas

for (reductor in 1:3){
    
arbol$edge.length <- longInicial/(10^reductor)

    print(arbol$edge.length)
    
print(sapply(x, phylosignal, arbol))

    }

arbol$edge.length <- longInicial

arbol$edge.length


## modificando una sola

for (reductor in 1:3){
    
arbol$edge.length[7] <- arbol$edge.length[7]/10

print(sapply(x, phylosignal, arbol))

    }

arbol$edge.length

arbol$edge.length == longInicial

plot.phylo(arbol)

arbol$edge.length



### iguales todas largas


for (reductor in 1:3){
    
    arbol$edge.length <-rep(1*10^reductor, length(arbol$edge.length))

    print(arbol$edge.length)

print(sapply(x, phylosignal, arbol))

    }

### iguales todas cortas


for (reductor in 1:3){
    
    arbol$edge.length <- rep(1/(1*10^reductor), length(arbol$edge.length))

        print(arbol$edge.length)

print(sapply(x, phylosignal, arbol))

}

arbol$edge.length


## por si las dudas sobre operaciones

1/1*10^reductor

1/(1*10^reductor)



## moran

# First, you need one file that combines both the phylogenetic and trait data
phylotraits <- phylo4d(arbol, body)

# Then, we do moran test using some Monte Carlo simulations (default is 999 randomizations)
moran.test <- abouheif.moran(phylotraits,method="Abouheif")


plot(moran.test)


## Abouheif's Cmean


# Then, we do moran test using some Monte Carlo simulations (default is 999 randomizations)
abouheif.test <- abouheif.moran(phylotraits,method="oriAbouheif")


## 3. Pagel's λ

# We chose Litter Size as the trait we are testing for phylogenetic signal. Then, we do the test with 999 randomizations:

phylosig(arbol, body, method="lambda", test=TRUE, nsim=999)


## para leer

###
##
#     https://rfunctions.blogspot.com/2017/07/phylogenetic-comparative-methods-pcms.html
#####
########
############
