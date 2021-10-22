#Part1 ------------------------------------------------------------
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

is.na(books) %>% table()


#Part2 -------------------------------------------------------------

books %>% filter(Reviews > 2000)
books %>% select(Book_title,Type)
books %>% arrange(Rating)

#Part3 ------------------------------------------------------------

#3.1
books %>% select(Rating,Book_title) %>% filter(books$Type == "ebook") %>% arrange(desc(Rating))

#3.2
books %>% select(Book_title,Price) %>% filter(between(Price,10,20))

#3.3
books %>% group_by(Type) %>% count() %>% rename(Total = n)

#3.4
books %>% select(Book_title,Reviews) %>% arrange(desc(books$Reviews)) %>% head(n = 10L)

#3.5
books %>% select(Book_title,Rating) %>%filter(books$Rating == max(Rating))
books %>% select(Book_title,Rating) %>%filter(books$Rating == min(Rating))

#3.6
mean(books$Rating)
books %>% select(Book_title,Rating,Number_Of_Pages) %>%filter(books$Rating > mean(Rating),books$Number_Of_Pages > 500)


#Part4 -------------------------------------------------------------------
#4.1
rating_review_plot <- ggplot(books,aes(x=Rating,y=Reviews)) + geom_point()
rating_review_plot + ggtitle("Relation between Rating and Reviews") + geom_point(aes(color = books$Type))

#4.2
counts <- table(books$Type)
barplot(counts, main="Number of book in each type", 
        xlab="Type of book",ylab = "Number of book",col = ifelse(counts==max(counts),"red","green"))





