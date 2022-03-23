soybeans <- data.frame(var = c(rep("om", 30), rep("b", 30)),
                       space = as.factor(rep(c(rep(18, 6), rep(24, 6), 
                                               rep(30, 6), rep(36, 6), 
                                               rep(42, 6)), 2)),
                       blk = as.factor(c(rep(1:6, 5), rep(7:12, 5))),
                       yield = c(33.6, 37.1, 34.1, 34.6, 35.4, 36.1, 
                                 31.1, 34.5, 30.5, 32.7, 30.7, 30.3, 
                                 33, 29.5, 29.2, 30.7, 30.7, 27.9, 
                                 28.4, 29.9, 31.6, 32.3, 28.1, 26.9, 
                                 31.4, 28.3, 28.9, 28.6, 18.5, 33.4, 
                                 28, 25.5, 28.3, 29.4, 27.3, 28.3, 
                                 23.7, 26.2, 27, 25.8, 26.8, 23.8, 
                                 23.5, 26.8, 24.9, 23.3, 21.4, 22, 
                                 25, 25.3, 25.6, 26.4, 24.6, 24.5, 
                                25.7, 23.2, 23.4, 25.6, 24.5, 22.9))
library(tidyverse)

means <- aggregate(yield ~ var*space, 
                   data = soybeans, mean)
ggplot(soybeans, aes(x = var, y = yield, color = space)) +
  geom_point() +
  geom_line(data = means, aes(x = var, y = yield, 
                              group = space, linetype = space))
