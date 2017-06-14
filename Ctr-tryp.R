library(ggraph)

df <- read.csv("Ctrl-tryp-EMT.csv")

df$threshold = as.factor(df$p < 0.05)
df <- df[-1,] # delete ACTB
df <- df[-11,] # delete HPRT1

tiff(filename='Ctrl-tryp-EMT-volcano.tiff', width=7*150, height=5*150, res=150)

ggplot(data=df, aes(x=log2, y=nlogp, colour=threshold, label=Gene)) + geom_point(alpha=1, size=3) + 
  geom_text(data=subset(df, p < 0.05), nudge_x=0.2, nudge_y=-0.1, color='black', size=1.5, check_overlap = TRUE) +
  xlab("log2 fold change") + ylab("-log10 p-value") +
  xlim(c(-5.5,5.5)) + ylim(c(0, 5.5)) +
  theme_bw() + theme(legend.position='none') +
  geom_vline(xintercept = 0, alpha=0.5, linetype='longdash')

dev.off()