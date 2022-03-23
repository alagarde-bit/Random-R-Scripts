diet <- c("control", "control", "sucrose", "sucrose", "glucose", "glucose",
          "fructose", "fructose")
survival <- c(2.3, 1.7, 4.0, 3.6, 2.9, 2.7, 2.1, 2.3)
leafhoppers <- data.frame(diet = diet, survival = survival)

library(lsmeans)
library(DescTools)
library(tidyverse)
leaf.aov <- aov(survival ~ diet, data = leafhoppers)
leaf.ls <- lsmeans(leaf.aov, "diet")
contrast(leaf.ls, list('control vs sugar' = c(-1/2,-1/2,1/2,1/2)))

ivfluids <- data.frame(company = c(rep("Cutter", 6), 
                                   rep("Abbot", 6),
                                   rep("McGaw", 6)),
                       particles = c(255, 265, 343, 332, 232, 217, 
                                     106, 289, 99, 275, 221, 240,
                                     578, 516, 214, 413, 401, 260))


iv.aov <- aov(particles ~ company, data = ivfluids)
iv.least <- lsmeans(iv.aov, "company")

contrast(iv.least, list(' ' = c(-1/2,-1/2, 1)))
(-1/2 * 205) + (1 * 274) + (-1/2 * 397)
2916 / 9834


qf(0.95, 3,44)
1-pf(2.82, 3, 44, 8.8)
power.anova.test(
  groups = 4,
  between.var = var(c(250, 250, 300, 300)),
  within.var = 3400,
  power = .9
)
(95)^1/6
