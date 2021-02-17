source("tree.wrappers.R")
source("my.prediction.stats.R")
library(tree)
library(boot)
library(rpart)
library(kknn)
ms.train.ass3.2019 <- read.csv("ms.train.ass3.2019.csv")
ms.test.ass3.2019 <- read.csv("ms.test.ass3.2019.csv")


#2.1(a)
k <- c(1:25)
mss_error <- c()

for (i in k){
  mztest1 = fitted(kknn(intensity~., ms.train.ass3.2019, ms.test.ass3.2019,
                        kernel = "optimal", k=i))
  RMSE = sqrt(mean((mztest1 - ms.test.ass3.2019$intensity)^2))
  mss_error <- c(mss_error, RMSE )
}

plot(k,mss_error)



#2.1(b)

#For k=2
mztest2 = fitted(kknn(intensity~., ms.train.ass3.2019, ms.test.ass3.2019, kernel="optimal", k=2))

plot(ms.train.ass3.2019, col = "blue", ylab="Relative Intensity", xlab="Mass/Charge (M/Z)")
lines(ms.test.ass3.2019, type = "l", col = "red")
lines(ms.test.ass3.2019$MZ, mztest2, type ="l", col="black")

legend(x=4400, y=33, legend=c("Training d.p.s", "True Spectrum", "Est. spectrum (k=2)"), col=c("blue", "red", "green"), lty=c(1,1))


#For k=5
mztest5 = fitted(kknn(intensity~., ms.train.ass3.2019, ms.test.ass3.2019, kernel="optimal", k=5))

plot(ms.train.ass3.2019, col = "blue", ylab="Relative Intensity", xlab="Mass/Charge (M/Z)")
lines(ms.test.ass3.2019$MZ, ms.test.ass3.2019$intensity, type = "l", col = "red")
lines(ms.test.ass3.2019$MZ, mztest5, type ="l", col="black")

legend(x=4400, y=33, legend=c("Training d.p.s", "True Spectrum", "Est. spectrum (k=5)"), col=c("blue", "red", "green"), lty=c(1,1))


#For k=10
mztest10 = fitted(kknn(intensity~., ms.train.ass3.2019, ms.test.ass3.2019, kernel="optimal", k=10))

plot(ms.train.ass3.2019, col = "blue", ylab="Relative Intensity", xlab="Mass/Charge (M/Z)")
lines(ms.test.ass3.2019$MZ, ms.test.ass3.2019$intensity, type = "l", col = "red")
lines(ms.test.ass3.2019$MZ, mztest10, type ="l", col="black")

legend(x=4400, y=33, legend=c("Training d.p.s", "True Spectrum", "Est. spectrum (k=10)"), col=c("blue", "red", "green"), lty=c(1,1))

#For k=25
mztest25 = fitted(kknn(intensity~., ms.train.ass3.2019, ms.test.ass3.2019, kernel="optimal", k=25))

plot(ms.train.ass3.2019, col = "blue", ylab="Relative Intensity", xlab="Mass/Charge (M/Z)")
lines(ms.test.ass3.2019$MZ, ms.test.ass3.2019$intensity, type = "l", col = "red")
lines(ms.test.ass3.2019$MZ, mztest25, type ="l", col="black")

legend(x=4400, y=33, legend=c("Training d.p.s", "True Spectrum", "Est. spectrum (k=25)"), col=c("blue", "red", "green"), lty=c(1,1))





#2.1c
mss_error_2 <- sqrt(mean((mztest2 - ms.test.ass3.2019$intensity)^2))
mss_error_5 <- sqrt(mean((mztest5 - ms.test.ass3.2019$intensity)^2))
mss_error_10 <- sqrt(mean((mztest10 - ms.test.ass3.2019$intensity)^2))
mss_error_25 <- sqrt(mean((mztest25 - ms.test.ass3.2019$intensity)^2))




#2.2
knn.ms = train.kknn(intensity ~ ., data = ms.train.ass3.2019, kmax=25, kernel = "optimal")

#2.3
mztest3 = fitted(kknn(intensity~., ms.train.ass3.2019, ms.test.ass3.2019, kernel="optimal", k=knn.ms$best.parameters))
mss_var_3 <- var(mztest3)
mss_var_3



#2.5
tree.ms <- tree(intensity~., data=ms.train.ass3.2019)
ms.tree.cv = learn.tree.cv(tree.ms, nfolds = 10, m = 1000)
ms.tree.cv
y <- predict(ms.tree.cv$best.tree, ms.test.ass3.2019)

plot(ms.train.ass3.2019$MZ, ms.train.ass3.2019$intensity, col = "blue", ylab="Relative Intensity", xlab="Mass/Charge (M/Z)")
lines(ms.test.ass3.2019$MZ, ms.test.ass3.2019$intensity, type = "l", col = "red")
lines(ms.test.ass3.2019$MZ, y, type="l",col = "black")

legend(x=4200, y=33, legend=c("Training d.p.s", "True Spectrum", "Est. spectrum (tree)"), col=c("blue", "red", "black"), lty=c(1,1,1))

mse_error_tree <- sqrt(mean((y - ms.test.ass3.2019$intensity)^2))
mse_error_tree


#2.7

knn.ms = train.kknn(intensity ~ ., data = ms.train.ass3.2019, kmax=25, kernel = "optimal")

boot.knn = function(formula, data, indices)
{
  # Create a bootstrapped version of our data
  d = data[indices,]
  # Fit a logistic regression to the bootstrapped data
  fit = train.kknn(formula, d, k=3, kernal = "optimal")
  #fit = glm(formula, d, family=binomial)
  # Compute the AUC and return it
  target = as.character(fit$terms[[2]])
  rv = my.pred.stats(predict(fit,d,type="response"), d[,target], display=F)
  return(rv$t)

}


bs = boot(data=ms.train.ass3.2019, statistic=boot.knn, R=1000, formula=DIABETES ~ .)
boot.ci(bs,conf=0.95,type="bca")
plot(bs)