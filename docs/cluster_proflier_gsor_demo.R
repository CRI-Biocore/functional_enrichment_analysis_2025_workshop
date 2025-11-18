rm(list = ls())
## This script is used to conduct GSOR for a set of gene list inputs
## ------------------------------------------------------------------------- ##
library(clusterProfiler)
library(org.Hs.eg.db)
library(enrichplot)
## ------------------------------------------------------------------------- ##
## 0. direct to your designated working directory
workDir <- "/gpfs/data/biocore-workshop/functional_enrichment_workshop5"
setwd(workDir)
## ------------------------
## 1. conduct GSOR for one set of gene
inputGeneList <- read.delim(file = 'test_data_input/gsorInput_EN.txt', sep = '\t', header = T)
inputGeneList <- inputGeneList$gene
geneIDres <- bitr(inputGeneList, fromType = "SYMBOL", toType = "ENTREZID", OrgDb = "org.Hs.eg.db")
geneListEntrezID <- geneIDres$ENTREZID
## ---------
gsor.res1 <- enrichGO(gene          = geneListEntrezID, 
                      OrgDb         = "org.Hs.eg.db", 
                      ont           = 'ALL',
                      pvalueCutoff  = 1, 
                      qvalueCutoff  = 1, 
                      pAdjustMethod = 'BH',
                      pool          = T,
                      readable      = T)

gsor.res11 <- enrichGO(gene          = geneListEntrezID, 
                      OrgDb         = "org.Hs.eg.db", 
                      ont           = 'ALL',
                      pvalueCutoff  = 0.05, 
                      pAdjustMethod = 'BH',
                      pool          = T,
                      readable      = T)

gsor.res12 <- enrichGO(gene          = geneListEntrezID, 
                      OrgDb         = "org.Hs.eg.db", 
                      ont           = 'ALL',
                      qvalueCutoff  = 0.05, 
                      pAdjustMethod = 'BH',
                      pool          = T,
                      readable      = T)
print(dim(gsor.res1))
print(dim(gsor.res11))
print(dim(gsor.res12))
## GO Biological processing anlaysis.
gsor.res2 <- enrichGO(gene          = geneListEntrezID, 
                      OrgDb         = "org.Hs.eg.db", 
                      ont           = 'BP',
                      pvalueCutoff  = 0.05, 
                      pAdjustMethod = 'BH',
                      pool          = T,
                      readable      = T)


gsor.res3 <- enrichKEGG(gene = geneListEntrezID, 
                        organism = 'hsa', 
                        keyType = 'kegg', 
                        minGSSize = 10, maxGSSize = 500, 
                        qvalueCutoff  = 0.05, 
                        pAdjustMethod = 'BH')


barplot(gsor.res11, showCategory=20) 
dotplot(gsor.res12, showCategory=20) 

barplot(gsor.res3, showCategory=10) 
dotplot(gsor.res3, showCategory=10) 

## ------------------------------------------------------------------------- ##
## 2. conduct GSOR for a set of gene lists
inputfiles <- list('IR1' = 'test_data_input/gsorInput_IM1.txt', 
                   'IR2' = 'test_data_input/gsorInput_IM2.txt', 
                   'ST1' = 'test_data_input/gsorInput_ST1.txt', 
                   'ST2' = 'test_data_input/gsorInput_ST2.txt')

inputGeneLists <- lapply(inputfiles, function(f) {
  res <- read.delim(f, sep = "\t", header = TRUE, stringsAsFactors = FALSE)
  genes <- res$gene
  return(genes)
})

geneListsEntrezID <- lapply(inputGeneLists, function(glist) {
  geneIDlist <- bitr(
    glist,
    fromType = "SYMBOL",
    toType   = "ENTREZID",
    OrgDb    = 'org.Hs.eg.db'
  )
  geneIDlist$ENTREZID
})


gsor.cluster.res1 <- compareCluster(geneCluster   = geneListsEntrezID, 
                                    fun           = 'enrichGO',
                                    OrgDb         = "org.Hs.eg.db", 
                                    ont           = 'ALL',
                                    pvalueCutoff  = 1,
                                    qvalueCutoff  = 1,
                                    pAdjustMethod = 'BH',
                                    pool          = T,
                                    readable      = T)

gsor.cluster.res2 <- compareCluster(gene          = geneListsEntrezID, 
                                    OrgDb         = "org.Hs.eg.db", 
                                    ont           = 'BP',
                                    pvalueCutoff  = 1, 
                                    qvalueCutoff  = 1, 
                                    pAdjustMethod = 'BH',
                                    pool          = T,
                                    readable      = T)

gsor.cluster.res3 <- compareCluster(geneCluster   = geneListsEntrezID, 
                                    fun           = 'enrichKEGG',
                                    organism = 'hsa',
                                    keyType = 'kegg', 
                                    minGSSize = 10, maxGSSize = 500, 
                                    pvalueCutoff  = 1, 
                                    qvalueCutoff  = 1, 
                                    pAdjustMethod = 'BH')

dotplot(gsor.cluster.res1)
dotplot(gsor.cluster.res2)
dotplot(gsor.cluster.res3)
## ------------------------------------------------------------------------- ##
