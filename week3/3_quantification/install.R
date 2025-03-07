# install cran packages
cranPackages <- c(
  "tidyverse",
  "plotly",
  "pheatmap",
  "RColorBrewer"
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
  "impute"
)
BiocManager::install(biocPackages)
