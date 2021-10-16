# Webtoon Dataset

Dataset from : [webtoon_clean.csv](https://github.com/sit-2021-int214/014-Webtoon-Comics/blob/main/Webtoon_clean.csv)


### My Step
1. Define a question
2. Search datasets from Kaggle
3. Download Library and dataset
4. Explore the dataset from the original dataset
5. Cleaning Dataset
6. Exploratory Data Analysis


## Define a question
1. การ์ตูนเรื่องที่มียอดไลค์มากที่สุด 
2. การ์ตูนเรื่องที่มียอด Subscriber มากที่สุด 
3. จำนวนการ์ตูนทั้งหมดของแต่ละหมวดหมู่
4. การ์ตูนเรื่องที่อัปเดตครบทุกตอนแล้ว
5. ผู้แต่ง Taejun Pak เขียนการ์ตูนเรื่องไหนบ้าง


## Step 0 Loading library and dataset

```
#library
library(dplyr)
library(tidyr)

#dataset
webToon <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/014-Webtoon-Comics/main/Webtoon%20Dataset%20-%20Webtoon%20Dataset.csv")
```

## 1.การ์ตูนเรื่องที่มียอดไลค์มากที่สุด 

Explain here

เปลี่ยน Webtoon$Likes จาก character เป็น numberic และเช็คว่าเปลี่ยนเป็น numberic แล้ว

```
webToon$Likes <- as.numeric(webToon$Likes)
is.numeric(webToon$Likes)
```

หาการ์ตูนเรื่องที่มียอดไลค์มากที่สุด 
```
webToon %>% filter(Likes == max(Likes,na.rm = TRUE))
```

Result

```
 id                    Name   Writer    Likes         Genre Rating Subscribers
1 327 My Giant Nerd Boyfriend fishball 50600000 Slice of life   9.73     2100000
                                                                                                                                                                                                                                           Summary
1 Having a boyfriend who's a full foot taller than you might seem adorable at first, but it usually just ends up causing a whole bunch of minor inconveniences. Follow Fishball as she navigates the Malaysian life with her 6'5" geeky boyfriend.
                  Update                                                                        Reading.Link
1 UP EVERY MON, WED, FRI https://www.webtoons.com/en/slice-of-life/my-giant-nerd-boyfriend/list?title_no=958

```


## 3.จำนวนการ์ตูนทั้งหมดของแต่ละหมวดหมู่

Explain here

```
comicGenre <- data.frame(table(webToon$Genre)) #สร้าง dataframe เพื่อเเยกข้อมูลเเละรู้จำนวนของเเต่ละ Type
comicGenre  <- comicGenre %>% rename(Genre=Var1) #rename Type
comicGenre  <- comicGenre %>% rename(Amount=Freq) #rename Type
comicGenre %>% summarise(comicGenre)
```

Result

```           
           Genre Amount
1         Action     47
2         Comedy     52
3          Drama     60
4        Fantasy     95
5   Heartwarming      2
6     Historical      4
7         Horror     20
8    Informative      5
9        Mystery      9
10       Romance     90
11        Sci-fi     32
12 Slice of life     49
13        Sports     10
14     Superhero     26
15  Supernatural     33
16      Thriller     35
```
