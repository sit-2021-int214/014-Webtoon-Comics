# Analytical Inferential Statistics

## Hypothesis testing

### Question : การ์ตูนประเภท Romance ใน webtoon มี rating มากกว่า 9.5

#### Step 0 : Assign variables

```
n <- 90
sd <- 0.3439272
mean <- 9.544778
mue0  <- 9.5
```

#### Step 1 : State the hypothesis

```
h0:  mue0 >= 9.5 
ha: mue0 < 9.5
```

#### Step 2 : Level of significance

```
alpha <- 0.05
```

#### Step 3 : Test statistic

```
z <- (xbar - u0) / (sd/sqrt(n)); z
```
Result
```
z = 1.235143
```

#### Step 4 : Finding P-value approach or Critical Value approach

```
# P-value approach
pvalue <- pnorm(z); pvalue

# Critical Value approach
zalpha <- qnorm(alpha); zalpha
```
Result
```
pvalue = 0.4070488
zalpha = -1.644854
```

#### Step 5 : Compare

```
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
```
Result
```
Accept H0
Accept H0
```

#### Step 6 : Interval Estimation

```
# Find standard error of mean 
se_of_mean <- mean/sqrt(n)

# Find z value providing an area of alpha/2
zalpha_2 <- qnorm(0.05/2)

# Find magin
margin <- -zalpha_2 *se_of_mean
```

Result
```
se_of_mean = 1.006108
zalpha_2 = -1.959964
margin = 1.971935
```

Find upper&lower
```
upper <- mean + margin
lower <- mean - margin
```

Result
```
upper = 11.51671
lower = 7.572842
```

#### Step 7 : Conclusion
- จากการทดสอบสมมติฐานสรุปได้ว่าการ์ตูนประเภท Romance ใน webtoon มี rating มากกว่า 9.5
