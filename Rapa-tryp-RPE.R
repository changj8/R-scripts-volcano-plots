library(ggraph)

df <- read.csv("Rapa-tryp-RPE.csv")

df$threshold = as.factor(df$p < 0.05)

tiff(filename='Rapa-tryp-RPE-volcano.tiff', width=7*150, height=5*150, res=150)

ggplot(data=df, aes(x=log2, y=nlogp, colour=threshold, label=Gene)) + geom_point(alpha=1, size=3) + 
  geom_text(data=subset(df, p < 0.05), nudge_x=0.08, nudge_y=-0.04, color='black', size=2, check_overlap = TRUE) +
  xlab("log2 fold change") + ylab("-log10 p-value") +
  xlim(c(-1.2,1.2)) + ylim(c(0, 5)) +
  theme_bw() + theme(legend.position='none') +
  geom_vline(xintercept = 0, alpha=0.5, linetype='longdash')

dev.off()