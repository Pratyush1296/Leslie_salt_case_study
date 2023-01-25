leslie = read.csv("Leslie_Salt.csv",header = TRUE)
str(leslie)
cor(leslie)
pairs(leslie)
plot(leslie$Size,leslie$Price)
cor(leslie$County,leslie$Elevation)

leslie$County <- factor(leslie$County,  levels=c("0","1"), labels=c("San Mateo", "Santa Clara" ))
leslie$Flood <- factor(leslie$Flood,  levels=c("0","1"), labels=c("No", "Yes" ))
pairs(leslie)
plot(leslie$Elevation,leslie$Price,col=leslie$County)
cor(leslie)

model1 = lm(Price~.,data=leslie)
summary(model1)
library(car)
vif(model1)
plot(model1)

model2 = lm(Price~.-Distance,data=leslie)
summary(model2)
plot(model2)
vif(model4)

model3=lm(Price~.,data=leslie[-26,])
summary(model3)
plot(model3)
#Since Normality is affected, we go for log transform
leslie$Price1 = log(leslie$Price)
model4 = lm(Price1~.-Price,data=leslie)
summary(model4)
plot(model4)

model5 = lm(Price~.-Price1+County*Elevation+County*Size+Flood*Sewer,data=leslie)
summary(model5)
step <- stepAIC(model5, direction="both")
summary(step)
step$anova

model6 = lm(Price~Size+Elevation+Sewer+Date+Flood+Distance+County:Elevation,data=leslie)
summary(model6)
