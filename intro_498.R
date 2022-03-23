Calcium_Final$SEX <-as.factor(Calcium_Final$SEX)
table(Calcium_Final$SEX)

table(Calcium_Final$LAB)
table(Calcium_Final$AGEGROUP)

library(tidyverse)


Calcium_Final %>% 
  group_by(SEX) %>% 
  summarise(mean = mean(AGE, na.rm = TRUE),
            sd = sd(AGE, na.rm = TRUE),
            min = min(AGE, na.rm =TRUE),
            max = max(AGE, na.rm =TRUE)
          )
summarise(Calcium_Final, mean = mean(AGE, na.rm = TRUE),
          sd = sd(AGE, na.rm = TRUE),
          min = min(AGE, na.rm =TRUE),
          max = max(AGE, na.rm =TRUE))
Calcium_Final %>% 
  group_by(SEX) %>% 
  summarise(mean = mean(ALKPHOS, na.rm = TRUE),
            sd = sd(ALKPHOS, na.rm = TRUE),
            min = min(ALKPHOS, na.rm =TRUE),
            max = max(ALKPHOS, na.rm =TRUE)
  )
summarise(Calcium_Final, mean = mean(ALKPHOS, na.rm = TRUE),
          sd = sd(ALKPHOS, na.rm = TRUE),
          min = min(ALKPHOS, na.rm =TRUE),
          max = max(ALKPHOS, na.rm =TRUE))
Calcium_Final %>% 
  group_by(SEX) %>% 
  summarise(mean = mean(CAMMOL, na.rm = TRUE),
            sd = sd(CAMMOL, na.rm = TRUE),
            min = min(CAMMOL, na.rm =TRUE),
            max = max(CAMMOL, na.rm =TRUE)
  )
summarise(Calcium_Final, mean = mean(CAMMOL, na.rm = TRUE),
          sd = sd(CAMMOL, na.rm = TRUE),
          min = min(CAMMOL, na.rm =TRUE),
          max = max(CAMMOL, na.rm =TRUE))
Calcium_Final %>% 
  group_by(SEX) %>% 
  summarise(mean = mean(PHOSMOL, na.rm = TRUE),
            sd = sd(PHOSMOL, na.rm = TRUE),
            min = min(PHOSMOL, na.rm =TRUE),
            max = max(PHOSMOL, na.rm =TRUE)
  )
summarise(Calcium_Final, mean = mean(PHOSMOL, na.rm = TRUE),
          sd = sd(PHOSMOL, na.rm = TRUE),
          min = min(PHOSMOL, na.rm =TRUE),
          max = max(PHOSMOL, na.rm =TRUE))

ggplot(Calcium_Final, aes(x = SEX, y= ALKPHOS)) + geom_boxplot()

ggplot(Calcium_Final, aes(x = SEX, y= CAMMOL)) + geom_boxplot()

ggplot(Calcium_Final, aes(x = SEX, y= PHOSMOL)) + geom_boxplot()
