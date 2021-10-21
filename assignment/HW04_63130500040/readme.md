# R-Individual Assignment
Create by Tripuwarej Paweenasombat, ID:63130500040

## Dataset
Top 270 Computer Science / Programing Books (Data from Thomas Konstantin, [Kaggle](https://www.kaggle.com/thomaskonstantin/top-270-rated-computer-science-programing-books)) >> [Using CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv)

## Outlines
1. Explore the dataset
2. Learning function from Tidyverse
3. Transform data with dplyr and finding insight the data
4. Visualization with GGplot2 <br />


# 1. Explore the dataset <br />
```
# Library
library(dplyr)
library(stringr)
library(readr)
library(ggplot2)

# dataset
book <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

# viewdataset
glimpse(book)
```
__output__
```
Rows: 271
Columns: 7
$ Rating          <dbl> 4.17, 4.01, 3.33, 3.97, 4.06, 3.84, 4.09, 4.15, 3.87, 4.62, 4.03~
$ Reviews         <dbl> 3829, 1406, 0, 1658, 1325, 117, 5938, 1817, 2093, 0, 160, 481, 3~
$ Book_title      <chr> "The Elements of Style", "The Information: A History, a Theory, ~
$ Description     <chr> "This style manual offers practical advice on improving writing ~
$ Number_Of_Pages <dbl> 105, 527, 50, 393, 305, 288, 256, 368, 259, 128, 352, 352, 200, ~
$ Type            <chr> "Hardcover", "Hardcover", "Kindle Edition", "Hardcover", "Kindle~
$ Price           <dbl> 9.323529, 11.000000, 11.267647, 12.873529, 13.164706, 14.188235,~
```

## Resources
### Important Files in Repository
- Original Dataset : [prog_book.csv](https://github.com/sit-2021-int214/014-Webtoon-Comics/blob/main/assignment/HW04_63130500040/prog_book.csv) 
