# Assignment 2 (Group)
Explore 2 dataset that given then finding descriptive statistics and summary result in form of sentences/paragraph at least 5 topics.

### Answer

1.)หาเพศของแมวว่ามีอย่างละกี่ตัว
```{R}
table(cats$Sex)
# F  M 
#47 97 

```

2.) ส่วนเบี่ยงเบนมาตราฐานของแมว
```{R}
sd(cats$Bwt)
# 0.4853066
```


3.)น้ำหนักที่มากที่สุดของแมว
```{R}
max(cats$Hwt)
# 20.5
```


4.) ค่าเฉลี่ยของแมว
```{R}
mean(cats$Bwt)
# 2.723611

```


5.) น้ำหนักที่น้อยที่สุดของแมว
```{R}
min(cats$Bwt)
# 2
```

6.) หาว่ามีชาย/หญิงกี่คน
```{R}
table(survey$Sex)
#Female   Male 
#   118    118 
```


7.) หาว่ามีคนเขียนด้วยมือซ้าย/ขวาอย่างละกี่คน
```{R}
table(survey$W.Hnd)
# Left Right 
#   18   218 
```


8.) หาอายุเฉลี่ยของนักเรียนทั้งหมด
```{R}
mean(survey$Age)
# 20.37451
```


9.) หาจำนวนคนที่ไม่เคยสูบบุหรี่
```{R}
table(survey$Smoke == "Never")
#FALSE  TRUE 
#   47   189 
```

10.) หาความสูงที่มากที่สุด
```{R}
max(survey$Height,na.rm = TRUE)
# 200
```


Team: คณิตคิดในใจ เลยนอกใจใครไม่เป็น

ชมกนก ชื่นประไพ StudentID: 63130500016 <br>
ณภัทร นวลศรี StudentID: 63130500027 <br>
ตรีภูวเรศ ปวีณาสมบัติ StudentID: 63130500040 <br>
ปณิสตา เหรียญทอง StudentID: 63130500076 <br>
ปิยชาติ เอี่ยมสำอางค์ StudentID: 63130500081
