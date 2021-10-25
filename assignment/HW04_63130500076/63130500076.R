#Part1 --------------------------------------------------
# Library
library(dplyr)
library(stringr)
library(readr)
library(ggplot2)

# dataset
book <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

# viewdataset
glimpse(book)
summary(book)


#Part2 --------------------------------------------------
books %>% select(-Rating)


#Part3 --------------------------------------------------
# 1.
book %>% select(Book_title,Number_Of_Pages) %>% arrange(desc(Number_Of_Pages)) %>% head(n = 3L)

# 2.
book %>% select(Book_title,Number_Of_Pages) %>% arrange(Number_Of_Pages) %>% head(n = 7L)

# 3.
book %>% select(Book_title,Rating) %>% filter(book$Rating == max(Rating))

# 4.
book %>% select(Book_title,Type,Reviews) %>% arrange(desc(Reviews)) %>% head(n = 1L)

# 5.
book %>% filter(Rating > 4) %>% select(Book_title)

# 6.
table(book$Type)


#Part4 --------------------------------------------------
# 1.
pg <- book %>% ggplot(aes(x=Price, y=Number_Of_Pages)) + geom_point(aes(color=Type)) + ggtitle("Price and Number of pages relationship")
pg

# 2.
gg<- ggplot(book,aes(x=Type)) + geom_bar()
gg
gg + ggtitle("Relation between the number of book in each type") + xlab("Type") + ylab("number of book")
