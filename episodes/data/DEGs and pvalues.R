install.packages("BiocManager")
library(BiocManager)

# Install or update BiocManager package if necessary
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

# Load BiocManager
library(BiocManager)
BiocManager::install("DESeq2", force = TRUE)
BiocManager::install("airway", force = TRUE)
library(DESeq2)
library(airway)
#Load the Airway Dataset
data("airway")

#Create a DESeq2 dataset from the airway data
dds <- DESeqDataSetFromMatrix(countData = assay(airway),
                              colData = colData(airway),
                              design = ~ dex)#the design formula ~ dex specifies that we are interested in the effect of the treatment (dex), which indicates dexamethasone treatment.

# Pre-filter the dataset to remove rows with low counts  _Pre-filter low counts
keep <- rowSums(counts(dds)) > 1
dds <- dds[keep,]

#Perform the DESeq2 analysis to find DEGs between treated and untreated samples

dds <- DESeq(dds)

#Obtain the results of the differential expression analysis.
res <- results(dds)##By default, this will compare treated (dex) vs untreated samples


#Check the results summary
summary(res)

# View the top rows of the results
head(res)


# Extract the p-values into a separate variable
pvalues <- res$pvalue


# Combine the gene names and their corresponding p-values
pvalue_data <- data.frame(gene=rownames(res), pvalue=res$pvalue)
# Save to a CSV file
write.csv(pvalue_data, file="DEG_pvalues.csv", row.names=FALSE)
