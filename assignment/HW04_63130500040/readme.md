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
summary(book)

```
##### Result :
```
> glimpse(book)
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
```
> summary(book)
     Rating         Reviews        Book_title       
 Min.   :3.000   Min.   :   0.0   Length:271        
 1st Qu.:3.915   1st Qu.:   5.5   Class :character  
 Median :4.100   Median :  35.0   Mode  :character  
 Mean   :4.067   Mean   : 185.6                     
 3rd Qu.:4.250   3rd Qu.: 116.5                     
 Max.   :5.000   Max.   :5938.0                     
 Description        Number_Of_Pages      Type          
 Length:271         Min.   :  50.0   Length:271        
 Class :character   1st Qu.: 289.0   Class :character  
 Mode  :character   Median : 384.0   Mode  :character  
                    Mean   : 475.1                     
                    3rd Qu.: 572.5                     
                    Max.   :3168.0                     
     Price        
 Min.   :  9.324  
 1st Qu.: 30.751  
 Median : 46.318  
 Mean   : 54.542  
 3rd Qu.: 67.854  
 Max.   :235.650  
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
ตรงนี้บอกเราว่า ข้อมูลเรามี 271 rows (หรือ observations) และ มี 7 columns

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
##### Explain :
- select เลือกให้แสดงข้อมูลเฉพาะ column(Book_title, Number_Of_Pages)
- filter ใส่เงื่อนไขที่จำนวนหน้าต้องมากกว่า 1000 หน้า

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
##### Explain :
- select เลือกให้แสดงข้อมูลเฉพาะ column(Book_title, Number_Of_Pages, Price)
- filter ใส่เงื่อนไขว่าให้แสดงจำนวนหน้าของหนังสือที่มีราคามากกว่าค่าเฉลี่ย


__3. แสดง type ของหนังสือว่ามี type อะไรบ้างและแต่ละ type มีจำนวนเท่าไหร่__

```
book %>% group_by(Type) %>% count()
```
##### Result :
```
  Type                      n
  <chr>                 <int>
1 Boxed Set - Hardcover     1
2 ebook                     7
3 Hardcover                95
4 Kindle Edition           10
5 Paperback               156
6 Unknown Binding           2
```
##### Explain :
- group_by จัดกลุ่มด้วย type แล้วแสดงออกมาว่ามี type อะไรบ้าง
- count ใช้นับว่าแต่ละ type มีหนังสือกี่เล่ม


__4.แสดงหนังสือที่มีราคามากที่สุดและน้อยที่สุด__

```
#Max Price
book %>% select(-Reviews, -Description) %>% filter(book$Price == max(Price))

#Min Price
book %>% select(-Reviews, -Description) %>% filter(book$Price == min(Price))

```
##### Result :
```
# Max Price
  Rating  Book_title             Number_Of_Pages  Type   Price
   <dbl>  <chr>                            <dbl>  <chr>  <dbl>
1   3.84  A Discipline for Soft~             789  Hardc~  236.

# Min Price
Rating    Book_title             Number_Of_Pages  Type     Price
   <dbl>  <chr>                            <dbl>  <chr>    <dbl>
1   4.17  The Elements of Sty~               105  Hardcov~  9.32

```
##### Explain :
* select(-column) คอลัมน์ที่เลือกจะไม่แสดงข้อมูลออกมา และจะแสดงคอลัมน์ที่เหลือแทน
* filter ใส่เงื่อนไขว่าให้แสดงหนังสือที่มีราคามากที่สุดและน้อยที่สุด
  * max(Price) หาค่า Price ที่มากที่สุด
  * min(Price) หาค่า Price ที่น้อยที่สุด



__5. แสดงชื่อเรื่องและจำนวน reviews ของหนังสือที่มีคน reviews มากที่สุด 5 อันดับแรก__

```
book %>% select(Book_title, Reviews) %>% arrange(desc(Reviews)) %>% head(n = 5L)

```
##### Result :
```
 Book_title                                         Reviews
  <chr>                                                <dbl>
1 Start with Why: How Great Leaders Inspire Everyon~    5938
2 The Elements of Style                                 3829
3 The Phoenix Project: A Novel About IT, DevOps, an~    2629
4 The Goal: A Process of Ongoing Improvement            2290
5 Weapons of Math Destruction: How Big Data Increas~    2093
```
##### Explain :
- select เลือกให้แสดงข้อมูลเฉพาะ column(Book_title, Reviews)
- arrange(desc(Reviews)) ให้เรียงลำดับจำนวน review จากมากไปน้อย
- head(n = 5L) เลือกแสดงข้อมูลของ 5 อันดับแรก



__6. แสดงหนังสือที่มีจำนวนหน้าตั้งแต่ 100 ถึง 200 หน้า__

```
book %>% select(Book_title, Number_Of_Pages) %>% filter(between(Number_Of_Pages,100,200)) 

```
##### Result :
```
Book_title                                Number_Of_Pages
   <chr>                                               <dbl>
 1 The Elements of Style                                 105
 2 ZX Spectrum Games Code Club: Twenty fun ~             128
 3 Ship It!                                              200
 4 Debugging: The 9 Indispensable Rules for~             192
 5 What Is Life? with Mind and Matter and A~             184
 6 JavaScript: The Good Parts                            153
 7 The Pattern on the Stone: The Simple Ide~             176
 8 The Connection Machine                                190
 9 Agile Retrospectives: Making Good Teams ~             170
10 Scrum and XP from the Trenches                        140
# ... with 12 more rows
```
##### Explain :
* select เลือกให้แสดงข้อมูลเฉพาะ column(Book_title, Number_Of_Pages)
* filter() ใส่เงื่อนไขที่จะให้ข้อมูลแสดงออกมา 
  * between(Number_Of_Pages,100,200) กำหนดให้ช่วงข้อมูลอยู่ระหว่างหนังสือที่มีจำนวนหน้า 100 ถึง 200 หน้า



___
## Part 4 : Visualization with GGplot2

__1. The graph depicts the number of books available in each price level.__
```
numPrice_plot <- ggplot(book,aes(x=Price))+ geom_histogram(binwidth = 10) + ggtitle("Number of books available in each price level.") 
numPrice_plot
```
##### Result :
![image](https://github.com/sit-2021-int214/014-Webtoon-Comics/blob/main/assignment/HW04_63130500040/g1.png)

##### Explain :
* กราฟนี้แสดงจำนวนหนังสือที่มีในราคาแต่ละช่วง
  * binwidth ใช้ระบุความกว้างของแต่ละช่อง
  * ggtitle ใช้ระบุหัวข้อของกราฟ



__2. The graph depicting the price-to-rating relationship.__
```
rp_plot <- book %>% ggplot(aes(x=Price, y=Rating)) + geom_point(aes(color=Type)) + ggtitle("Price-to-Rating relationship")+ geom_smooth(method = "lm")
rp_plot
```
##### Result :
![image](https://github.com/sit-2021-int214/014-Webtoon-Comics/blob/main/assignment/HW04_63130500040/g2.png)

##### Explain :
* กราฟนี้แสดงความสัมพันธ์ระหว่าง Price กับ Rating 
  * geom_smooth(method = "lm") คือการเติมเส้นเพื่อดู best fit ของข้อมูล 
  * lm ย่อมาจาก linear model

___

## Resources 
### Important Files in Repository
- Original Dataset : [prog_book.csv](https://github.com/sit-2021-int214/014-Webtoon-Comics/blob/main/assignment/HW04_63130500040/prog_book.csv) 
