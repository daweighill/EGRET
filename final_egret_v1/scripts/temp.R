## Customized ROC/PR Curves (liver)
```{r}
### ROC Curves
#grampa
grampaRoc <- as.data.frame(curves$rocs[[1]]$x)
colnames(grampaRoc) <- c("x")
grampaRoc$y <- curves$rocs[[1]]$y
grampaRoc$Method <- "GRAMPA* (GRAD)"

#qap
qapRoc <- as.data.frame(curves$rocs[[2]]$x)
colnames(qapRoc) <- c("x")
qapRoc$y <- curves$rocs[[2]]$y
qapRoc$Method <- "QAP* (GRAD)"

#panda
pandaRoc <- as.data.frame(curves$rocs[[3]]$x)
colnames(pandaRoc) <- c("x")
pandaRoc$y <- curves$rocs[[3]]$y
pandaRoc$Method <- "PANDA"

#aracne
aracneRoc <- as.data.frame(curves$rocs[[4]]$x)
colnames(aracneRoc) <- c("x")
aracneRoc$y <- curves$rocs[[4]]$y
aracneRoc$Method <- "ARACNe"

#otter
otterRoc <- as.data.frame(curves$rocs[[5]]$x)
colnames(otterRoc) <- c("x")
otterRoc$y <- curves$rocs[[5]]$y
otterRoc$Method <- "OTTER* (GRAD)"

#panda improved
panda2Roc <- as.data.frame(curves$rocs[[6]]$x)
colnames(panda2Roc) <- c("x")
panda2Roc$y <- curves$rocs[[6]]$y
panda2Roc$Method <- "PANDA*"

#otter
otterNTRoc <- as.data.frame(curves$rocs[[7]]$x)
colnames(otterNTRoc) <- c("x")
otterNTRoc$y <- curves$rocs[[7]]$y
otterNTRoc$Method <- "OTTER (GRAD)"

#roc_data <- rbind(grampaRoc, qapRoc, pandaRoc,aracneRoc,otterRoc, panda2Roc,otterNTRoc)
roc_data <- rbind(grampaRoc[sample(nrow(grampaRoc),1000),], qapRoc[sample(nrow(qapRoc),1000),], panda
                  Roc[sample(nrow(pandaRoc),1000),],aracneRoc[sample(nrow(aracneRoc),1000),],otterRoc[sample(nrow(otter
                                                                                                                  Roc),1000),], panda2Roc[sample(nrow(panda2Roc),1000),],otterNTRoc[sample(nrow(otterNTRoc),1000),])

sampled <- rbind(grampaRoc[sample(nrow(grampaRoc),10),], qapRoc[sample(nrow(qapRoc),10),], pandaRoc[s
                                                                                                    ample(nrow(pandaRoc),10),],aracneRoc[sample(nrow(aracneRoc),10),],otterRoc[sample(nrow(otterRoc),10),
                                                                                                                                                                               ], panda2Roc[sample(nrow(panda2Roc),10),],otterNTRoc[sample(nrow(otterNTRoc),10),])
roccurves <- ggplot(roc_data, aes(x=x, y=y, color=Method, group = Method)) + geom_line() +  theme_bw(
  base_size = 15) + scale_color_manual(values=c("tomato1", "royalblue1","orange","violetred", "springgr
een4", "violet","turquoise2")) + xlim(0,1) + ylim(0,1) + geom_abline(intercept = 0, slope = 1, linety
                                                                     pe = 2) + labs(title="ROC curves (liver)", x ="1 - Specificity", y = "Sensitivity") + geom_point(data
                                                                                                                                                                      =sampled, aes(x=x, y=y, group = Method,  color = Method, shape = Method)) +  scale_shape_manual(value
                                                                                                                                                                                                                                                                      s = c(15, 17,19,5,8,10,3))



### PR Curves
#grampa
grampapr <- as.data.frame(curves$prcs[[1]]$x)
colnames(grampapr) <- c("x")
grampapr$y <- curves$prcs[[1]]$y
grampapr$Method <- "GRAMPA* (GRAD)"

#qap
qappr <- as.data.frame(curves$prcs[[2]]$x)
colnames(qappr) <- c("x")
qappr$y <- curves$prcs[[2]]$y
qappr$Method <- "QAP* (GRAD)"

#panda
pandapr <- as.data.frame(curves$prcs[[3]]$x)
colnames(pandapr) <- c("x")
pandapr$y <- curves$prcs[[3]]$y
pandapr$Method <- "PANDA"

#aracne
aracnepr <- as.data.frame(curves$prcs[[4]]$x)
colnames(aracnepr) <- c("x")
aracnepr$y <- curves$prcs[[4]]$y
aracnepr$Method <- "ARACNe"

#otter
otterpr <- as.data.frame(curves$prcs[[5]]$x)
colnames(otterpr) <- c("x")
otterpr$y <- curves$prcs[[5]]$y
otterpr$Method <- "OTTER* (GRAD)"

#panda improved
panda2pr <- as.data.frame(curves$prcs[[6]]$x)
colnames(panda2pr) <- c("x")
panda2pr$y <- curves$prcs[[6]]$y
panda2pr$Method <- "PANDA*"

#otter NT
otterprNT <- as.data.frame(curves$prcs[[7]]$x)
colnames(otterprNT) <- c("x")
otterprNT$y <- curves$prcs[[7]]$y
otterprNT$Method <- "OTTER (GRAD)"

#pr_data <- rbind(grampapr, qappr, pandapr,aracnepr,otterpr, panda2pr,otterprNT)
pr_data <- rbind(grampapr[sample(nrow(grampapr),1000),], qappr[sample(nrow(qappr),1000),], pandapr[sa
                                                                                                   mple(nrow(pandapr),1000),],aracnepr[sample(nrow(aracnepr),1000),],otterpr[sample(nrow(otterpr),1000),
                                                                                                                                                                             ], panda2pr[sample(nrow(panda2pr),1000),],otterprNT[sample(nrow(otterprNT),1000),])

sampled <- rbind(grampapr[sample(nrow(grampapr),10),], qappr[sample(nrow(qappr),10),], pandapr[sample
                                                                                               (nrow(pandapr),10),],aracnepr[sample(nrow(aracnepr),10),],otterpr[sample(nrow(otterpr),10),], panda2p
                 r[sample(nrow(panda2pr),10),],otterprNT[sample(nrow(otterprNT),10),])

prcurves <- ggplot(pr_data, aes(x=x, y=y, color=Method, group = Method)) + geom_line() +  theme_bw(ba
                                                                                                   se_size = 15) + scale_color_manual(values=c("tomato1", "royalblue1","orange","violetred", "springgree
n4", "violet","turquoise2")) + xlim(0,1) + ylim(0,1)  + labs(title="PR curves (liver)", x ="Recall", 
                                                             y = "Precision") + geom_point(data=sampled, aes(x=x, y=y, group = Method,  color = Method, shape = Me
                                                                                                             thod)) +  scale_shape_manual(values = c(15, 17,19,5,8,10,3)) + theme(legend.position = "right",legend
                                                                                                                                                                                  .text=element_text(size=rel(0.5)),legend.title=element_text(size=rel(0.7)))

g_legend<-function(a.gplot){
  tmp <- ggplot_gtable(ggplot_build(a.gplot))
  leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
  legend <- tmp$grobs[[leg]]
  return(legend)}

mylegend<-g_legend(prcurves)

p3 <- grid.arrange(arrangeGrob(roccurves + theme(legend.position="none"), prcurves + theme(legend.pos
                                                                                           ition="none"), nrow=1, widths = c(4,4)), mylegend, nrow=1, widths = c(8,2), newpage = FALSE)

pdf("../outputs/liver.pdf",width = 9, height = 3)
plot(p3)
dev.off()
```
