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
1.นิยายเรื่องที่มียอดไลค์มากที่สุด 
2.นิยายเรื่องที่มียอด Subscriber มากที่สุด 
3.หมวดหมู่ของนิยาย 
4.นิยายเรื่องที่อัปเดตทุกวันจันทร์ 
5.ผู้แต่ง Taejun Pak เขียนเรื่องไหนบ้าง


## Step 0 Loading library and dataset

```
#library
library(dplyr)
library(tidyr)

#dataset
webToon <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/014-Webtoon-Comics/main/Webtoon%20Dataset%20-%20Webtoon%20Dataset.csv")
```

## 1.นิยายเรื่องที่มียอดไลค์มากที่สุด 

Explain here

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
