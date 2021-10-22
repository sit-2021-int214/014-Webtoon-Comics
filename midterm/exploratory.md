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
1. การ์ตูนเรื่องที่มียอดไลค์มากที่สุดและน้อยที่สุด 
2. การ์ตูนเรื่องที่มียอด Subscriber มากที่สุดและน้อยที่สุด 
3. จำนวนการ์ตูนทั้งหมดของแต่ละหมวดหมู่ โดยเรียงจากหมวดหมู่ที่มีจำนวนการ์ตูนมากไปน้อย
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

## 1. การ์ตูนเรื่องที่มียอดไลค์มากที่สุดและน้อยที่สุด 

เปลี่ยน Webtoon$Likes จาก character เป็น numberic และเช็คว่าเปลี่ยนเป็น numberic แล้ว

```
webToon$Likes <- as.numeric(webToon$Likes)
is.numeric(webToon$Likes)
```

หาการ์ตูนเรื่องที่มียอดไลค์มากที่สุดและน้อยที่สุด 
```
#Max
webToon %>% select(Name,Likes,Genre) %>% filter(Likes == max(Likes))

#Min
webToon %>% select(Name,Likes,Genre) %>% filter(Likes == min(Likes))
```

Result :

```
#Max :
                     Name    Likes         Genre
1 My Giant Nerd Boyfriend 50600000 Slice of life
> webToon %>% select(Name,Likes,Genre) %>% filter(Likes == min(Likes))

#Min :
                         Name Likes  Genre
1 Guardians of the Video Game  2434 Sci-fi
2                  Ghost Bats  2434 Sci-fi

```
##### Summary :
- `การ์ตูนที่มียอดกด Like มากที่สุดคือ My Giant Nerd Boyfriend โดยมียอดไลค์ที่ 50,600,000 `
- ` มีการ์ตูน 2 ที่มียอดไลค์น้อยที่สุดคือ Guardians of the Video Game และ Ghost Bats โดยมียอดไลค์ที่ 2434 `

<br>

## 2. การ์ตูนเรื่องที่มียอด Subscriber มากที่สุดและน้อยที่สุด 

```
#Max
webToon %>% select(id,Name,Subscribers) %>% filter(Subscribers == max(Subscribers,na.rm = TRUE))

#Min
webToon %>% select(id,Name,Subscribers) %>% filter(Subscribers == min(Subscribers,na.rm = TRUE))
```

Result :

```   
#Max
   id                 Name Subscribers
1 214 Everywhere & Nowhere     7506000

#Min
   id   Name Subscribers
1 400 Epic V        5400
```

##### Summary :
- การ์ตูนที่มียอดกด subscibe มากที่สุดคือ `Everywhere & Nowhere` โดยมียอด subscibe ที่ `7,506,000`
- การ์ตูนที่มียอดกด subscibe น้อยที่สุดคือ `Epic V` โดยมียอด subscibe ที่ `5,400`

<br>

## 3. จำนวนการ์ตูนทั้งหมดของแต่ละหมวดหมู่ โดยเรียงจากหมวดหมู่ที่มีจำนวนการ์ตูนมากไปน้อย

```
webToon %>% group_by(Genre) %>% count() %>% rename(Total = n) %>% arrange(desc(Total))
```

Result :

```           
   Genre         Total
   <chr>         <int>
 1 Fantasy          95
 2 Romance          90
 3 Drama            60
 4 Comedy           52
 5 Slice of life    49
 6 Action           47
 7 Thriller         35
 8 Supernatural     33
 9 Sci-fi           32
10 Superhero        26
11 Horror           20
12 Sports           10
13 Mystery           9
14 Informative       5
15 Historical        4
16 Heartwarming      2
```
##### Summary :
- `มีการ์ตูนทั้งหมด 16 หมวด` โดยมีการ์ตูนหมวด Fantasy มากที่สุดที่ 95 เรื่อง และการ์ตูนหมวด Fantasy น้อยที่สุดที่ 2 เรื่อง


<br>

## 4. การ์ตูนเรื่องที่อัปเดตครบทุกตอนแล้วและมี rating มากกว่า 9.50

```
webToon %>% select(id,Name,Genre,Rating) %>%filter(webToon$Update == "COMPLETED", webToon$Rating>9.50, na.rm = TRUE)
```

Result :

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

##### Summary :
- `มีการ์ตูนเรื่องที่อัปเดตครบทุกตอนแล้วและมี rating มากกว่า 9.50 ทั้งหมด 129 เรื่อง`

<br>

## 5. ผู้แต่ง Taejun Pak เขียนการ์ตูนเรื่องไหนบ้าง

```
webToon %>% select(Name,Writer,Likes,Genre,Rating) %>%filter(webToon$Writer == "Seokwoo", na.rm = TRUE)
```

Result :

```
              Name  Writer   Likes   Genre Rating
1   She's Hopeless Seokwoo  669600   Drama   9.66
2     Days of Hana Seokwoo 1000000   Drama   9.77
3 ORANGE MARMALADE Seokwoo  987300 Romance   9.68
```   
##### Summary :
- `ผู้แต่ง Taejun Pak ได้เขียนการ์ตูนทั้งหมด 3 เรื่อง ได้แก่ She's Hopeless , Days of Hana และ ORANGE MARMALADE `
