# CRI Bioinformatics Core Workshop Series - Functional Enrichment Analysis workshop
### 📅 Date: November 19th, 2025

**

This workshop offers a hands-on, practical introduction to gene set over-representation and functional enrichment analysis, 
with an emphasis on real-world applications and interpretation of results. 
Participants will learn foundational concepts behind functional enrichment, 
explore both over-representation analysis and gene set enrichment analysis (GSEA), 
and gain direct experience running enrichment workflows.

A key component of the workshop is learning to use our group-developed applications 
available at **https://biocoreapps.bsd.uchicago.edu/**, where participants will conduct gene set over-representation analysis 
using the **Functional Enrichment Analysis** application and 
visualize results through the **Functional Enrichment Visualization** application. 

We will also introduce an R script that demonstrates how to implement each step of gene set over-representation analysis programmatically.
**


---

## 🔬 Workshop Agenda: Functional Enrichment & Gene Set Over-Representation Analysis

This workshop will guide participants through essential steps of functional enrichment and gene set over-representation analysis using our group-developed applications and R scripts. It is centered on a series of foundational, hands-on sessions designed to introduce practical approaches for analyzing gene sets and interpreting biological results.

- **1. Prerequisite Preparation: Access to CRI's HPC Environment (randi) and initiate rstudio analysis working enviroment**
  - Learn how to access and log into CRI's randi HPC to intiate rstudio environment for **'section5 hands-on'**
  - ➡️ **[Go to Section 1: RStudio Access on Randi](./docs/rstudio_randi_quickstart.md)**


- **2. Overview of Functional Enrichment Analysis Concepts**
  - Introduction to over-representation analysis (ORA) and gene set enrichment analysis (GSEA)

- **3. 🧪 Hands-on: Using the Functional Enrichment Analysis Application**
  - Perform ORA with your gene lists using **[Biocore Developed GSOR Applications](https://biocoreapps.bsd.uchicago.edu/gsea_shiny/){:target="_blank"}**

- **4. 🧪 Hands-on: Visualizing Results with Functional Enrichment Visualization**
  - Visualize enrichment analysis results using **[Biocore Developed Visualization Applications](https://biocoreapps.bsd.uchicago.edu/feavisapp/)**

- **5. 🧪 Hands-on: Implementing ORA via R Scripts**
  - Run ORA programmatically with provided R scripts

> **Note:** Please share your feedback on topics you'd like to see covered, or any questions for our workshop learning series, either through [this survey link](https://mycri.cri.uchicago.edu/educations/trainings/79/survey/) or by emailing **yli22@bsd.uchicago.edu**.

---

## 1. Introduction to Functional Enrichment Analysis

Functional enrichment analysis allows researchers to interpret gene lists in a biological context by identifying over-represented pathways, gene ontology (GO) terms, and biological processes.

### **Key Concepts**

- 🧬 **Gene Set Over-Representation Analysis (GSOR):** Tests whether specific gene sets are statistically enriched in a list of genes.
- 📊 **Gene Set Enrichment Analysis (GSEA):** Evaluates whether predefined gene sets show significant patterns across an entire ranked gene list.
- 🎯 Applications provide visual summaries for easier interpretation.

---

## 2. Using Biocore Applications

This workshop focuses on our group-developed applications, available at **https://biocoreapps.bsd.uchicago.edu/**.

### **1. Functional Enrichment Analysis**
- https://biocoreapps.bsd.uchicago.edu/gsea_shiny/
- Input your gene list to perform ORA.
- Explore enrichment scores, p-values, and FDR-adjusted significance.

### **2. Functional Enrichment Visualization**
- https://biocoreapps.bsd.uchicago.edu/feavisapp/
- Visualize pathways and enriched GO terms.
- Generate bar plots, dot plots, and network diagrams for interpretation.

---

## 3. Workshop Dataset

The workshop dataset is derived from the published single-cell RNA-seq study of the human ovary.

### **Reference**

[*Lengyel E, Li Y et al., "A molecular atlas of the human postmenopausal fallopian tube and ovary from single-cell RNA and ATAC sequencing."*  
Cell Reports (2022)](https://www.cell.com/cell-reports/fulltext/S2211-1247(22)01044-3)


### **Dataset Details**
- Based on scRNA-seq profiling of human ovary
- Includes multiple identified cell clusters
- Workshop files are provided inside the `test_data_input` folder, containing identified over-represented genes for each cell type

These files will be used directly in the enrichment applications and R scripts.

---

## 4. Hands-on: Running Analysis with R Scripts

For participants preferring programmatic approaches, we provide R scripts demonstrating GSOR analysis. 
This hands-on session will show participants how to reproduce application-based analysis programmatically for single and multiple gene sets respectively.

> **Note:** Participants may run these applications directly on `randi` via X11 forwarding with RStudio, or locally with an R installation.

