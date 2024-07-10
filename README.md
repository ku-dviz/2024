# Data visualization and storytelling

Materials for the "Data visualization and storytelling" PhD course, Fall 2024, University of Copenhagen

Teachers: Kaustubh Chakradeo, Jacob Curran-Sebastian, Neil Scheidwasser, Samir Bhatt

## Setup

### Install R

* Download:
  * Windows: <https://cran.r-project.org/bin/windows/base/R-4.3.1-win.exe>
  * Mac (arm64; M1/M2 Macs): <https://cran.r-project.org/bin/macosx/big-sur-arm64/base/R-4.3.1-arm64.pkg>
  * Mac (x86): <https://cran.r-project.org/bin/macosx/big-sur-x86_64/base/R-4.3.1-x86_64.pkg>
  * Linux (Ubuntu): follow the instrcctions at <https://cran.r-project.org/bin/linux/ubuntu/>
* Follow the steps after running the executable file to install
* Check: open a terminal (in Windows, Command Prompt) and type ```R``` --> it should open an R console

### Install RStudio

* Go to the RStudio website: <https://posit.co/download/rstudio-desktop/>
* Scroll down and download the appropriate version depending on your OS.
* Check: open RStudio, and check that the R version is the same as the one you installed

### Install R Markdown

* We will use Rmarkdown to generate formated documents where text and code can be combined
* Installation:

```R
install.packages('rmarkdown')
```

* Optional: use tinytex to generate PDFs using LaTeX

```R
install.packages('tinytex')
tinytex::install_tinytex()
```

### Data analysis and visualization packages

A basic setup with a comprehensive set of packages for scientific computing and data visualisation can be installed via the ```tidyverse``` package:

```R
install.packages('tidyverse')
```

If you prefer to have a minimal setup, you can install the following packages that we will use in this course.
Basic data analysis:

```R
install.packages('dplyr')
install.packages('Hmisc')
```

For static visualisation:

```R
install.packages('ggplot2')
install.packages('ggmap') # Maps
install.packages('daggity') # Networks
install.packages('pheatmap') # Heatmaps
install.packages('gridExtra') # Subplots
install.packages('RColorBrewer') # More colours
```

For interactive visualisation:

```R
install.packages('plotly')
install.packages('shiny')
```
