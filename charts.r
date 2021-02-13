# Clear environment
rm(list = ls())

# Import libraries
library(ggplot2)
library(dplyr)

# Read in data
disbursements <- read.csv("JULY-SEPT-2020-SOD-SUMM-GRID-FINAL.csv",
                          header=TRUE, sep=",")

# Data wrangling
disbursements_ordered_by_program_perc_top_10 <- disbursements %>%
  group_by(disbursements$PROGRAM) %>%
  summarise(sum=sum(QTD.AMOUNT)) %>%
  arrange(desc(sum)) %>%
  mutate(perc=100*sum/sum(sum)) %>%
  top_n(10, perc)

disbursements_interns <- filter(disbursements,
                                disbursements$PROGRAM=="INTERN ALLOWANCES") %>%
  group_by(ORGANIZATION) %>%
  summarise(sum=sum(QTD.AMOUNT)) %>%
  arrange(desc(sum))

# Amount spent on intern allowances by office, top ten chart
ggplot(top_n(disbursements_interns, 10, sum),
       aes(x=reorder(ORGANIZATION, -sum), y=sum)) +
  geom_bar(stat="identity") +
  theme(axis.text.x=element_text(angle=90, vjust=0.5, hjust=1)) +
  xlab("Office") +
  ylab("Money spent on intern allowances") +
  ggtitle("Amount spent on intern allowances by office, top ten") +
  theme(plot.title=element_text(hjust = 0.5)) +
  geom_text(aes(label=sum), position=position_dodge(width=0.9), vjust=-0.25)

ggsave("intern_allowances.png",
  width = 8,
  height = 8,
  units = "in")

# Percentage of disbursements by program, top ten chart
ggplot(disbursements_ordered_by_program_perc_top_10,
  aes(x=reorder(`disbursements$PROGRAM`, -perc), y=perc)) +
  geom_bar(stat="identity") +
  theme(axis.text.x = element_text(angle=90, vjust=0.5, hjust=1)) +
  xlab("Program") + ylab("Percentage of disbursements") +
  ggtitle("Percentage of disbursements by program, top ten") +
  theme(plot.title=element_text(hjust=0.5)) +
  geom_text(aes(label=round(perc, digits=2)),
            position=position_dodge(width=0.9), vjust=-0.25)

ggsave("disbursements_by_program.png",
  width = 8,
  height = 8,
  units = "in")
