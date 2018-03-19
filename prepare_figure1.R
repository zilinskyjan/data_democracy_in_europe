library(ggplot2)
library(tidyverse)

## Load the data

d <- tibble(
  wave = c("2002-03","2004-05","2006-07","2008-09","2010-11","2012-13","2014-15","2016-17"),
  g1824 = c(5.7,5.5,5.5,5.1,5.2,5.5,5.7,6.0),
  g2534 = c(5.5,5.4,5.3,4.9,4.8,5.1,5.2,5.4),
  g3564 = c(5.5,5.3,5.2,4.8,4.7,5.1,5.2,5.4),
  g65plus = c(5.6,5.4,5.3,4.8,4.8,5.3,5.2,5.5))

## Gather ("melt"; wide-to-long) the data
d_m <- gather(d,age_group,d_sentiment,g1824:g65plus)
d_m$age_group[d_m$age_group=="g1824"] <- "18 to 24"
d_m$age_group[d_m$age_group=="g2534"] <- "24 to 34"
d_m$age_group[d_m$age_group=="g3564"] <- "35 to 64"
d_m$age_group[d_m$age_group=="g65plus"] <- "65 and over"
```

## Prepare the chart

```{r}
gg <- ggplot(data = d_m, aes(x=wave, 
                             y=d_sentiment,
                             group=age_group)) +
  labs(x = "Survey years",
       y = "Democraty rating (0-10)",
       title = "How satisfied are you with the way democracy works in [country]?",
       linetype="Age group")

gg + geom_line(aes(linetype=age_group)) + theme(aspect.ratio=.75) 