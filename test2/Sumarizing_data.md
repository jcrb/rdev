Summarizing Data in R
========================================================

When work with large amounts of data that is structured in a tabular format, a common operation is to summarize that data in different ways using specific variables. In Microsoft Excel, pivot tables are a nice feature that is used for this purpose. Of course, R also has similar calculations that can be used to summarize large amount of data. In the following R code, I utilizeR to summarize a data frame by specific variables.

## DATA

```r
dat = data.frame(name = c("Tony", "James", "Sara", "Alice", "David", "Angie", 
    "Don", "Faith", "Becky", "Jenny"), state = c("KS", "IA", "CA", "FL", "MI", 
    "CO", "KA", "CO", "KS", "CA"), gender = c("M", "M", "F", "F", "F", "M", 
    "F", "M", "F", "F"), marital_status = c("M", "S", "S", "S", "M", "M", "S", 
    "M", "S", "M"), credit = c("good", "good", "poor", "fair", "poor", "fair", 
    "fair", "fair", "good", "fair"), owns_home = c(0, 1, 0, 0, 1, 0, 1, 1, 1, 
    1), cost = c(500, 200, 300, 150, 200, 300, 400, 450, 250, 150))

dat
```

```
##     name state gender marital_status credit owns_home cost
## 1   Tony    KS      M              M   good         0  500
## 2  James    IA      M              S   good         1  200
## 3   Sara    CA      F              S   poor         0  300
## 4  Alice    FL      F              S   fair         0  150
## 5  David    MI      F              M   poor         1  200
## 6  Angie    CO      M              M   fair         0  300
## 7    Don    KA      F              S   fair         1  400
## 8  Faith    CO      M              M   fair         1  450
## 9  Becky    KS      F              S   good         1  250
## 10 Jenny    CA      F              M   fair         1  150
```

## DDPLY FUNCTION IN THE PLYR PACKAGE 
## Use 'nrow' to find the count of a particular variable 

```r
library(plyr)
ddply(dat, .(credit), "nrow")
```

```
##   credit nrow
## 1   fair    5
## 2   good    3
## 3   poor    2
```

```r
ddply(dat, .(gender), "nrow")
```

```
##   gender nrow
## 1      F    6
## 2      M    4
```

```r
ddply(dat, .(marital_status, credit), "nrow")
```

```
##   marital_status credit nrow
## 1              M   fair    3
## 2              M   good    1
## 3              M   poor    1
## 4              S   fair    2
## 5              S   good    2
## 6              S   poor    1
```

```r
## use 'summarise' to summarize numeric variables
ddply(dat, .(gender), summarise, mean_cost = mean(cost))
```

```
##   gender mean_cost
## 1      F     241.7
## 2      M     362.5
```

```r
ddply(dat, .(state), summarise, mean_cost = mean(cost))
```

```
##   state mean_cost
## 1    CA       225
## 2    CO       375
## 3    FL       150
## 4    IA       200
## 5    KA       400
## 6    KS       375
## 7    MI       200
```

```r
ddply(dat, .(gender), summarise, min_cost = min(cost), max_cost = max(cost), 
    mean_cost = mean(cost))
```

```
##   gender min_cost max_cost mean_cost
## 1      F      150      400     241.7
## 2      M      200      500     362.5
```

```r
ddply(dat, .(gender, credit), summarise, credit = length(credit), min_cost = min(cost), 
    max_cost = max(cost), mean_cost = mean(cost))
```

```
##   gender credit min_cost max_cost mean_cost
## 1      F      3      150      400     233.3
## 2      F      1      250      250     250.0
## 3      F      2      200      300     250.0
## 4      M      2      300      450     375.0
## 5      M      2      200      500     350.0
```

## AGGREGATE FUNCTION FROM BASE R

```r
aggregate(cost ~ marital_status + gender, data = dat, FUN = mean)
```

```
##   marital_status gender  cost
## 1              M      F 175.0
## 2              S      F 275.0
## 3              M      M 416.7
## 4              S      M 200.0
```

```r
aggregate(cost ~ credit + gender, data = dat, FUN = mean)
```

```
##   credit gender  cost
## 1   fair      F 233.3
## 2   good      F 250.0
## 3   poor      F 250.0
## 4   fair      M 375.0
## 5   good      M 350.0
```


