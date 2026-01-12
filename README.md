# Boolean Logic in R for Bioinformatics

An educational resource demonstrating how **Boolean logic (AND, OR, NOT)** is applied in **R programming** for common bioinformatics and computational biology tasks.

This repository is designed for students, educators, and early-career scientists learning how logical thinking underpins **literature searching, data filtering, and reproducible analysis pipelines**.

---

## 🎯 Learning Objectives

By the end of this resource, learners will be able to:

* Understand Boolean operators in R (`&`, `|`, `!`)
* Apply logical conditions to filter biological datasets
* Translate biological questions into computational logic
* Recognize how Boolean logic connects literature searching and data analysis

---

## 🧬 Example Dataset

```r
# Sample gene expression dataset
gene_data <- data.frame(
  gene = c("TP53", "BRCA1", "EGFR", "MYC", "KRAS"),
  expression = c(8.5, 12.3, 6.1, 15.2, 9.8),
  fold_change = c(2.1, -1.8, 3.5, -2.3, 1.2),
  p_value = c(0.001, 0.03, 0.15, 0.008, 0.22)
)
```

---

## 🔗 Boolean Operators in R

### AND Operator (`&`)

Genes with **high expression AND statistically significant p-values**:

```r
gene_data[gene_data$expression > 10 & gene_data$p_value < 0.05, ]
```

**Returns:** `BRCA1`, `MYC`

---

### OR Operator (`|`)

Genes with **high fold change OR low p-values**:

```r
gene_data[gene_data$fold_change > 3 | gene_data$p_value < 0.01, ]
```

**Returns:** `TP53`, `EGFR`, `MYC`

---

### NOT Operator (`!`)

Genes that are **NOT significantly upregulated**:

```r
gene_data[!(gene_data$fold_change > 2 & gene_data$p_value < 0.05), ]
```

**Returns:** All except `TP53` and `EGFR`

---

### 🧠 Complex Logical Combinations

Significantly changed genes (**up OR down**) AND **high expression**:

```r
gene_data[(gene_data$fold_change > 2 | gene_data$fold_change < -2) &
          gene_data$p_value < 0.05 &
          gene_data$expression > 8, ]
```

**Returns:** `MYC`

---

## 🔑 Key Takeaway

Boolean logic is fundamental to both **literature searching** and **data analysis**. The same logical principles apply whether you're querying **PubMed** or filtering a **genomics dataset in R**.

Strong science starts with strong logic.

---

## 👩‍🏫 Intended Audience

* Bioinformatics and computational biology students
* STEM educators
* Researchers transitioning into data-driven biology

---

**Author:** Jordan Scollick-Karnitz
PhD | Bioinformatics | STEM Educator
