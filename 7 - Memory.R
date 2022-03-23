memory <- data.frame(subject = as.factor(c(1, 1, 1, 2, 2, 2, 3, 3, 3, 
                                           4, 4, 4, 5, 5, 5, 6, 6, 6)),
                     anxiety = as.factor(c(rep(1, 9), rep(2, 9))),
                     type = as.factor(rep(c(1, 2, 3), 6)),
                     errors = c(19, 14, 6, 20, 15, 4, 14, 13, 3, 
                                16, 10, 4, 18, 8, 1, 15, 12, 6))