# Read in the data

bread <- data.frame(height = c(rep("Bottom", 4), 
                               rep("Middle", 4), 
                               rep("Top", 4)),
                    width = c("Regular", "Regular", "Wide", "Wide",
                              "Regular", "Regular", "Wide", "Wide",
                              "Regular", "Regular", "Wide", "Wide"),
                    sales = c(47, 43, 46, 40, 
                              62, 68, 67, 71, 
                              41, 39, 42, 46))


# Calculate all relevant averages

mean(_____$_____)
aggregate(_____ ~ _____, FUN = "mean", data = bread)
aggregate(_____ ~ _____, FUN = "mean", data = bread)
aggregate(_____ ~ _____ + _____, FUN = "mean", data = bread)