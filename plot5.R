> getwd()
> NEI <- readRDS("summarySCC_PM25.rds")
> str(NEI)
> dim(NEI)
> head(NEI)
> SCC <- readRDS("Source_Classification_Code.rds")
> str(SCC)
> dim(SCC)
> head(SCC)


library(ggplot2)

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# Searching for ON-ROAD type in NEI
# Don't actually know it this is the intention, but searching for 'motor' in SCC only gave a subset (non-cars)
BaltimoreNEIOnRoad <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

TotalByYear <- aggregate(Emissions ~ year, BaltimoreNEIOnRoad , sum)



png("plot5.png", width=840, height=480)
g <- ggplot(TotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City')
print(g)
dev.off()