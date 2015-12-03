load("sorted.projects.RData")

month.tab <- table(sorted.projects$reg.month)
month.df <- data.frame(month=as.numeric(names(month.tab)),
                       projects.registered=as.numeric(month.tab))
library(ggplot2)
gg <- ggplot()+ 
  geom_vline(aes(xintercept=month),
             data=data.frame(month=2008+7/12))+
  geom_vline(aes(xintercept=month), 
             data=data.frame(month=2011+5/12),
             color="blue")+
  geom_text(aes(month, projects.registered, label=label), 
            data=data.frame(month=2012, 
              projects.registered=35, 
              label="First devtools\non CRAN"),
            hjust=0,
            color="blue")+
  geom_point(aes(month, projects.registered), 
             shape=1,
             data=month.df)

png("figure-R-Forge-registrations-per-month.png")
print(gg)
dev.off()
