# project human hypothalamus
# validation of cellpose segmentation

setwd("/run/media/admin/LeGAO/Project_Human_Hypothalamus/task_0708_cellpose_validation/")


patch1_neuron <- read.csv("patch1/neuron_Mask comparison Object with IoU thresholds.csv")
patch2_neuron <- read.csv("patch2/neuron_Mask comparison Object with IoU thresholds.csv")
patch4_neuron <- read.csv("patch4/neuron_Mask comparison Object with IoU thresholds.csv")

neuron_df <- cbind(patch1_neuron$Object.Jaccard.Index,
                   patch2_neuron$Object.Jaccard.Index,
                   patch4_neuron$Object.Jaccard.Index)

JI_mean <- rowMeans(neuron_df)

JI_sd <- apply(neuron_df, 1, sd)
JI_sd <- JI_sd/sqrt(ncol(neuron_df))


JI_df <- data.frame(IoU = patch1_neuron$Object.IoU.threshold,
                    JI_mean = JI_mean,
                    JI_sd = JI_sd)

ggplot(data = JI_df, aes(x = IoU, y = JI_mean)) + 
  #scale_y_continuous(limits = c(-0.05, 1), n.breaks = 10) +
  #scale_x_continuous(limits = c(0, 1), n.breaks = 10) +
  geom_line() +
  geom_point() +
  geom_errorbar(aes(ymin = JI_mean - JI_sd, 
                    ymax = JI_mean + JI_sd), width=0.02) +
  theme_classic() +
  theme(text = element_text(size = 12)) +
  ggtitle("Neuron")


## glia
patch1_glia <- read.csv("patch1/glia_Mask comparison Object with IoU thresholds.csv")
patch2_glia <- read.csv("patch2/glia_Mask comparison Object with IoU thresholds.csv")
patch3_glia <- read.csv("patch3/Mask comparison Object with IoU thresholds.csv")
patch4_glia <- read.csv("patch4/glia_Mask comparison Object with IoU thresholds.csv")


glia_df <- cbind(patch1_glia$Object.Jaccard.Index,
                 patch2_glia$Object.Jaccard.Index,
                 patch3_glia$Object.Jaccard.Index,
                 patch4_glia$Object.Jaccard.Index)

JI_mean <- rowMeans(glia_df)

JI_sd <- apply(glia_df, 1, sd)
JI_sd <- JI_sd/sqrt(ncol(glia_df))


JI_df <- data.frame(IoU = patch1_glia$Object.IoU.threshold,
                    JI_mean = JI_mean,
                    JI_sd = JI_sd)

ggplot(data = JI_df, aes(x = IoU, y = JI_mean)) + 
  #scale_y_continuous(limits = c(-0.05, 1), n.breaks = 10) +
  #scale_x_continuous(limits = c(0, 1), n.breaks = 10) +
  geom_line() +
  geom_point() +
  geom_errorbar(aes(ymin = JI_mean - JI_sd, 
                    ymax = JI_mean + JI_sd), width=0.02) +
  theme_classic() +
  theme(text = element_text(size = 12)) +
  ggtitle("Glia")



