library(tidyverse)
library(lubridate)
library(haven)
library(Hmisc)
Fall_2014_italian <- read_sav("Fall_2014_italian.sav")
View(Fall_2014_italian)
# removing meaningless variables
Fall_2014_italian <- select(Fall_2014_italian, 
                            -IPAddress,
                            -EmailAddress,
                            -FirstName,
                            -LastName, 
                            -CustomData1,
                            -CollectorNm,
                            -RespondentID,
                            -CollectorID,
                            )
# changing start date variable to a datetime datatype
Fall_2014_italian$StartDate = as.POSIXct(Fall_2014_italian$StartDate,
                                         format = "%m/%d/%Y %H:%M:%S %p",
                                         tz = "UTC")
# creating variables language, year, and month
Fall_2014_italian <- mutate(Fall_2014_italian, 
                            language = "Italian",
                            year = year(StartDate),
                            month = month(StartDate))
# creating semester variable conditioned on the month variable
Fall_2014_italian <- Fall_2014_italian %>% 
  mutate(semester = case_when(month < 13 && month > 8  ~ 'Fall',
                              month <6 && month > 1  ~ 'Spring',
                              TRUE  ~ 'Other'))
# renaming varables
Fall_2014_italian <- rename(Fall_2014_italian, 
                            q0301 = q0003_0001,
                            q0302 = q0003_0002,
                            q0303 = q0003_0003,
                            q0304 = q0003_0004,
                            q0305 = q0003_0005,
                            q0306 = q0003_0006,
                            q0307 = q0003_0007,
                            q0308 = q0003_0008,
                            q0309 = q0003_0009,
                            q0501 = q0005_0001,
                            q0502 = q0005_0002,
                            q0503 = q0005_0003,
                            q0504 = q0005_0004,
                            q0505 = q0005_0005,
                            q0506 = q0005_0006,
                            q0507 = q0005_0007,
                            q0508 = q0005_0008,
                            q0509 = q0005_0009,
                            q0510 = q0005_0010,
                            q0511 = q0005_0011,
                            q0512 = q0005_0012,
                            q0513 = q0005_0013,
                            q0514 = q0005_0014,
                            q0515 = q0005_0015,
                            q0516 = q0005_0016,
                            q0517 = q0005_0017,
                            q0518 = q0005_0018,
                            q0801 = q0008_0001,
                            q0802 = q0008_0002,
                            q0803 = q0008_0003,
                            q0804 = q0008_0004,
                            q0805 = q0008_0005,
                            q0806 = q0008_0006,
                            q0807 = q0008_0007,
                            q0808 = q0008_0008,
                            q0809 = q0008_0009,
                            q0810 = q0008_0010,
                            q0811 = q0008_0011,
                            q0812 = q0008_0012,
                            q0813 = q0008_0013,
                            q0814 = q0008_0014,
                            q0815 = q0008_0015)
# Question 3 changing nulls to 0
Fall_2014_italian$q0301[is.na(Fall_2014_italian$q0301)] <- 0
Fall_2014_italian$q0302[is.na(Fall_2014_italian$q0302)] <- 0
Fall_2014_italian$q0303[is.na(Fall_2014_italian$q0303)] <- 0
Fall_2014_italian$q0304[is.na(Fall_2014_italian$q0304)] <- 0
Fall_2014_italian$q0305[is.na(Fall_2014_italian$q0305)] <- 0
Fall_2014_italian$q0306[is.na(Fall_2014_italian$q0306)] <- 0
Fall_2014_italian$q0307[is.na(Fall_2014_italian$q0307)] <- 0
Fall_2014_italian$q0308[is.na(Fall_2014_italian$q0308)] <- 0
Fall_2014_italian$q0309[is.na(Fall_2014_italian$q0309)] <- 0
# Question 5 changing values
Fall_2014_italian$q0301[is.na(Fall_2014_italian$q0301)] <- 0
Fall_2014_italian$q0302[is.na(Fall_2014_italian$q0302)] <- 0
Fall_2014_italian$q0303[is.na(Fall_2014_italian$q0303)] <- 0
Fall_2014_italian$q0304[is.na(Fall_2014_italian$q0304)] <- 0
Fall_2014_italian$q0305[is.na(Fall_2014_italian$q0305)] <- 0
Fall_2014_italian$q0306[is.na(Fall_2014_italian$q0306)] <- 0
Fall_2014_italian$q0307[is.na(Fall_2014_italian$q0307)] <- 0
Fall_2014_italian$q0308[is.na(Fall_2014_italian$q0308)] <- 0
Fall_2014_italian$q0309[is.na(Fall_2014_italian$q0309)] <- 0
Fall_2014_italian$q0501[is.na(Fall_2014_italian$q0501)] <- 0
Fall_2014_italian$q0502[is.na(Fall_2014_italian$q0502)] <- 0
Fall_2014_italian$q0503[is.na(Fall_2014_italian$q0503)] <- 0
Fall_2014_italian$q0504[is.na(Fall_2014_italian$q0504)] <- 0
Fall_2014_italian$q0505[is.na(Fall_2014_italian$q0505)] <- 0
Fall_2014_italian$q0506[is.na(Fall_2014_italian$q0506)] <- 0
Fall_2014_italian$q0507[is.na(Fall_2014_italian$q0507)] <- 0
Fall_2014_italian$q0508[is.na(Fall_2014_italian$q0508)] <- 0
Fall_2014_italian$q0509[is.na(Fall_2014_italian$q0509)] <- 0
Fall_2014_italian$q0510[is.na(Fall_2014_italian$q0510)] <- 0
Fall_2014_italian$q0511[is.na(Fall_2014_italian$q0511)] <- 0
Fall_2014_italian$q0512[is.na(Fall_2014_italian$q0512)] <- 0
Fall_2014_italian$q0513[is.na(Fall_2014_italian$q0513)] <- 0
Fall_2014_italian$q0514[is.na(Fall_2014_italian$q0514)] <- 0
Fall_2014_italian$q0515[is.na(Fall_2014_italian$q0515)] <- 0
Fall_2014_italian$q0516[is.na(Fall_2014_italian$q0516)] <- 0
Fall_2014_italian$q0517[is.na(Fall_2014_italian$q0517)] <- 0
Fall_2014_italian$q0518[is.na(Fall_2014_italian$q0518)] <- 0
Fall_2014_italian$q0501[Fall_2014_italian$q0501 == 1] <- 0.5
Fall_2014_italian$q0502[Fall_2014_italian$q0502 == 1] <- 0.5
Fall_2014_italian$q0503[Fall_2014_italian$q0503 == 1] <- 0.5
Fall_2014_italian$q0504[Fall_2014_italian$q0504 == 1] <- 0.5
Fall_2014_italian$q0505[Fall_2014_italian$q0505 == 1] <- 0.5
Fall_2014_italian$q0506[Fall_2014_italian$q0506 == 1] <- 0.5
Fall_2014_italian$q0507[Fall_2014_italian$q0507 == 1] <- 0.5
Fall_2014_italian$q0508[Fall_2014_italian$q0508 == 1] <- 0.5
Fall_2014_italian$q0509[Fall_2014_italian$q0509 == 1] <- 0.5
Fall_2014_italian$q0510[Fall_2014_italian$q0510 == 1] <- 0.5
Fall_2014_italian$q0511[Fall_2014_italian$q0511 == 1] <- 0.5
Fall_2014_italian$q0512[Fall_2014_italian$q0512 == 1] <- 0.5
Fall_2014_italian$q0513[Fall_2014_italian$q0513 == 1] <- 0.5
Fall_2014_italian$q0514[Fall_2014_italian$q0514 == 1] <- 0.5
Fall_2014_italian$q0515[Fall_2014_italian$q0515 == 1] <- 0.5
Fall_2014_italian$q0516[Fall_2014_italian$q0516 == 1] <- 0.5
Fall_2014_italian$q0517[Fall_2014_italian$q0517 == 1] <- 0.5
Fall_2014_italian$q0518[Fall_2014_italian$q0518 == 1] <- 0.5
# Question 8 changing values 
Fall_2014_italian$q0801[is.na(Fall_2014_italian$q0801)] <- 0
Fall_2014_italian$q0802[is.na(Fall_2014_italian$q0802)] <- 0
Fall_2014_italian$q0803[is.na(Fall_2014_italian$q0803)] <- 0
Fall_2014_italian$q0804[is.na(Fall_2014_italian$q0804)] <- 0
Fall_2014_italian$q0805[is.na(Fall_2014_italian$q0805)] <- 0
Fall_2014_italian$q0806[is.na(Fall_2014_italian$q0806)] <- 0
Fall_2014_italian$q0807[is.na(Fall_2014_italian$q0807)] <- 0
Fall_2014_italian$q0808[is.na(Fall_2014_italian$q0808)] <- 0
Fall_2014_italian$q0809[is.na(Fall_2014_italian$q0809)] <- 0
Fall_2014_italian$q0810[is.na(Fall_2014_italian$q0810)] <- 0
Fall_2014_italian$q0811[is.na(Fall_2014_italian$q0811)] <- 0
Fall_2014_italian$q0812[is.na(Fall_2014_italian$q0812)] <- 0
Fall_2014_italian$q0813[is.na(Fall_2014_italian$q0813)] <- 0
Fall_2014_italian$q0814[is.na(Fall_2014_italian$q0814)] <- 0
Fall_2014_italian$q0815[is.na(Fall_2014_italian$q0815)] <- 0

Fall_2014_italian$q0801[Fall_2014_italian$q0801 == 1] <- 0.5
Fall_2014_italian$q0802[Fall_2014_italian$q0802 == 1] <- 0.5
Fall_2014_italian$q0803[Fall_2014_italian$q0803 == 1] <- 0.5
Fall_2014_italian$q0804[Fall_2014_italian$q0804 == 1] <- 0.5
Fall_2014_italian$q0805[Fall_2014_italian$q0805 == 1] <- 0.5
Fall_2014_italian$q0806[Fall_2014_italian$q0806 == 1] <- 0.5
Fall_2014_italian$q0807[Fall_2014_italian$q0807 == 1] <- 0.5
Fall_2014_italian$q0808[Fall_2014_italian$q0808 == 1] <- 0.5
Fall_2014_italian$q0809[Fall_2014_italian$q0809 == 1] <- 0.5
Fall_2014_italian$q0810[Fall_2014_italian$q0810 == 1] <- 0.5
Fall_2014_italian$q0811[Fall_2014_italian$q0811 == 1] <- 0.5
Fall_2014_italian$q0812[Fall_2014_italian$q0812 == 1] <- 0.5
Fall_2014_italian$q0813[Fall_2014_italian$q0813 == 1] <- 0.5
Fall_2014_italian$q0814[Fall_2014_italian$q0814 == 1] <- 0.5
Fall_2014_italian$q0815[Fall_2014_italian$q0815 == 1] <- 0.5
# Question 3 labels
label(Fall_2014_italian$q0301) <- "This is my first experience with this language"
label(Fall_2014_italian$q0302) <- "I took this language in elementary or middle school"
label(Fall_2014_italian$q0303) <- "I took this language in high school"
label(Fall_2014_italian$q0304) <- "I took this language at Elon"
label(Fall_2014_italian$q0305) <- "I took this language at another college or university"
label(Fall_2014_italian$q0306) <- "I learned this language at an Elon Study Abroad Location"
label(Fall_2014_italian$q0307) <- "I learned this language abroad - Not part of an Elon program"
label(Fall_2014_italian$q0308) <- "I learned this language by speaking it with my family at home"
label(Fall_2014_italian$q0309) <- "I learned this language by using computer software or a website (Rosetta Stone, LiveMocha, etc.)."
# Question 5 labels
label(Fall_2014_italian$q0501) <- "To fulfill the university's graduation requirement."
label(Fall_2014_italian$q0502) <- "To fulfill major requirements (not majoring in this language)."
label(Fall_2014_italian$q0503) <- "To earn credits towards a Language Studies major or minor."
label(Fall_2014_italian$q0504) <- "I had a positive experience in my last course in this language."
label(Fall_2014_italian$q0505) <- "I knew I would like the way this professor teaches. "  
label(Fall_2014_italian$q0506) <- "To learn the language. "
label(Fall_2014_italian$q0507) <- "To learn about the culture."
label(Fall_2014_italian$q0508) <- "To increase my confidence and proficiency in this language."
label(Fall_2014_italian$q0509) <- "I enjoy being in a class with other students interested in this language."
label(Fall_2014_italian$q0510) <- "I want to get an internship where I use this language. "
label(Fall_2014_italian$q0511) <- "I want to use this language professionally and/or for graduate school. "
label(Fall_2014_italian$q0512) <- "I believe speaking this language will make me more competitive on the job market."
label(Fall_2014_italian$q0513) <- "To prepare for study abroad."
label(Fall_2014_italian$q0514) <- "Learning this language is highly enjoyable for me."
label(Fall_2014_italian$q0515) <- "I want to connect with the people in the country/countries where this language is spoken."
label(Fall_2014_italian$q0516) <- "I plan to travel to countries that speak this language for vacation/leisure."
label(Fall_2014_italian$q0517) <- "To speak to my relatives who speak this language."
label(Fall_2014_italian$q0518) <- "I have family heritage."
# Question 8 labels 
label(Fall_2014_italian$q0801) <- "To fulfill the university's graduation requirement"
label(Fall_2014_italian$q0802) <- "To fulfill major requirements (not majoring in this language)."
label(Fall_2014_italian$q0803) <- "To earn credits towards a Language Studies major or minor."
