rm(list=ls())

library(openxlsx)
library(imputeTS)
library(ROCR)
library(glmnet)
library(caret)
library(pROC)
library(vip)
library(corrplot)
library(dplyr)
library(ggstatsplot)
library(hrbrthemes)
library(reshape)
set.seed(1234)
setwd("~/Desktop/Modelling_circadian _lock_of_Neurospora/PLos_comp_Figure/")
df<-read.xlsx("trans.xlsx")
a<-read.xlsx("clean_top_ten_model.xlsx")
del<-c("kd1","kd2","kd6","kd7","kd8","kd9","kdL","kd10","kd13")
df = df[,!(names(df) %in% del)]
dat<-melt(df)

#pdf(file="papr.pdf",width=20/1.54,height=20/1.54)
ggpairs(df[,c(2:20)])

pdf(file="papr.pdf",width=20/1.54,height=20/1.54)
ggpairs(a[,c(2:11)])
dev.off()


pdf(file="papr1.pdf",width=30/1.54,height=60/1.54)
ggpairs(df[,c(2:67)])
dev.off()

######boxplot 
pdf(file="boxplot1.pdf",width=20/1.54,height=20/1.54)
boxplot(a[,c(2:11)],horizontal = TRUE,
       las = 2)
dev.off()


pdf(file="boxplot2.pdf",width=20/1.54,height=40/1.54)
boxplot(df[,c(2:67)],horizontal = TRUE,
        las = 2)
dev.off()
###############

p<-ggplot(dat, aes(x=value, color=variable, fill=variable)) +
  geom_histogram(alpha=0.5, binwidth = 2) +
  #scale_fill_viridis(discrete=TRUE) +
  #scale_color_viridis(discrete=TRUE) +
  #geom_histogram(alpha=0.2, binwidth = 0.1) +
  theme_ipsum() +
  theme(
    legend.position="none",
    panel.spacing = unit(0.1, "lines"),
    strip.text.x = element_text(size = 8)
  ) +
  xlab("") +
  ylab("Slected parameter set") +
  facet_wrap(~variable)
p+geom_density(col = "#1b98e0", size = 1)


#ggsave(p, file='test.pdf')
#p+ geom_density(aes(x = value)) + facet_wrap(~variable,scales = "free")


ggplot(dat, aes(x = value,y = ..density..)) +    # Draw histogram & density
   #geom_histogram(aes(y = ..density..)) + 
   geom_histogram(alpha=0.5, binwidth = 0.1) +
   geom_density(col = "#1b98e0", size = 1) + 
   #facet_wrap(~variable, scales = "free")
facet_grid(value ~ variable) 

ggplot(dat, aes(x=value)) +
geom_histogram(aes(y=..density..),binwidth=.5, alpha=.5, position="identity") + geom_density(alpha=.3)+
facet_grid(~ variable) 

##################
pdf(file="boxplot2.pdf",width=50/1.54,height=50/1.54)
ggpairs(df[,c(2:67)],upper = list(na ="na"))
dev.off()

pdf(file="final_plot_1.pdf",width=50/1.54,height=50/1.54)
ggpairs(df[,c(2:20)], columns=colnames(df[,c(2:20)]),
        lower=list(na ="na"), upper=list(continuous="smooth"),diag=list(continuous="densityDiag"))
dev.off()
#
pdf(file="final_plot_1.pdf",width=30/1.54,height=30/1.54)

ggpairs(df[,c(2:20)],columns=colnames(df[,c(2:20)]),
      lower = list(continuous = "blank"),
diag=list(continuous="densityDiag"),
upper = list(continuous = wrap("points", alpha = 0.3),
  combo = wrap("dot_no_facet", alpha = 0.4)))
dev.off()


ggplot(dat, aes(x=value, color=variable, fill=variable)) +
geom_histogram(alpha=0.5, binwidth = 0.1) +
     #scale_fill_viridis(discrete=TRUE) +
    #scale_color_viridis(discrete=TRUE) +
    #geom_histogram(alpha=0.2, binwidth = 0.1) +
  theme_ipsum() +
  theme(
  legend.position="none",
  panel.spacing = unit(0.1, "lines"),
  strip.text.x = element_text(size = 8)
  )+
   xlab("") +
   ylab("Slected parameter set") +
  facet_wrap(~variable)


