# R-Individual Assignment 4
Create by Tripuwarej Paweenasombat, ID:63130500040

## Dataset
__Top 270 Computer Science / Programing Books__ (Data from Thomas Konstantin, [Kaggle](https://www.kaggle.com/thomaskonstantin/top-270-rated-computer-science-programing-books)) >> [Using CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv)

  (This dataset is high rated book information in the field of computer science and programing.)


### Outlines
1. Explore the dataset
2. Learning function from Tidyverse
3. Transform data with dplyr and finding insight the data
4. Visualization with GGplot2 <br />


## Part 1 : Explore the dataset
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
__Result__
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

### Context
> This dataset holds a list of 270 books in the field of computer science and programming related topics.
The list of books was constructed using many popular websites which provide information on book ratings an of all the book in those websites the 270 most popular were selected.

### Content
> Inside that dataset, you will find general information about the book including the number of pages in the book, the book types, the book descriptions, and the book prices. There are 270 rows and 7 columns in this dataset
 
 
| No | columns | type | explanation |
| :---- | :---- | :---- | :---- |
| 1 | Rating | numeric | แสดงข้อมูลว่าผู้ใช้ให้คะแนนหนังสือเท่าไหร่ คะแนนเรตติ้งอยู่ระหว่าง 0 ถึง 5 |
| 2 | Reviews | numeric | แสดงจำนวนบทวิจารณ์ที่พบในหนังสือเล่มนี้ |
| 3 | Book_title | character | ชื่อหนังสือ |
| 4 | Description | character | คำอธิบายสั้น ๆ ของหนังสือ |
| 5 | Number_Of_Pages | numeric | แสดงจำนวนหน้าในหนังสือแต่ละเล่ม |
| 6 | Type | character | แสดงประเภทของหนังสือ เช่น หนังสือปกแข็ง หรือ ebook หรือ Kindle book เป็นต้น |
| 7 | Price | numeric | แสดงราคาเฉลี่ยของหนังสือในสกุลเงิน USD ซึ่งค่าเฉลี่ยคำนวณตามแหล่งที่มาของเว็บทั้ง 5 แห่ง |
 
 
## Part 2 : Learning function from Tidyverse
Tidyverse คือ การรวบรวม collection R packages โดยมี package สำหรับการทำ data science แบบครบวงจร ตั้งแต่การ import data, tidy data, data manipulation ไปจนถึง visualization
 
 
 
## Resources 
### Important Files in Repository
- Original Dataset : [prog_book.csv](https://github.com/sit-2021-int214/014-Webtoon-Comics/blob/main/assignment/HW04_63130500040/prog_book.csv) 
