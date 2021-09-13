library(dplyr)
library(readr)
library(stringr)
library(assertive)


sat_score <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/SAT_original.csv")
glimpse(sat_score)
write_csv(sat_score,file = "SAT_clean.csv")

sat_score %>% str()

#---------------------

sat_score$math_score <- sat_score$math_score %>% str_remove("s") %>% str_trim() %>% str_remove(",") %>% as.numeric()
glimpse(sat_score)

