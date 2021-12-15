webToon <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/014-Webtoon-Comics/main/midterm/Webtoon_clean.csv")
View(webToon)

library(dplyr)
library(readr)
library(stringr)
library(assertive)


#การ์ตูนประเภท Romance ใน webtoon มี rating มากกว่า 9.5

romanceCartoon <- webToon %>% select(Rating) %>% filter(webToon$Genre == "Romance") 
romanceCartoon

# Step 0 : Assign variables --------------------------
#mean = 9.544778
#sd =  0.3439272
#z = 1.235143
#pvalue = 0.4070488
#zalpha = -1.644854

n = 90
mean <- mean(romanceCartoon$Rating,na.rm = T)
mue0  <- 9.5
sd <- sd(romanceCartoon$Rating,na.rm = T)


# Step 1 : State the hypothesis -------------------------
# h0 : mue0 >= 9.5
# ha : mue0 < 9.5


# Step 2 : Level of significance -----------------------
alpha = 0.05


# Step 3 : Test statistic ------------------------------
#find z
z <- (mean - mue0) / (sd/sqrt(n));


# Step 4 : Finding P-value approach or Critical Value approach ----------------
#find pvalue of z
pvalue <- pnorm(1-z);

#find Critical Value
zalpha <- qnorm(0.05);


# Step 5 : Compare -------------------------------------
# Using p-value approach
if(pvalue<=alpha){
  print("Reject H0")
}else{
  print("Accept H0")
}

# Using critical value
if(z<=zalpha){
  print("Reject H0")
}else{
  print("Accept H0")
}


# Step 6 : Interval Estimation -----------------------------
#se_of_mean = 1.006108
#zalpha_2 = -1.959964

se_of_mean <- mean/sqrt(n)
zalpha_2 <- qnorm(0.05/2)

#margin = 1.971935
#upper = 11.51671
#lower = 7.572842

margin <- -zalpha_2 *se_of_mean
upper <- mean + margin
lower <- mean - margin
