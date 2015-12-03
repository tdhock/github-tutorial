README.html: README.org figure-R-Forge-registrations-per-month.png figure-R-Forge-projects-cumulative.png
	pandoc -f org -t html README.org > README.html
figure-R-Forge-registrations-per-month.png: figure-R-Forge-registrations-per-month.R sorted.projects.RData
	R --no-save < $<
figure-R-Forge-projects-cumulative.png: figure-R-Forge-projects-cumulative.R sorted.projects.RData
	R --no-save < $<
sorted.projects.RData: sorted.projects.R
	R --no-save < $<
