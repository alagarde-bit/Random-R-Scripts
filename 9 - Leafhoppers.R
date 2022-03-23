diet <- c("control", "control", "sucrose", "sucrose", "glucose", "glucose",
          "fructose", "fructose")
survival <- c(2.3, 1.7, 4, 3.6, 2.9, 2.7, 2.1, 2.3)
leafhoppers <- data.frame(diet = diet, surival = survival)

library(DescTools)
leaf.aov <- aov(survival ~ diet, data = leafhoppers)
PostHocTest(leaf.aov, conf.level = 0.95, method = "bonferroni")
PostHocTest(leaf.aov, conf.level = 0.95, method = "lsd")
PostHocTest(leaf.aov, conf.level = 0.95, method = "hsd")
PostHocTest(leaf.aov, conf.level = 0.95, method = "scheffe")

# For later in the notes
aggregate(survival ~ diet, FUN = "mean", data = leafhoppers)

library(tidyverse)
library(lsmeans)


leaf.aov <- aov(survival ~ diet, data = leafhoppers)
leaf.ls <- lsmeans(leaf.aov, "diet")
contrast(leaf.ls, list('Control vs Sugar' = c(1, -1/3, -1/3, -1/3)))
PostHocTest(leaf.aov, conf.level = 0.95, method = "scheffe")