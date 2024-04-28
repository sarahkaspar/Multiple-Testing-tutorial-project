---
title: "Family-wise error rate"
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions

- What is the family-wise error rate (FWER), and why is it important in multiple testing scenarios?
- How does the Bonferroni procedure adjust p-values to control the FWER, and what are its limitations?
::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::: objectives

- Understand the concept of the family-wise error rate (FWER) and its significance in multiple testing, including the implications of making multiple comparisons without controlling for FWER.
- Learn the Bonferroni procedure for adjusting p-values to maintain the FWER at a specified level, and recognize when alternative methods may be more appropriate or effective in controlling for multiple comparisons.
:::::::::::::::::::::::::::::::::::::::::::
# Family-wise Error Rate (FWER)

In statistical hypothesis testing, conducting multiple tests simultaneously increases the likelihood of making at least one false-positive error. In this tutorial, we will explore FWER, discuss methods for adjusting p-values to account for multiple comparisons, and examine practical examples.

## A Multi-Hypothesis Testing Framework

In multiple testing scenarios, researchers often have an overarching hypothesis that encompasses several individual hypotheses, each examining specific aspects or relationships within the data. This approach allows researchers to explore various facets of the research question comprehensively.

Going back to our study investigating the effects of air pollution on the prevalence of a disease, the overarching hypothesis could be formulated as follows:

_Exposure to air pollution is associated with increased prevalence of the disease_ 

Under this overarching hypothesis, several individual hypotheses can be formulated to examine different aspects of the relationship between air pollution exposure and disease prevalence. These individual hypotheses may focus on various pollutants, different health outcomes, or specific populations.

An example using three individual hypothesis:

_Hypothesis 1: Exposure to particulate matter  is associated with increased disease prevalence_

_Hypothesis 2: Exposure to nitrogen dioxide is associated with increased disease prevalence_

_Hypothesis 3: Long-term exposure to ozone (O3) is associated with an increased prevalence of the disease_

![Figure_5: Relationship between Overall Hypothesis and Individual Hypotheses: Effects of Air Pollution on Disease
Prevalence"](fig/Relationship between Overall Hypothesis and Individual Hypotheses. Effects of Air Pollution on Rdisease prevalence.png)

In this illustration, each individual hypothesis delves into a distinct facet of the overarching research inquiry, enabling researchers to thoroughly examine the intricate connection between air pollution exposure and disease prevalence. By scrutinizing the impacts of various air pollutants on the disease, this method encourages a systematic exploration of diverse factors and aids in revealing potential associations or patterns within the dataset.


Now, let us assume that after data collection, for hypothesis 1, we  find that 15 out of 100 individuals exposed to high levels of particulate matter develop the disease, for hypothesis 2, 20 out of 100 individuals exposed to high levels of nitrogen dioxide develop the disease and for hypothesis 3, 5 out of 100 individuals exposed to high levels of ozone develop the disease.

Let us assume we conduct statistical tests for each of these hypotheses, resulting in p-values for each test. For simplicity, let us maintain our significance level (alpha) at 0.05 for each individual test. We can conduct binomial tests for each hypothesis and calculate the p-values in R.


```r
n = 100 # number of test persons
p = 0.04 # Known prevalence of the disease in the general population

individuals_suffered = c(15, 20, 5) # number of individuals who suffered from the disease for each hypothesis

p_values = sapply(individuals_suffered, function(x) {
  p_value = dbinom(x, size = n, prob = p)
  return(p_value)
})#Calculate the p-values for each hypothesis using the binomial probability mass function


for (i in 1:length(p_values)) {
  cat(sprintf("Hypothesis %d: p = %.4f\n", i, p_values[i]))
}# Print the p-values for each hypothesis
```

```output
Hypothesis 1: p = 0.0000
Hypothesis 2: p = 0.0000
Hypothesis 3: p = 0.1595
```
## The Bonferroni correction 

Now, to calculate the probability of having any false-positive within the set of tests (also known as familywise error rate or FWER), we can use methods such as the Bonferroni correction. This method adjust the significance level for each test to control for multiple testing.

he Bonferroni procedure adjusts the significance level for each individual test by dividing the desired overall significance level (alpha) by the number of tests conducted (m).

Bonferroni adjusted significance level (αBonf)= α/m​
 
Where:

α is the desired overall significance level (usually set to 0.05).
m is the number of hypothesis tests conducted.


```r
α <- 0.05# Define the desired overall significance level (alpha)

m <- length(p_values)# Calculate the number of hypothesis tests conducted (m)

αBonf <- α / m # Calculate Bonferroni adjusted significance level
```


Since in our example above we have three tests (three hypotheses), the Bonferroni corrected significance level would be:

alpha_bonf = 0.05/3​
 ≈0.0167
 
### _Interpretation_ 

For each individual test, we would compare the calculated p-value to this adjusted significance level. If the p-value is less than or equal to 0.0167, we would reject the null hypothesis for that test.

Based on the Bonferroni correction, we would reject the null hypothesis for Hypotheses 1 and 2, indicating significant associations between particulate matter and nitrogen dioxide exposure with disease prevalence. However, for Hypothesis 3 (ozone), we would fail to reject the null hypothesis, suggesting no significant association with disease prevalence at the adjusted significance level. This adjustment for multiple testing helps control the overall probability of making at least one false-positive error across all tests conducted.


Air pollution, particularly fine particulate matter and other pollutants, can induce systemic inflammation in the body, leading to an increase in circulating inflammatory markers like C-reactive protein (CRP).
We decide to divide the population into four groups based on different levels of exposure to air pollution. Lets assume these groups are as follow: 

- Low exposure: Individuals living in rural areas with minimal industrial activity and low traffic density.
- Moderate exposure: Individuals living in suburban areas with some industrial activity and moderate traffic density.
- High exposure: Individuals living in urban areas with significant industrial activity and high traffic density.
- Very high exposure: Individuals living near industrial zones, major highways, or heavily polluted urban areas.


```r
# Generate example data for our four groups
set.seed(123)  # for reproducibility
Low_exposure <- rnorm(50, mean = 2.5, sd = 2)
Moderate_exposure <- rnorm(50, mean = 3.0, sd = 2)
High_exposure <- rnorm(50, mean = 3.5, sd = 2)
Very_high_exposure <- rnorm(50, mean = 4, sd = 2)

# Combine data into a single data frame
data <- data.frame(
  value = c(Low_exposure, Moderate_exposure, High_exposure, Very_high_exposure),
  group = rep(c("Low_exposure","Moderate_exposure","High_exposure", "Very_high_exposure"), each = 50)
)

data$group <- factor(data$group, levels = c("Low_exposure", "Moderate_exposure", "High_exposure", "Very_high_exposure"))# Reorder the levels of the 'group' factor variable

# Visualize the data
boxplot(value ~ group, data = data, col = "lightblue", main = "Boxplot of Four Groups")
```

<img src="fig/Family-wise error rate-rendered-unnamed-chunk-3-1.png" style="display: block; margin: auto;" />

Generally, as exposure level increases from low to very high, we might expect to see a corresponding increase in the median exposure level.


```r
# Perform one-way ANOVA
anova_result <- aov(value ~ group, data = data)
summary(anova_result)
```

```output
             Df Sum Sq Mean Sq F value  Pr(>F)    
group         3   60.8  20.268   5.754 0.00086 ***
Residuals   196  690.4   3.523                    
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

```r
# Perform Tukey post-hoc test
tukey_result <- TukeyHSD(anova_result)
tukey_result
```

```output
  Tukey multiple comparisons of means
    95% family-wise confidence level

Fit: aov(formula = value ~ group, data = data)

$group
                                           diff        lwr       upr     p adj
Moderate_exposure-Low_exposure        0.7240094 -0.2486521 1.6966710 0.2193881
High_exposure-Low_exposure            0.4233920 -0.5492695 1.3960536 0.6727404
Very_high_exposure-Low_exposure       1.5088066  0.5361450 2.4814681 0.0004795
High_exposure-Moderate_exposure      -0.3006174 -1.2732790 0.6720442 0.8539510
Very_high_exposure-Moderate_exposure  0.7847971 -0.1878644 1.7574587 0.1597266
Very_high_exposure-High_exposure      1.0854145  0.1127530 2.0580761 0.0219956
```

We perform a Tukey post-hoc test using __TukeyHSD()__ to determine which specific group means differ significantly from each other. The results provide pairwise comparisons of group means along with adjusted p-values to account for multiple comparisons.

## Data snooping

In the context of the above analysis, data snooping refers to the practice of exploring the data extensively, testing multiple hypotheses, and making comparisons until finding a statistically significant result or an interesting pattern. This can lead to overfitting the data or finding false positives due to chance alone.

![Figure_6: Data snoofing.](Data snooping.png.png)

In our example, data snooping could involve testing multiple comparisons between exposure groups until finding one that appears to be statistically significant or interesting. For example, one might compare only the "Very_high_exposure" group with the other groups, ignoring other potential comparisons. This selective comparison increases the likelihood of finding a significant result by chance alone.

After observing the initial boxplot, we might want to conduct numerous additional analyses or subgroup comparisons based on observed patterns, without pre-specifying these comparisons. This approach can lead to inflated Type I error rates (false positives) if corrections for multiple testing are not applied.

Data snooping can influence decision-making by focusing only on results that appear favorable or intriguing in the data. For instance, if a particular exposure group shows a larger mean than others, a decision might be made to focus solely on interventions or policies targeting that group without considering the broader context or potential confounding factors.







::::::::::::::::::::::::::::::::::::::: instructor

Inline instructor notes can help inform instructors of timing challenges
associated with the lessons. They appear in the "Instructor View"
::::::::::::::::::










