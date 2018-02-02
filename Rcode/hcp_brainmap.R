library(dplyr)
library(rgl)
library(misc3d)
library(oro.nifti)

record_pair <- readRDS("./data/record_pair.rds")

pair_select <-  (p.adjust(1-ppois(record_pair - 1, 1), method = "BH") < 0.05) * 1

record_line <- readRDS("./data/record_line.rds")
templateImage <- readRDS("./data/templateImage.rds")

contour3d(templateImage, level= 1, smooth = 20, fill = TRUE, mask = array(TRUE, dim(templateImage)), alpha = .1, add = FALSE)
segments3d(record_line[,1], record_line[,2], record_line[,3], lwd = 1)
points3d(unique(record_line)[,1],unique(record_line)[,2], unique(record_line)[,3], 
         color = "blue", size = 10)

# install.packages(c("rgl", "rglwidget"), repos="http://R-Forge.R-project.org")
