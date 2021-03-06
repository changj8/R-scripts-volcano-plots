library(ggraph)

df <- read.csv("CDC42i-scratch-EMT.csv")

df$threshold = as.factor(df$p < 0.05)
df <- df[-1,]
df <- df[-11,]

tiff(filename='CDC42i-scratch-EMT-volcano.tiff', width=7*150, height=5*150, res=150)

ggplot(data=df, aes(x=log2, y=nlogp, colour=threshold, label=Gene)) + geom_point(alpha=1, size=3) + 
  geom_text(data=subset(df, p < 0.05), nudge_x=0.15, nudge_y=-0.06, color='black', size=2, check_overlap = TRUE) +
  xlab("log2 fold change") + ylab("-log10 p-value") +
  xlim(c(-2.5,2.5)) + ylim(c(0, 4)) +
  theme_bw() + theme(legend.position='none') +
  geom_vline(xintercept = 0, alpha=0.5, linetype='longdash')

dev.off()