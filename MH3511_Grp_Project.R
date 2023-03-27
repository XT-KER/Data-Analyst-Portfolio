library(dplyr)
library(ggplot2)

data = data.frame(read.csv('Wellbeing_and_Lifestyle.csv'))
data_extracted = select(data, DAILY_STRESS, AGE, SLEEP_HOURS, CORE_CIRCLE, SUFFICIENT_INCOME)

head(data_extracted)



stress0 = data_extracted[data_extracted$DAILY_STRESS == 0,]
stress1 = data_extracted[data_extracted$DAILY_STRESS == 1,]
stress2 = data_extracted[data_extracted$DAILY_STRESS == 2,]
stress3 = data_extracted[data_extracted$DAILY_STRESS == 3,]
stress4 = data_extracted[data_extracted$DAILY_STRESS == 4,]
stress5 = data_extracted[data_extracted$DAILY_STRESS == 5,]
countstress0 = count(stress0)
countstress1 = count(stress1)
countstress2 = count(stress2)
countstress3 = count(stress3)
countstress4 = count(stress4)
countstress5 = count(stress5)
countstress = matrix(c(countstress0, countstress1, countstress2, countstress3, countstress4, countstress5), nrow = 1)
barplot_daily_stress = barplot(countstress, main = 'Barplot of Daily Stress', names.arg = c(0, 1, 2, 3, 4, 5), xlab = 'Stress Level', col = 'grey', ylim = c(0, 4000))
boxplot_daily_stress = boxplot(data_extracted$DAILY_STRESS, main = 'Boxplot of Daily Stress')

hist_sleep_hours  = hist(data_extracted$SLEEP_HOURS, main = 'Histogram of Sleep Hours', xlab = 'Sleep Hours', ylab = 'Number of People', breaks = 10)
boxplot_sleep_hours = boxplot(data_extracted$SLEEP_HOURS, main = 'Boxplot of Sleep Hours', ylab = 'Sleep Hours')

hist_core_circle = hist(data_extracted$CORE_CIRCLE, main = 'Histogram of Core Cirlce', xlab = 'Number of Close Friends', breaks = 10)
boxplot_core_circlce = boxplot(data_extracted$CORE_CIRCLE, main = 'Boxplot of Core Circle', ylab = 'Number of Close Friends')

age_grp1 = data_extracted[data_extracted$AGE == 'Less than 20', ]
age_grp2 = data_extracted[data_extracted$AGE == '21 to 35', ]
age_grp3 = data_extracted[data_extracted$AGE == '36 to 50', ]
age_grp4 = data_extracted[data_extracted$AGE == '51 or more', ]
count1 = count(age_grp1)
count2 = count(age_grp2)
count3 = count(age_grp3)
count4 = count(age_grp4)
count = matrix(c(count1, count2, count3, count4), nrow = 1)
barplot(count, names.arg = c('<=20', '21-35', '36-50', '>=51'), xlab = 'Age Groups', ylim = c(0,5000), main = 'Barplot of Age Groups', col = 'grey')

aov(formula = data_extracted$DAILY_STRESS~factor(data$extracted$SLEEP_HOURS))
