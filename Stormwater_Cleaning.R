library(lubridate)
library(stringr)
library(tidyverse)
Burlington_Stormwater_Alex_Power_Query_Data <- readxl::read_xlsx("Burlington_Stormwater_Alex_Power_Query_Data.xlsx")
df <- Burlington_Stormwater_Alex_Power_Query_Data
# removing the seconds
df$Numerical_Time <- substr(df$Numerical_Time, 0, 5)
# remove the ending :
df$Numerical_Time <- gsub(":$", "", df$Numerical_Time)
# parse to time
df$Numerical_Time <- strptime(df$Numerical_Time, format = "%H:%M")
# extract hour
df$Numerical_Time <- hour(df$Numerical_Time)
# rename variable to Hour_of_Day
df <- rename(df, Hour_of_Day = Numerical_Time)
# casting hour to numeric type
df$Hour_of_Day <- as.numeric(df$Hour_of_Day)
# Make time 24 hourl
df$Hour_of_Day <- if_else(df$Hour_of_Day == 12 & df$Morning_Afternoon == 'a',
                          0,
                          df$Hour_of_Day)
df$Hour_of_Day <- if_else(df$Hour_of_Day < 12 & df$Morning_Afternoon =='p',
                          df$Hour_of_Day + 12,
                          df$Hour_of_Day)
df$Morning_Afternoon <- if_else(df$Morning_Afternoon == 'a', 'Morning', df$Morning_Afternoon)
df$Morning_Afternoon <- if_else(df$Morning_Afternoon == 'p', 'Afternoon', df$Morning_Afternoon)
write.csv(df, "Stormwater_proj.csv")
