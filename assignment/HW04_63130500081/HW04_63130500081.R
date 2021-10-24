# Library
library(assertive)
library(readr)
library(dplyr)
library(stringr)
library(tidyr)
library(ggplot2)

# Dataset
studentBook <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")
View(studentBook)
glimpse(studentBook)

#1
studentBook %>% filter(Rating >= 4,Rating < 5) %>% select(Rating,Book_title) %>% arrange(Book_title) %>% slice_head(n=5)

#2
studentBook %>% select(Book_title, Price) %>% filter(studentBook$Price>40 , studentBook$Type =='ebook')

#3
studentBook %>% select(Book_title, Type, Rating) %>% filter(studentBook == max(studentBook$Rating))

#4
maxPrice <- max(studentBook$Price)
minPrice <- min(studentBook$Price)

studentBook %>% select(Price) %>% filter(studentBook$Price == maxPrice) 
studentBook %>% select(Price) %>% filter(studentBook$Price == minPrice)

max(studentBook$Price) - min(studentBook$Price)

#5
studentBook %>% select(Type) %>% unnest(Type) %>% count(Type) %>% rename(Total = n)%>% rename(TypeOfBook = Type)

#6
studentBook %>% select(Book_title,Reviews,Number_Of_Pages) %>% filter(studentBook$Number_Of_Pages<200) %>% arrange(desc(Reviews)) %>% head(n=10)

graphBook <- studentBook %>% ggplot(aes(x=Rating)) + geom_bar() + ggtitle("Total of Rating") + xlab("Rating") + ylab("count of Rating")
graphBook

graphBook2 <- studentBook %>% ggplot(aes(x=Type,y=Price)) +geom_jitter(aes(colour=Type))+ ggtitle("relation Type and Price")
graphBook2
  

