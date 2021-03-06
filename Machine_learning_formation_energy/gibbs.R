library(ggtern)
library(scales)

setwd('/Users/pzawadzk/Dropbox/gitmisc/insight/data')

name = "Cu_Sn_S"


elem = unlist(strsplit(name, "_"))

d <- read.table(paste(name, ".dat", sep =''), col.names = c("A", "B", "C", "E"))
par( mai=c(0.65, 0.65, 0.1, 0.05), mgp=c(2, 0.5, 0), tck=-0.03 )

plt <- ggtern(data=data.frame(a=d$A, b=d$B, c=d$C, z=d$E),  aes(a, b, c)) +
geom_point(colour = "grey", pch=21, size=0.5) + 
stat_density2d(aes(weight=z, colour=rev(..level..)), binwidth=25) +
scale_colour_gradient2(low = "blue",  high = "red", limits=c(-425, 100.0), space="Lab")+
labs(L=elem[1],T=elem[2],R=elem[3])+
theme_bw(base_size = 20) 

plt
  