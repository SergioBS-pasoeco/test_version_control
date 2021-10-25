
setwd("D:/InnovaTIC/Data/")

#Species data

dat_spe = read.csv("Spec_Coltree.csv")

#Enviromental variables

dat_env = read.csv("Env_Coltree.csv")

dat_env$Parcela
unique(dat_spe$Parcela)

diff = setdiff( dat_spe$Parcela, dat_env$Parcela)
diff

id = c()
for (i in 1:length(diff)){
  p = which(dat_spe$Parcela == diff[i])
  id = c(id, p)
}

#Removing rows of plots without environmental information
dat_spe = dat_spe[-id,]

str(dat_spe)

dat_spe$N_cientifico = as.factor(dat_spe$N_cientifico)

levels(dat_spe$N_cientifico)

#presence_absence by plot

abd = t(table(dat_spe$N_cientifico,dat_spe$Parcela))
abd


