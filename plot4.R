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

# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# fetch all NEIxSCC records with Short.Name (SCC) Coal
coal  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
CoalsubsetNEISCC <- NEISCC[coal, ]

TotalCoalByYear <- aggregate(Emissions ~ year, CoalsubsetNEISCC, sum)



png("plot4.png", width=640, height=480)
g <- ggplot(TotalCoalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()