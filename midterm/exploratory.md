# Webtoon Dataset

Dataset from : [webtoon_clean.csv](https://raw.githubusercontent.com/sit-2021-int214/014-Webtoon-Comics/main/midterm/Webtoon_clean.csv)


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
4. การ์ตูนเรื่องที่อัปเดตครบทุกตอนแล้วและมี rating มากกว่า 9.50
5. ผู้แต่ง Seokwoo เขียนการ์ตูนเรื่องไหนบ้าง


## Step 0 Loading library and dataset

```
#library
library(dplyr)

#dataset
webToon <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/014-Webtoon-Comics/main/midterm/Webtoon_clean.csv")
View(webToon)
```

## 1. การ์ตูนเรื่องที่มียอดไลค์มากที่สุด 

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
## 2. การ์ตูนเรื่องที่มียอด Subscriber มากที่สุด

Explain here

```
webToon %>% select(id,Name,Subscribers) %>% filter(Subscribers == max(Subscribers,na.rm = TRUE))
```

Result

```   
   id                 Name Subscribers
1 214 Everywhere & Nowhere     7506000
```


## 3. จำนวนการ์ตูนทั้งหมดของแต่ละหมวดหมู่

Explain here

```
webToon %>% group_by(Genre) %>% count() %>% rename(Total = n)
```

Result

```           
   Genre         Total
   <chr>         <int>
 1 Action           47
 2 Comedy           52
 3 Drama            60
 4 Fantasy          95
 5 Heartwarming      2
 6 Historical        4
 7 Horror           20
 8 Informative       5
 9 Mystery           9
10 Romance          90
11 Sci-fi           32
12 Slice of life    49
13 Sports           10
14 Superhero        26
15 Supernatural     33
16 Thriller         35
```


## 4. การ์ตูนเรื่องที่อัปเดตครบทุกตอนแล้วและมี rating มากกว่า 9.50

Explain here

```
webToon %>% select(id,Name,Genre,Rating) %>%filter(webToon$Update == "COMPLETED", webToon$Rating>9.50, na.rm = TRUE)
```

Result

```           
     id                            Name         Genre Rating
1    80                     The Horizon         Drama   9.84
2    83              My Life as a Loser         Drama   9.77
3    85                 Her Bucket List       Romance   9.72
4    87                     Dark Mortal         Drama   9.79
5    88                         Bastard      Thriller   9.87
6    90          A Good Day to be a Dog       Romance   9.84
7    91                         SAVE ME         Drama   9.87
8    93                     Your Letter         Drama   9.93
9    95                    Days of Hana         Drama   9.77
10   96             Where Tangents Meet       Romance   9.74
# ... with 119 more rows
```

## 5. ผู้แต่ง Taejun Pak เขียนการ์ตูนเรื่องไหนบ้าง

Explain here

```
webToon %>% select(Name,Writer,Likes,Genre,Rating) %>%filter(webToon$Writer == "Seokwoo", na.rm = TRUE)
```

Result

```
              Name  Writer   Likes   Genre Rating
1   She's Hopeless Seokwoo  669600   Drama   9.66
2     Days of Hana Seokwoo 1000000   Drama   9.77
3 ORANGE MARMALADE Seokwoo  987300 Romance   9.68
```   

