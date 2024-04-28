---
title: "Types of errors"
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions

- What are false positives and false negatives and how do they manifest in a confusion matrix?
- What are some of real examples where false positives and false negatives have different implications and consequences?
::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::: objectives

- Understand the concept of false positives and false negatives and how they are represented in a confusion matrix
- Analyse and discuss scnarios where false positives and false negatives pose distinct challenges and implications
- Highlight situations where minimizing each type of error is crucial
:::::::::::::::::::::::::::::::::::::::::::

# Types of errors

In hypothesis testing, the evaluation of statistical significance involves making decisions based on sample data. However, these decisions are not without errors. In this tutorial, we will explore the concept of errors in hypothesis testing, focusing on Type I and Type II errors, and their implications.

## Type I Error

Type I error occurs when we reject a null hypothesis that is actually true. For example, in our previous example where we conducted many similar experiments, we experienced type I error by concluding that exposure to air pollution has an effect on disease prevalence (rejecting the null hypothesis) when it actually has no effect. Type I errors represent false positives and can lead to incorrect conclusions, potentially resulting in wasted resources or misguided decisions.

## Type II Error

Type II error occurs when we fail to reject a null hypothesis that is actually false. For example, when we fail to conclude that exposure to air pollution has an effect on disease prevalence (failing to reject the null hypothesis) when it actually has a positive effect. Type II errors represent false negatives and can result in missed opportunities or overlooking significant effects.

One common way when this error occurs in the context of hypothesis testing, is when a method with low __statistical power__ is chosen (if the sample size is small or the effect size (difference in disease prevalence) is small). Statistical power refers to the probability of correctly rejecting the null hypothesis when it is indeed false. In simpler terms, it measures the likelihood of detecting a true effect or difference if it exists. A test with high power is more likely to detect a real effect, while a test with low power is more likely to miss detecting a real effect, leading to a Type II error (false negative).

# Confusion Matrix

In the context of hypothesis testing, we can conceptualize Type I and Type II errors using a confusion matrix.
The confusion matrix represents the outcomes of hypothesis testing as True Positives (correctly rejecting H0), False Positives (incorrectly rejecting H0), True Negatives (correctly failing to reject H0), and False Negatives (incorrectly failing to reject H0).


![Figure_4: Errors in hypothesis testing and how they arise](fig/Figure 1 Errors in hypothesis testing.png)

# The problem

In hypothesis testing, the occurrence of Type I and Type II errors can have different implications depending on the context of the problem being addressed. It is crucial to understand which errors are problematic in which situation to be able to make informed decisions and draw accurate conclusions from statistical analyses.

Type I errors, are particularly problematic in situations where the cost or consequences of incorrectly rejecting a true null hypothesis are high. Again if we refer back to our example, if we incorrectly conclude that there is a significant difference in disease rates between the test groups exposed to air pollution and the average for the whole population when, in fact, there is no such difference, it could lead to misguided policies or interventions targeting air pollution reduction. For instance, authorities might implement costly environmental regulations or public health measures based on erroneous conclusions. In this case, the __consequences__ include misallocation of resources, leading to unnecessary financial burdens or societal disruptions. Moreover, public trust in scientific findings and policy decisions may be eroded if false positives lead to ineffective or burdensome interventions.

Type II errors, are problematic when failing to detect a significant effect has substantial consequences.If we fail to detect a significant difference in disease rates between the test group and the population average when there actually is a difference due to air pollution exposure, it could result in overlooking a serious public health concern. In this case, individuals living in polluted areas may continue to suffer adverse health effects without receiving appropriate attention or interventions. The __consequences__ include increased morbidity and mortality rates among populations exposed to high levels of air pollution. Additionally, delayed or inadequate response to environmental health risks may exacerbate inequalities in health outcomes.

### What do we learn?

In many real-world scenarios, there is a trade-off between Type I and Type II errors, and the appropriate balance depends on the specific goals and constraints of the problem. Reseachers may prioritize one over the other based on the severity of the consequences. For example, in cancer screenings, minimizing false negatives (Type II errors) is typically prioritized to avoid missing potential cases of cancer, even if it leads to an increase in false positives (Type I errors).

Effective evaluation of Type I and Type II errors necessitates a comprehensive consideration of the associated costs, risks, and ethical implications. This holistic approach enhances the validity and reliability of research findings by ensuring that decisions regarding hypothesis acceptance or rejection are informed not only by statistical significance but also by the potential real-world consequences of both false positives and false negatives. By carefully weighing these factors, researchers can make informed decisions that minimize the likelihood of erroneous conclusions while maximizing the practical relevance and ethical soundness of their findings.

::::::::::::::::::::::::::::::::::::::: instructor

Inline instructor notes can help inform instructors of timing challenges
associated with the lessons. They appear in the "Instructor View"
::::::::::::::::::










