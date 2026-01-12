############################################################
# Boolean Logic in R for Bioinformatics
# File: boolean_filtering_examples.R
# Author: Jordan Scollick-Karnitz
# Description:
# Demonstrates how Boolean operators (AND, OR, NOT)
# are used to filter biological datasets in R.
############################################################

# -----------------------------
# 1. Create Example Dataset
# -----------------------------

# Sample gene expression dataset
gene_data <- data.frame(
  gene = c("TP53", "BRCA1", "EGFR", "MYC", "KRAS"),
  expression = c(8.5, 12.3, 6.1, 15.2, 9.8),
  fold_change = c(2.1, -1.8, 3.5, -2.3, 1.2),
  p_value = c(0.001, 0.03, 0.15, 0.008, 0.22)
)

# View dataset
print(gene_data)

# -----------------------------
# 2. AND Operator (&)
# -----------------------------
# Biological question:
# Which genes have high expression AND are statistically significant?

and_result <- gene_data[
  gene_data$expression > 10 & gene_data$p_value < 0.05,
]

print("Genes with high expression AND significant p-values:")
print(and_result)

# Expected result: BRCA1, MYC

# -----------------------------
# 3. OR Operator (|)
# -----------------------------
# Biological question:
# Which genes have a high fold change OR a very low p-value?

or_result <- gene_data[
  gene_data$fold_change > 3 | gene_data$p_value < 0.01,
]

print("Genes with high fold change OR low p-values:")
print(or_result)

# Expected result: TP53, EGFR, MYC

# -----------------------------
# 4. NOT Operator (!)
# -----------------------------
# Biological question:
# Which genes are NOT significantly upregulated?

not_result <- gene_data[
  !(gene_data$fold_change > 2 & gene_data$p_value < 0.05),
]

print("Genes that are NOT significantly upregulated:")
print(not_result)

# Expected result: All except TP53 and EGFR

# -----------------------------
# 5. Complex Logical Combination
# -----------------------------
# Biological question:
# Which genes are significantly changed (up OR down)
# AND have high expression?

complex_result <- gene_data[
  (gene_data$fold_change > 2 | gene_data$fold_change < -2) &
    gene_data$p_value < 0.05 &
    gene_data$expression > 8,
]

print("Significantly changed genes with high expression:")
print(complex_result)

# Expected result: MYC

# -----------------------------
# Key Concept
# -----------------------------
# Boolean logic allows us to encode biological assumptions
# directly into computational filters.
#
# The same logic used here applies to:
# - Literature searching (PubMed, Google Scholar)
# - RNA-seq filtering
# - Variant prioritization
# - Reproducible analysis pipelines
############################################################
