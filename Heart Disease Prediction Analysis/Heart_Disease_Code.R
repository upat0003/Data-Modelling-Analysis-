source("tree.wrappers.R")
source("my.prediction.stats.R")
library(tree)
library(boot)
library(rpart)
library(rpart.plot)

#1.1
heart.train.ass3.2019 <- read.csv("heart.train.ass3.2019.csv")
heart.test.ass3.2019 <- read.csv("heart.test.ass3.2019.csv")

tree.heart <- tree(HD~.,heart.train.ass3.2019)
heart.cv = learn.tree.cv(tree.heart,nfolds = 10,m=1000)
heart.cv$best.tree

#1.2
plot(heart.cv$best.tree)
text(heart.cv$best.tree, pretty = 12)

#1.3
heart.cv$best.tree

#1.5
heart.logfit <- glm(HD~., family = binomial, heart.train.ass3.2019)
heart.bic <- step(heart.logfit,k=log(length(heart.train.ass3.2019$HD)))
heart.bic$coefficients

#1.6
heart.bic$coefficients

#1.7
my.pred.stats(predict(heart.cv$best.tree,heart.train.ass3.2019)[,2],heart.train.ass3.2019$HD)
my.pred.stats(predict(heart.bic,heart.train.ass3.2019,type="response"),heart.train.ass3.2019$HD)

#1.8
pat=heart.test.ass3.2019[45,]
tree45=predict(heart.cv$best.tree,pat,type="prob")
tree45
odds=tree45/(1-tree45)
odds


prob.bic <- predict(heart.bic,pat, type = "response")
odds = prob.bic/(1-prob.bic)
odds



#1.9
boot.prob=function(formula,data,indices)
{
  d=data[indices,]
  fit=glm(formula,d,family = binomial)

  df=heart.test.ass3.2019[45,]

  p=predict(fit,df,type="response")
  return(p)
  
}
Bs = boot(data=heart.train.ass3.2019, statistic = boot.prob, R=5000,formula=HD ~ CP + EXANG + OLDPEAK + CA + THAL)
boot.ci(Bs, 0.95, type="bca")

#1.10
# 95% confidence interval using bootstrp
boot.ca = function(formula, data, indices)
{
  d = data[indices,]
  
  fit = glm(formula, d, family=binomial)
  
  target = as.character(fit$terms[[2]])
  rv = my.pred.stats(predict(fit,d,type="response"), d[,target])
  return(rv$ca)
}
kks = boot(heart.train.ass3.2019, statistic=boot.ca, R=5000, formula=HD~CP+EXANG+OLDPEAK+CA+THAL)
boot.ci(bs,conf=0.95,type="bca")
plot(kks)


