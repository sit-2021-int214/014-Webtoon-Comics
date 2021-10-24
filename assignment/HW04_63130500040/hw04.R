#Part1 --------------------------------------------------
# Library
library(dplyr)
library(stringr)
library(readr)
library(ggplot2)

# dataset
book <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

# view dataset
glimpse(book)
View(book)


#Part2 --------------------------------------------------
install.packages("tidyverse")
library(tidyverse)

as_tibble(book)


#Part3 --------------------------------------------------
# 1.
meanPage <- book$Number_Of_Pages %>% mean()
meanPage

book %>% select(Book_title, Number_Of_Pages) %>% filter(book$Number_Of_Pages > 1000)


# 2.
meanPrice <- book$Price %>% mean
meanPrice

book %>% select(Book_title, Number_Of_Pages, Price) %>% filter(book$Price > meanPrice)


# 3.
book %>% group_by(Type) %>% count()


# 4.
#Max
book %>% select(-Reviews, -Description) %>%filter(book$Price == max(Price))
#Min
book %>% select(-Reviews, -Description) %>%filter(book$Price == min(Price))


# 5.
book %>% select(Book_title, Reviews) %>% arrange(desc(Reviews)) %>% head(n = 5L)


# 6.
book %>% select(Book_title, Number_Of_Pages) %>% filter(between(Number_Of_Pages,100,200)) 



#Part4 --------------------------------------------------
#1) The graph depicts the number of books available in each price level.
numPrice_plot <- ggplot(book,aes(x=Price))+ geom_histogram(binwidth = 10) + ggtitle("Number of books available in each price level.") 
numPrice_plot


#2)  The graph depicting the price-to-rating relationship.
rp_plot <- book %>% ggplot(aes(x=Price, y=Rating)) + geom_point(aes(color=Type)) + ggtitle("Price-to-Rating relationship")+ geom_smooth(method = "lm")
rp_plot 


