# Webtoon Dataset

Dataset from [webtoon_clean.csv] (https://github.com/sit-2021-int214/014-Webtoon-Comics/blob/main/Webtoon%20Dataset%20-%20Webtoon%20Dataset.csv)


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
