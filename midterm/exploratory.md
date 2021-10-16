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
4. การ์ตูนเรื่องที่อัปเดตครบทุกตอนแล้วและมี rating มากกว่า 9.50
5. ผู้แต่ง Seokwoo เขียนการ์ตูนเรื่องไหนบ้าง


## Step 0 Loading library and dataset

```
#library
library(dplyr)
library(tidyr)

#dataset
webToon <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/014-Webtoon-Comics/main/Webtoon%20Dataset%20-%20Webtoon%20Dataset.csv")
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
maxSubscribers <- webToon %>% filter(Subscribers == max(Subscribers,na.rm = TRUE))
maxSubscribers %>% summarise(id,Name,Subscribers) #ให้แสดงแค่ id,name และ subscribers ของการ์ตูนเรื่องนั้น 
```

Result

```   
   id                 Name Subscribers
1 214 Everywhere & Nowhere     7506000
```


## 3. จำนวนการ์ตูนทั้งหมดของแต่ละหมวดหมู่

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


## 4. การ์ตูนเรื่องที่อัปเดตครบทุกตอนแล้วและมี rating มากกว่า 9.50

Explain here

```
completed9.5cartoons <- webToon %>% filter(webToon$Update == "COMPLETED", webToon$Rating>9.50, na.rm = TRUE)
completed9.5cartoons %>% summarise(Name,Genre,Rating) #กำหนดให้แสดงผลลัพธ์แค่ชื่อ หมวดหมู่ และ rating ของการ์ตุน
```

Result

```           
                               Name         Genre Rating
1                       The Horizon         Drama   9.84
2                My Life as a Loser         Drama   9.77
3                   Her Bucket List       Romance   9.72
4                       Dark Mortal         Drama   9.79
5                           Bastard      Thriller   9.87
6            A Good Day to be a Dog       Romance   9.84
7                           SAVE ME         Drama   9.87
8                       Your Letter         Drama   9.93
9                      Days of Hana         Drama   9.77
10              Where Tangents Meet       Romance   9.74
11        My Dear Cold-Blooded King       Romance   9.72
12                     Death's Game         Drama   9.75
13              Girls of the Wild's        Action   9.57
14                    Gourmet Hound         Drama   9.82
15                           Dear X      Thriller   9.56
16                   House of Stars       Fantasy   9.80
17                         Oh! Holy       Romance   9.70
18                           My Boo  Supernatural   9.75
19               Cheese in the Trap         Drama   9.71
20                  Yuna & Kawachan         Drama   9.73
21                Scorching Romance       Romance   9.70
22                            Hooky       Fantasy   9.80
23                 Taste of Illness         Drama   9.84
24                     Winter Woods         Drama   9.81
25                      ShootAround         Drama   9.68
26                   Annarasumanara         Drama   9.74
27                     Yumi's Cells Slice of life   9.77
28  The Strange Tales of Oscar Zahn       Fantasy   9.78
29                    Ghost Theater         Drama   9.78
30               American Road Trip         Drama   9.61
31                     Salty Studio       Romance   9.69
32   The Stories of Those Around Me       Romance   9.66
33               Kids Are All Right         Drama   9.74
34                   Spirit Fingers         Drama   9.91
35                      God of Bath        Comedy   9.51
36               WEBTOON GREENLiGHT       Fantasy   9.61
37                  Under the Aegis       Fantasy   9.76
38                      About Death         Drama   9.83
39            The Weight of Our Sky    Historical   9.79
40                          Aisopos         Drama   9.72
41                          Gepetto        Sci-fi   9.78
42                       FAMILY MAN         Drama   9.71
43              New Normal: Class 8         Drama   9.52
44                 Westwood Vibrato         Drama   9.66
45         The World Where I Belong  Supernatural   9.59
46        Noblesse: Rai's Adventure        Action   9.83
47                     Super Secret       Romance   9.83
48                    Mosquito Wars        Sci-fi   9.62
49                 ORANGE MARMALADE       Romance   9.68
50       The Wolf & Red Riding Hood        Comedy   9.63
51                             GOSU        Action   9.85
52                   Siren's Lament       Romance   9.75
53                         Noblesse        Action   9.77
54                  Rise from Ashes  Supernatural   9.70
55                           Crumbs       Romance   9.69
56                     Aerial Magic       Fantasy   9.68
57             For the Sake of Sita       Romance   9.53
58                        Catharsis       Fantasy   9.56
59                           Newman       Fantasy   9.73
60               Refund High School       Fantasy   9.76
61         The Steam Dragon Express       Fantasy   9.64
62                             Flow       Fantasy   9.76
63                          Hellper       Fantasy   9.73
64                            LESSA        Action   9.73
65     LESSA 2 - The Crimson Knight        Action   9.79
66                      SOUL CARTEL       Fantasy   9.70
67    Ghosts Among the Wild Flowers       Fantasy   9.60
68                         Magician       Fantasy   9.68
69                     Toaster Dude        Comedy   9.77
70                             AXED        Comedy   9.64
71          My Daughter is a Zombie        Comedy   9.66
72                         UndeadEd  Supernatural   9.69
73         Saphie: The One-Eyed Cat Slice of life   9.80
74                         Meow Man        Comedy   9.70
75                 My Name is Benny Slice of life   9.73
76               Waffles & Pancakes Slice of life   9.61
77                  A Budgie's Life Slice of life   9.79
78                        HAPI BUNI        Comedy   9.52
79              Cat Loaf Adventures Slice of life   9.58
80                      How to Love Slice of life   9.51
81                         Moon You        Sci-fi   9.71
82            Apocalyptic Horseplay  Supernatural   9.72
83   I Don't Want This Kind of Hero     Superhero   9.74
84            National Dog Day 2016 Slice of life   9.55
85          The Sound of Your Heart        Comedy   9.56
86                       Trash Bird        Comedy   9.54
87                Skate!!! Fire 100        Sports   9.62
88                      Lunarbaboon Slice of life   9.66
89                        Nano List        Sci-fi   9.81
90                   Sword Interval  Supernatural   9.63
91                      Jackie Rose  Supernatural   9.60
92                      Small World Slice of life   9.53
93                     Kind of Love       Romance   9.64
94                      Smile Brush Slice of life   9.57
95                   Just for Kicks Slice of life   9.62
96     Smile Brush: My Old Pictures Slice of life   9.69
97             My Kitty and Old Dog Slice of life   9.66
98                Cooking Comically   Informative   9.63
99              Roar Street Journal Slice of life   9.65
100          All That We Hope to Be Slice of life   9.51
101                Freaking Romance       Romance   9.77
102                      Ghost Wife       Romance   9.73
103                    Always Human       Romance   9.54
104                  Devil Number 4  Supernatural   9.78
105                         Eggnoid        Sci-fi   9.65
106                     unTouchable       Romance   9.69
107               Love Doesn't Talk       Romance   9.59
108      Miss Abbott and the Doctor       Romance   9.81
109                  The Fever King     Superhero   9.57
110               Duty After School        Sci-fi   9.67
111                  Unknown Caller      Thriller   9.55
112                      Sweet Home      Thriller   9.85
113                           Grasp      Thriller   9.55
114                Forest of Humans      Thriller   9.57
115                          PIGPEN      Thriller   9.74
116                          Shriek      Thriller   9.75
117              Horang's Nightmare        Horror   9.58
118               Melvina's Therapy        Horror   9.72
119                         Chiller      Thriller   9.60
120                          Rotten      Thriller   9.68
121                        Delusion      Thriller   9.79
122                      Rot & Ruin        Horror   9.61
123                           Elena        Horror   9.52
124                    Ghost Teller        Horror   9.86
125                       DEAD DAYS        Horror   9.67
126                            HIVE      Thriller   9.66
127                          S.I.D.  Supernatural   9.69
128                       Wolfsbane        Horror   9.68
129        Staying Healthy Together   Informative   9.76
```

## 5. ผู้แต่ง Taejun Pak เขียนการ์ตูนเรื่องไหนบ้าง

Explain here

```
Seokwoo_writer <- webToon %>% filter(webToon$Writer == "Seokwoo", na.rm = TRUE)
Seokwoo_writer %>% summarise(Name,Writer,Likes,Genre,Rating)
```

Result

```
              Name  Writer   Likes   Genre Rating
1   She's Hopeless Seokwoo  669600   Drama   9.66
2     Days of Hana Seokwoo 1000000   Drama   9.77
3 ORANGE MARMALADE Seokwoo  987300 Romance   9.68
```   

