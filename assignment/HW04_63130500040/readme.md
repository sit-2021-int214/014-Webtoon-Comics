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
##### Result :
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
 

___
## Part 2 : Learning function from Tidyverse
__Tidyverse__ คือ การรวบรวม collection R packages โดยมี package สำหรับการทำ data science แบบครบวงจร ตั้งแต่การ import data, tidy data, data manipulation ไปจนถึง visualization

##### Example :
```
as_tibble(book)
```
##### Result :
```
# A tibble: 271 x 7
   Rating Reviews Book_title Description Number_Of_Pages Type  Price
    <dbl>   <dbl> <chr>      <chr>                 <dbl> <chr> <dbl>
 1   4.17    3829 The Eleme~ "This styl~             105 Hard~  9.32
 2   4.01    1406 The Infor~ "James Gle~             527 Hard~ 11   
 3   3.33       0 Responsiv~ "In Respon~              50 Kind~ 11.3 
 4   3.97    1658 Ghost in ~ "If they w~             393 Hard~ 12.9 
 5   4.06    1325 How Googl~ "Both Eric~             305 Kind~ 13.2 
 6   3.84     117 The Meme ~ "What is a~             288 Pape~ 14.2 
 7   4.09    5938 Start wit~ "Why do yo~             256 Hard~ 14.2 
 8   4.15    1817 Algorithm~ "A fascina~             368 Hard~ 14.4 
 9   3.87    2093 Weapons o~ "A former ~             259 Hard~ 14.5 
10   4.62       0 ZX Spectr~ "This book~             128 Pape~ 14.6 
# ... with 261 more rows
```
ข้อมูลที่เห็นอยู่ในรูปแบบที่เรียกว่า __tibble data format__ ซึ่งจะโชว์ข้อมูลของแค่ 10 แถวแรกเท่านั้น และจำนวนคอลัมน์ขึ้นอยู่กับความกว้างหน้าจอของเรา บรรทัดบนสุดเราจะเห็นข้อความลักษณะนี้ :
```
# A tibble: 271 x 7
```
ตรงนี้บอกเราว่า ข้อมูลเรามี 271 rows (หรือ observations) และ มี 10 columns

___
## Part 3 : Transform data with dplyr and finding insight the data

__1. ค่าเฉลี่ยของจำนวนหน้าคือเท่าไหร่และ มีเรื่องไหนบ้างที่มีจำนวนหน้าเกิน 1000 หน้า__
```
meanPage <- book$Number_Of_Pages %>% mean()
meanPage

book %>% select(Book_title, Number_Of_Pages) %>% filter(book$Number_Of_Pages > 1000)
```
##### Result :
```
> meanPage
[1] 475.0775

> book %>% select(Book_title, Number_Of_Pages) %>% filter(book$Number_Of_Pages > 1000)
# A tibble: 16 x 2
   Book_title                       Number_Of_Pages
   <chr>                                      <dbl>
 1 Beginning Java 2                            1200
 2 PHP and MySQL Web Development (~            1008
 3 The Linux Programming Interface~            1506
 4 Learning Python                             1214
 5 The C++ Programming Language                1040
 6 Database System Concepts                    1142
 7 Introduction to Algorithms                  1180
 8 Game Engine Architecture                    1052
 9 Geometric Tools for Computer Gr~            1056
10 Modern Operating Systems, 4th E~            1136
11 The C++ Standard Library: A Tut~            1136
12 Artificial Intelligence: A Mode~            1132
13 3D Game Engine Design: A Practi~            1040
14 Numerical Recipes: The Art of S~            1235
15 An Introduction to Database Sys~            1040
16 The Art of Computer Programming~            3168

```

__2. ค่าเฉลี่ยของราคาหนังสือคือเท่าไหร่และเล่มที่มีราคาเกินค่า mean แต่ละเล่มมีกี่หน้า__

```
meanPrice <- book$Price %>% mean
meanPrice

book %>% select(Book_title, Number_Of_Pages, Price) %>% filter(book$Price > meanPrice)

```
##### Result :
```
> meanPrice
[1] 54.54186

> book %>% select(Book_title, Number_Of_Pages, Price) %>% filter(book$Price > meanPrice)
# A tibble: 105 x 3
   Book_title                 Number_Of_Pages Price
   <chr>                                <dbl> <dbl>
 1 Effective Programming: Mo~             283  54.7
 2 Building Microservices: D~             262  54.9
 3 Exceptional C++: 47 Engin~             208  56.1
 4 Reviewing Java                         658  56.6
 5 Microsoft Visual C# Step ~             816  56.6
 6 Refactoring: Improving th~             431  57.2
 7 Growing Object-Oriented S~             345  57.2
 8 Modern C++ Design: Generi~             360  58.4
 9 Structure and Interpretat~             657  58.9
10 Structure and Interpretat~             657  58.9
# ... with 95 more rows
```

__3. ค่าเฉลี่ยของราคาหนังสือคือเท่าไหร่และเล่มที่มีราคาเกินค่า mean แต่ละเล่มมีกี่หน้า__

```

```
##### Result :
```

```

__4. ค่าเฉลี่ยของราคาหนังสือคือเท่าไหร่และเล่มที่มีราคาเกินค่า mean แต่ละเล่มมีกี่หน้า__

```


```
##### Result :
```

```

__5. ค่าเฉลี่ยของราคาหนังสือคือเท่าไหร่และเล่มที่มีราคาเกินค่า mean แต่ละเล่มมีกี่หน้า__

```


```
##### Result :
```

```

__6. ค่าเฉลี่ยของราคาหนังสือคือเท่าไหร่และเล่มที่มีราคาเกินค่า mean แต่ละเล่มมีกี่หน้า__

```


```
##### Result :
```

```

___
## Part 4 : Visualization with GGplot2






## Resources 
### Important Files in Repository
- Original Dataset : [prog_book.csv](https://github.com/sit-2021-int214/014-Webtoon-Comics/blob/main/assignment/HW04_63130500040/prog_book.csv) 
