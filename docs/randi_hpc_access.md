### 0. Prerequisite: High Performance Computing (HPC)

- **Access to CRI's HPC Environment (randi)**
  - Learn how to access and log into CRI's randi HPC ([Instructions](randi_hpc_access.md))

CRI provides access to its high-performance computing (HPC) system, `randi`, for all registered participants. 
The computational environment on `randi` is pre-configured to support running R scripts and Biocore Functional Enrichment Applications.

To access `randi`, use the SSH command:

```
ssh your_username@randi.cri.uchicago.edu
```

Your username is typically your **BSDID**. If you don’t have one, please request temporary access during registration.

Once logged in successfully, your prompt should resemble:

```
[yli22@cri22cn063 ~]$
```

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

