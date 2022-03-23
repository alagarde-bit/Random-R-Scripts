# Read in the data

coffee <- data.frame(location = as.factor(c(1, 1, 1, 1, 2, 2, 
                                            2, 2, 3, 3, 3, 3)),
                     density = as.factor(c(185, 90, 70, 0, 185, 90,
                                           70, 0, 185, 90, 70, 0)),
                     yield =  c(32, 21, 23, 20, 15, 21, 
                                15, 17, 22, 24, 22, 20))


# Create parallel dot plots for location and density (that use symbols to
# show the other factor / block)

library(ggplot2)
ggplot(coffee, aes(x = location, y = yield, shape = density)) +
  geom_point(alpha = 0.8, size = 3)
ggplot(coffee, aes(x = density, y = yield, shape = location)) +
  geom_point(alpha = 0.5, size = 3)


# Calculate averages by density and by location and the overall mean

aggregate(yield ~ density, data = coffee, FUN = "mean")
aggregate(yield ~ location, data = coffee, FUN = "mean")
mean(coffee$yield)


# Try generating an ANOVA table for this data / design
