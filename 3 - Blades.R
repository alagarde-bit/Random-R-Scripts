# Read in data

blades <- data.frame(angle = as.factor(c(15, 15, 20, 20, 25, 25,
                                         15, 15, 20, 20, 25, 25)),
                     speed = as.factor(c(125, 125, 125, 125, 125, 125,
                                         150, 150, 150, 150, 150, 150)),
                     lifetime = c(16, 18, 18, 21, 17, 18,
                                  15, 18, 19, 21, 23, 24))


# Calculate all meaningful averages

mean(blades$lifetime)
aggregate(lifetime ~ _______, FUN = "mean", data = blades)
aggregate(lifetime ~ _______,  FUN = "mean", data = blades)
aggregate(lifetime ~ _______ + _______,  FUN = "mean", data = blades)


# Create a parallel dot plot

library(ggplot2)
ggplot(blades, aes(x = angle, y = lifetime, shape = speed)) +
  geom_point()


# Create boxplots showing each treatment combination

ggplot(blades, aes(x = angle, y = lifetime, color = speed)) +
  geom_boxplot()


# Redo parallel dot plot so you can see all points

ggplot(blades, aes(x = angle, y = lifetime, color = speed)) +
  geom_jitter(height = 0, width = .05, alpha = .7, size = 3)


# Interaction plot (simple version)

with(blades, {
  interaction.plot(angle, speed, lifetime)
})


# ANOVA table

blades.aov <- aov(lifetime ~ angle * speed, data = blades)
anova(blades.aov)
