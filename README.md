# CRI Bioinformatics Core Workshop Series - Functional Enrichment Analysis workshop
### 📅 Date: November 19th, 2025


**
This workshop offers a hands-on, practical introduction to gene set over-representation and functional enrichment analysis, 
with an emphasis on real-world applications and interpretation of results. 
Participants will learn the foundational concepts behind functional enrichment, 
explore both over-representation analysis and gene set enrichment analysis (GSEA), 
and gain direct experience running enrichment workflows. 
A key component of the workshop is learning to use our group-developed applications 
available at **https://biocoreapps.bsd.uchicago.edu/**, 
where participants will conduct gene set over-representation analysis using the **Functional Enrichment Analysis** application 
and visualize results through the **Functional Enrichment Visualization** application. 
We will also provide an introduction to an R script that demonstrates how to implement each step of gene set over-representation analysis 
programmatically.
**


### 🔬 Workshop Agenda: Functional Enrichment and Gene Set Over-Representation Analysis

This workshop will guide participants through the essential steps of functional enrichment analysis 
and gene set over-representation analysis using our group-developed applications and R scripts. 
It will primarily focus on a series of foundational, hands-on sessions designed to introduce practical approaches 
for analyzing gene sets and interpreting biological results.

- **Prerequisite Preparation: Access to CRI's HPC Environment (randi)**
  - Learn how to access and log into CRI's randi HPC
- **2. Overview of Functional Enrichment Analysis Concepts**
  - Introduction to over-representation analysis (ORA) and gene set enrichment analysis (GSEA)
- **3. 🧪 Hands-on: Using the Functional Enrichment Analysis Application**
  - Perform ORA with your gene lists using **[Biocore Applications](https://biocoreapps.bsd.uchicago.edu/)**
- **4. 🧪 Hands-on: Visualizing Results with Functional Enrichment Visualization**
  - Generate pathway and GO term plots using the visualization tool
- **5. 🧪 Hands-on: Implementing ORA via R Scripts**
  - Run ORA programmatically with provided R scripts


> **Note:** Please share your feedback on topics you'd like to see covered, or any questions you have 
for our workshop learning series, either through [this survey link](https://mycri.cri.uchicago.edu/educations/trainings/79/survey/) 
or by emailing me at yli22@bsd.uchicago.edu.

---

### 🛠 Prerequisite Preparations
- **Prerequisite: Access to CRI's HPC Environment (randi)**
  - Learn how to access and log into CRI's randi HPC ([Instructions](./doc/randi_hpc_access.md))
- **Prerequisite: RStudio Access with XQuartz**
  - Setup and access instructions are provided [here](./doc/rstudio_xquartz_setup.md)


---

### 1. Introduction to Functional Enrichment Analysis

Functional enrichment analysis allows researchers to interpret gene lists in a biological context, 
identifying over-represented pathways, gene ontology (GO) terms, and biological processes.

**Key Concepts:**

- 🧬 **Gene Set Over-Representation Analysis (ORA):** Tests whether specific gene sets are statistically enriched in your list.
- 📊 **Gene Set Enrichment Analysis (GSEA):** Evaluates whether predefined gene sets show significant trends across the entire ranked list.
- 🎯 Applications provide visual summaries for easier interpretation.

---

### 2. Using Biocore Applications

The workshop focuses on our group-developed applications, available at **https://biocoreapps.bsd.uchicago.edu/**:

1. **Functional Enrichment Analysis**
   - Input your gene list to perform ORA.
   - Explore enrichment scores, p-values, and FDR-adjusted significance.
2. **Functional Enrichment Visualization**
   - Visualize pathways and enriched GO terms.
   - Generate bar plots, dot plots, and network diagrams for interpretation.

---

### 3. Hands-on: Running Analysis with R Scripts

For participants preferring programmatic approaches, we provide R scripts that demonstrate:

1. Loading your gene list and background genes
2. Performing over-representation analysis
3. Extracting significant pathways and GO terms
4. Generating basic visualizations

This session will allow participants to learn how to reproduce application-based analysis via R scripting.

---

### 4. Functional Enrichment Analysis Workflow

The workflow for gene set over-representation analysis typically involves:

1. Preparing your gene list and background set
2. Running enrichment analysis (via applications or R scripts)
3. Visualizing and interpreting results
4. Optional downstream integration with other omics data

![](./images/functional-enrichment-workflow.png)

> **Note:** Participants can run these applications directly on `randi` via X11 forwarding with RStudio 
or locally on their machine with R installed for script-based analysis.



