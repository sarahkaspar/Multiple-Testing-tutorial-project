---
title: 'Summary'
teaching: 10
exercises: 2
---
# Error rates

We have seen that when dealing with multiple testing, it is crucial to understand the different types of error rates that can be controlled. __Comparison-Wise Error Rate (CWER)__, which is the probability of making a Type I error (false positive) in any single hypothesis test, does not account for the multiplicity of tests and is only applicable when each performed test answers a separate research question. __Family-Wise Error Rate (FWER)__, the probability of making at least one Type I error among all the hypothesis tests, is a stringent error rate control method, suitable for situations where even one false positive is highly problematic. This is the case when we have one overarching null hypothesis that is rejected, as soon as we reject one inidiviual null hypothesis. Methods like the Bonferroni correction and Holm’s are often used to control FWER. __False Discovery Rate (FDR)__, the expected proportion of Type I errors among the rejected hypotheses, is less conservative than FWER and is useful in large-scale testing scenarios, like genomic studies, where some false positives are tolerable in exchange for higher power to detect true positives. The Benjamini-Hochberg procedure is a common method to control the FDR.

The choice of error rate to control depends on the research question and the context of the study.


# A Cook book to navigate multiple testing effectively

To navigate multiple testing effectively, we should:

1. start by __clearly defining our research question__, stating the specific hypothesis or set of hypotheses we aim to test, and considering the implications of potential false positives and false negatives. 

2. Next, we __decide on the appropriate error rate to control__, based on our research context and tolerance for Type I errors. This means assessing how critical it is to avoid any false positives (favoring FWER) versus allowing some false positives to increase detection power (favoring FDR). 

3. Finally, we __select a suitable statistical method that controls our chosen error rate__ and aligns with our data type and experimental design, ensuring it is well-suited to the specifics of our study.

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: instructor

Inline instructor notes can help inform instructors of timing challenges
associated with the lessons. They appear in the "Instructor View"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
