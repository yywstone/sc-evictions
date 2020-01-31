# Search path
VPATH = data data-raw eda reports scripts

# Processed data files
DATA = cities.rds boundaries.rds joined.rds

# EDA studies
EDA = eda.md

# Reports
# REPORTS =

# All targets
all : $(DATA) $(EDA) $(REPORTS)

# Data dependencies
joined.rds : cities.rds boundaries.rds

# EDA study and report dependencies
eda.md : joined.rds

# Pattern rules
%.rds : %.R
	Rscript $<
%.md : %.Rmd
	Rscript -e 'rmarkdown::render(input = "$<", output_options = list(html_preview = FALSE))'
