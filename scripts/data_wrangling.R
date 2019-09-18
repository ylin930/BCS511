library(tidyverse)
library(tibble)

df = read.csv("/Users/yinglin/Box/Self/OA_nav/data/passive_OA_YA.csv")
df = as_tibble(df)

# new df with variables of interest
df_new = select(df, -c(ethnic.category, racial.category, handedness, education, prescription.meds, head.injuries, HEAD.0, first.language))

# rename variable
df_new = df_new %>% rename(subject = X)

# subset data separated by older adults and young adults
df_OA = filter(df_new, age>60)
df_YA = filter(df_new, age<60)

# summary 
df_OA %>% summarise(avg_mmse = mean(MMSE, na.rm = TRUE), sd_mmse = sd(MMSE, na.rm = TRUE), 
                    avg_nart = mean(NART, na.rm = TRUE), sd_nart = sd(NART, na.rm = TRUE),
                    avg_age = mean(age, na.rm = TRUE), sd_age = sd(age, na.rm = TRUE)) 
 