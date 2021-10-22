# Library
library(readr)
library(dplyr)
library(stringr)
library(ggplot2)

# dataset
books <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

# viewdataset
glimpse(books)
View(books)
summary(books)

books %>% select(-Book_title , -Description) %>% summary()

#1
books %>% select(Book_title,Price) %>% filter((Price) < 15)
#2
books %>% select(Book_title,Rating,Price) %>% arrange((Rating)) %>% head(n = 3L)
#3
books %>% group_by(Type) %>% count()
#4
books %>% select(Book_title,Reviews) %>% arrange(desc(Reviews)) %>% head(n = 5L)
#5
books %>% filter(Rating >= 3.45 ,Rating <= 4.72,Rating > mean(Rating) , Type == 'Kindle Edition') %>% select(!Description)
#6
books %>% select(Book_title,Reviews,Rating) %>% filter(Reviews > mean(books$Reviews) & books$Rating > mean(books$Rating))



# Set data
total_types <- table(books$Type)
#Create graph
barplot(total_types)
barplot(total_types,main = "Total of Types", xlab = "count Type", ylab = "Type of Book",)



graph2 <- books %>% filter(Rating<=5) %>% ggplot(aes(x=Rating,y=Price))+ geom_point() +
  geom_point(aes(color=Type))+ ggtitle("relation between Rating and Price") + geom_smooth() 
graph2





