library(dplyr)
library(ggplot2)

data = data.frame(read.csv('Wellbeing_and_Lifestyle.csv'))
data
i = c(1:5)
data[,i] = apply(data[ , i], 2,
                 function(x) as.numeric(as.character(x)))
data = select(data, DAILY_STRESS, SLEEP_HOURS)
head(data)
str(data)
attach(data)
length(data$DAILY_STRESS)
length(data$SLEEP_HOURS)
boxplot(data$DAILY_STRESS~data$SLEEP_HOURS,main='Boxplot of daily stress by sleep hours', ylab='Daily Stress', xlab='Sleep Hours')

sleeptable = table(SLEEP_HOURS,DAILY_STRESS)
sleeptable
chisq.test(sleeptable)
