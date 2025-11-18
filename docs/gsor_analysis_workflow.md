# GSOR Functional Enrichment Analysis Workflow

This document provides a complete workflow for performing Gene Set Over-Representation (GSOR) analysis using **clusterProfiler**. The workflow supports:
- **A single gene list**, or
- **Multiple gene sets** for comparative enrichment analysis.

It covers Gene Ontology (GO), GO Biological Process (GO BP), and KEGG pathway enrichment, as well as visualization using **dotplot** and **barplot**.

The full code is also available at:
- Workshop lab share: `/gpfs/data/biocore-workshop/functional_enrichment_workshop5/cluster_proflier_gsor_demo.R`

---

## Required Libraries
```r
library(clusterProfiler)
library(org.Hs.eg.db)
library(enrichplot)
```

## 0. Set Working Directory
```r
workDir <- "/gpfs/data/biocore-workshop/functional_enrichment_workshop5"
setwd(workDir)
```

---

## 1. GSOR for a Single Gene List

### **1.1 Load Gene Input**
```r
inputGeneList <- read.delim(file = 'test_data_input/gsorInput_EN.txt',
                            sep = '	', header = TRUE)
inputGeneList <- inputGeneList$gene
```

### **1.2 Convert Gene Symbols to ENTREZ IDs**
```r
geneIDres <- bitr(inputGeneList, fromType = "SYMBOL", toType = "ENTREZID",
                  OrgDb = "org.Hs.eg.db")
geneListEntrezID <- geneIDres$ENTREZID
```

---

## 1.3 Run GO Enrichment (all ontologies)
```r
gsor.res1 <- enrichGO(gene = geneListEntrezID, OrgDb = "org.Hs.eg.db",
                      ont = 'ALL', pvalueCutoff = 1, qvalueCutoff = 1,
                      pAdjustMethod = 'BH', pool = TRUE, readable = TRUE)

gsor.res11 <- enrichGO(gene = geneListEntrezID, OrgDb = "org.Hs.eg.db",
                       ont = 'ALL', pvalueCutoff = 0.05,
                       pAdjustMethod = 'BH', pool = TRUE, readable = TRUE)

gsor.res12 <- enrichGO(gene = geneListEntrezID, OrgDb = "org.Hs.eg.db",
                       ont = 'ALL', qvalueCutoff = 0.05,
                       pAdjustMethod = 'BH', pool = TRUE, readable = TRUE)
```

### **1.4 GO Biological Process Only**
```r
gsor.res2 <- enrichGO(gene = geneListEntrezID, OrgDb = "org.Hs.eg.db",
                      ont = 'BP', pvalueCutoff = 0.05, pAdjustMethod = 'BH',
                      pool = TRUE, readable = TRUE)
```

---

## 1.5 KEGG Enrichment
```r
gsor.res3 <- enrichKEGG(gene = geneListEntrezID, organism = 'hsa', keyType = 'kegg',
                        minGSSize = 10, maxGSSize = 500, pAdjustMethod = 'BH',
                        qvalueCutoff = 0.05)
```

---

## 1.6 Visualization: Single Gene List
### **GO: barplot & dotplot**
```r
barplot(gsor.res11, showCategory = 20)
dotplot(gsor.res12, showCategory = 20)
```

### **KEGG: barplot & dotplot**
```r
barplot(gsor.res3, showCategory = 10)
dotplot(gsor.res3, showCategory = 10)
```

---

# 2. GSOR for Multiple Gene Lists

## 2.1 Load Multiple Gene Input Files
```r
inputfiles <- list(
  IR1 = 'test_data_input/gsorInput_IM1.txt',
  IR2 = 'test_data_input/gsorInput_IM2.txt',
  ST1 = 'test_data_input/gsorInput_ST1.txt',
  ST2 = 'test_data_input/gsorInput_ST2.txt'
)
```

### **Read gene columns**
```r
inputGeneLists <- lapply(inputfiles, function(f) {
  res <- read.delim(f, sep = '	', header = TRUE, stringsAsFactors = FALSE)
  res$gene
})
```

---

## 2.2 Convert All Gene Lists to ENTREZ IDs
```r
geneListsEntrezID <- lapply(inputGeneLists, function(glist) {
  geneIDlist <- bitr(glist, fromType = "SYMBOL", toType = "ENTREZID",
                      OrgDb = 'org.Hs.eg.db')
  geneIDlist$ENTREZID
})
```

---

# 2.3 GSOR Using compareCluster

### **GO (ALL ontologies)**
```r
gsor.cluster.res1 <- compareCluster(geneCluster = geneListsEntrezID,
                                    fun = 'enrichGO', OrgDb = "org.Hs.eg.db",
                                    ont = 'ALL', pvalueCutoff = 1, qvalueCutoff = 1,
                                    pAdjustMethod = 'BH', pool = TRUE, readable = TRUE)
```

### **GO Biological Process**
```r
gsor.cluster.res2 <- compareCluster(geneCluster = geneListsEntrezID,
                                    fun = 'enrichGO', OrgDb = "org.Hs.eg.db",
                                    ont = 'BP', pvalueCutoff = 1, qvalueCutoff = 1,
                                    pAdjustMethod = 'BH', pool = TRUE, readable = TRUE)
```

### **KEGG**
```r
gsor.cluster.res3 <- compareCluster(geneCluster = geneListsEntrezID,
                                    fun = 'enrichKEGG', organism = 'hsa', keyType = 'kegg',
                                    minGSSize = 10, maxGSSize = 500, pvalueCutoff = 1,
                                    qvalueCutoff = 1, pAdjustMethod = 'BH')
```

---

# 2.4 Visualization for Multiple Gene Sets
### **Dotplots (recommended for comparisons)**
```r
dotplot(gsor.cluster.res1)
dotplot(gsor.cluster.res2)
dotplot(gsor.cluster.res3)
```

---

