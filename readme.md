---
title: "Simulation of Exponential Distribution"
author: "Humin Xue"
date: "February 14, 2016"
output: 
  html_document: 
    fig_caption: yes
---

In this project I will investigate the exponential distribution in R and compare it with the Central Limit Theorem.

* Sample Mean vs. Theoretical Mean
* Sample Variance vs. Theoretical Variance
* Distribution.

The exponential distribution is simulated in R with rexp(n, lambda) where lambda is the rate parameter.

**1. Sample Mean vs. Theoretical Mean **

```{r}
#set lambda 
lambda <- 0.2

# set number of sample
n <- 40

# number of simulation

simu <- 1000

# experiment data

sample_data <- replicate(simu, mean(rexp(n, lambda)))

# sample mean
 sample_mean <- mean(sample_data)
 
# show sample mean
 sample_mean

# theoretical mean
 theory_mean = 1/lambda

 # show theoretical mean
 theory_mean
```

You can see the sample mean = 5.022986 which is very close to the theoretical mean = 5.
 
Now plot the distribution of sample mean. The blue line indicates the theoretical mean.


```{r, eval=TRUE}
hist(sample_data, breaks = 50,  prob = TRUE, main="Exponential Distribution of sample Mean",  xlab="Sample Mean")
 abline(v = theory_mean, col= 3, lwd = 1, col="blue")
```


**2. Sample Variance vs. Theoretical Variance  **

Sample Variance vs. Theoretical Variance

Sample variance is calculated using R function var(). Whereas, we calculate theoretical variance using the relation:

```{r}
 # Sample variance
 sample_var = var(sample_data)
 
 #theoretical variance
 theory_var = (1/lambda**2)/n
```

It is observed that sample variance = 0.6026481 is closed to theoretical variance = 0.625.

**3. Distribution **

 After reviewing the plot and result,  validate the distribution is normal distrubution

```{r}
theory_dist<-rnorm(sample_data,mean = theory_mean,sd=(theory_var)^0.5)
 par(mfrow=c(1,2))
 hist(theory_dist,main = "Distribution of Theoretical Means", col = "blue", xlab="Theoretical Mean")
 hist(sample_data,main = "Distribution of Sample Means", col = "red", xlab="Sample Mean")
```


**Here is conclusion**

From the above plot, the distribution of sample mean and normal distribution of theoretical mean is similar.
Since the distribution of sample means resembles a normal distribution, So the results comply with the central limit theorem.