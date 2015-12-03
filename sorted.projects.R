if(!file.exists("project.stats.csv")){
  download.file("http://r-forge.r-project.org/scm/viewvc.php/*checkout*/tex/2011-06-09-ibl/project.stats.csv?revision=402&root=inlinedocs", "project.stats.csv")
}

sorted.projects <- read.csv("project.stats.csv",header=TRUE, 
                            colClasses=c("POSIXct","factor","integer"))
sorted.projects$count <- 1:nrow(sorted.projects)
sorted.projects$year <- as.integer(strftime(sorted.projects$registered, "%Y"))
sorted.projects$month <- as.integer(strftime(sorted.projects$registered, "%m"))
sorted.projects$reg.month <- with(sorted.projects, year + (month-1)/12)

save(sorted.projects, file="sorted.projects.RData")
