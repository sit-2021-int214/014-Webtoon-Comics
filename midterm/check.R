
#library
library(dplyr)
library(stringr)
library(assertive)
library(readr)

#dataset
webToon <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/014-Webtoon-Comics/main/Webtoon_clean.csv")
View(webToon)


#ดูโครงสร้างของ dataset webToon
glimpse(webToon)
#Rows: 569
#Columns: 10
#$ id           <int> 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 1~
#  $ Name         <chr> "Let's Play", "True Beauty", "Midnight Poppy Land", "Age Matters", ~
#  $ Writer       <chr> "Leeanne M. Krecic (Mongie)", "Yaongyi", "Lilydusk", "Enjelicious",~
#  $ Likes        <chr> "30600000", "39900000", "10400000", "25900000", "9900000", "1890000~
#$ Genre        <chr> "Romance", "Romance", "Romance", "Romance", "Supernatural", "Fantas~
#  $ Rating       <dbl> 9.62, 9.60, 9.81, 9.79, 9.85, 9.82, 9.66, 9.87, 9.82, 9.78, 9.70, 9~
#  $ Subscribers  <int> 4200000, 6400000, 2100000, 3500000, 1500000, 3000000, 649000, 53760~
#  $ Summary      <chr> "She's young, single and about to achieve her dream of creating inc~
#$ Update       <chr> "UP EVERY TUESDAY", "UP EVERY WEDNESDAY", "UP EVERY SATURDAY", "UP ~
#  $ Reading.Link <chr> "https://www.webtoons.com/en/romance/letsplay/list?title_no=1218", ~
 


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





