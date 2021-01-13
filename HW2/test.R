library(psych)
library(ggplot2)

f <-file.choose()
f
teri <- read.csv(f)

teri$Pre
teri$Post
teri$Change
teri$Group

teri$Group <- factor(teri$Group)
describeBy(teri$Change, teri$Group)

ggplot(teri, aes(x=Group, y=Change, fill=Group)) +
  labs(y='Change in Depression') +
  geom_boxplot(show.legend=FALSE) +
  stat_summary(fun=mean, geom='point', shape=20, size=10, color='blue', fill='blue') +
  geom_hline(yintercept=mean(teri$Change), linetype='dashed', color='darkblue', size=2) +
  geom_dotplot(binaxis='y', stackdir='center', dotsize=0.5, show.legend=FALSE) #+
  #scale_fill_brewer(palette = 'Accent') +
  #theme_classic(base_size=16) 
