load("sorted.projects.RData")

png("figure-R-Forge-projects-cumulative.png")
par(mar=c(3,4,2,3.5))
plot(count~registered,sorted.projects,type="s",las=1,
     xlab="",
     ylab="Total number of projects on R-Forge")

user2008 <- as.POSIXct("2008-08-13")
user2008.y <- with(sorted.projects,approx(registered,count,user2008))$y
points(user2008,user2008.y,pch=20)
text(user2008,user2008.y,"R-Forge announcement\nat useR 2008",
     adj=c(-0.2,0.5))

devtools.on.CRAN <- as.POSIXct("2011-06-22")
devtools.y <- with(sorted.projects,approx(registered,count,devtools.on.CRAN))$y
points(devtools.on.CRAN,devtools.y,pch=20, col="blue")
text(devtools.on.CRAN,devtools.y,"First devtools\non CRAN",
     adj=c(-0.2,0.5), col="blue")

last.line <- tail(sorted.projects,1)
last.date <- last.line$registered
axis(3,last.date,format(last.date,"%e %B %Y"))
axis(4,last.line$count,las=1)

dev.off()

