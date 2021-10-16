
#library
library(dplyr)
library(stringr)
library(assertive)
library(readr)

#dataset
webToon <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/014-Webtoon-Comics/main/Webtoon_clean.csv")
View(webToon)



glimpse(webToon)


#Check Type

is.numeric(webToon$id) #TRUE
assert_is_numeric(webToon$id) 

is.character(webToon$Name) #TRUE
assert_is_character(webToon$Name) 


is.character(webToon$Writer) #TRUE
assert_is_character(webToon$Writer)

is.numeric(webToon$Likes) #FALSE
assert_is_numeric(webToon$Likes) 

is.character(webToon$Genre) #TRUE
assert_is_character(webToon$Genre)

is.numeric(webToon$Rating) #TRUE
assert_is_numeric(webToon$Rating) 

is.numeric(webToon$Subscribers) #TRUE
assert_is_numeric(webToon$Subscribers)

is.numeric(webToon$Summary) #TRUE
assert_is_character(webToon$Summary)

is.character(webToon$Update) #TRUE
assert_is_character(webToon$Update)

is.character(webToon$Reading.Link) #TRUE
assert_is_character(webToon$Reading.Link) 





