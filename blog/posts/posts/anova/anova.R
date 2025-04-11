library(psych)
library(tidyverse)
library(rstatix)
library(report)


income <- read.csv("income_happiness_diy.csv")
View(income)

income %>% ggplot(aes(Income_hh, Happiness, color = Income_hh)) +
  geom_jitter()

income %>% mutate(income_fct = as.factor(Income_hh)) %>% ggplot(aes(income_fct, Happiness, color=Income_hh)) + 
  geom_boxplot()



income %>%
  group_by(Income_hh) %>%
  get_summary_stats(Happiness, type = "mean_sd")


beda <- aov(Happiness~Income_hh, data=income)
summary(beda)

report(beda)


