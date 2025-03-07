# install cran packages
cranPackages <- c(
  "tidyverse",
  "plotly",
  "pheatmap",
  "RColorBrewer",
  "ggarchery"
)
install.packages(cranPackages)

# install Bioconductor packages
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
biocPackages <- c(
  "SummarizedExperiment",
  "DESeq2",
  "limma",
  "WGCNA",
  "EnhancedVolcano",
  "clusterProfiler"
)
BiocManager::install(biocPackages)
