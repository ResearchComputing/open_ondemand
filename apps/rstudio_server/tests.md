# Testing RStudio application 

The following are some simple tests that can be run to make sure that the RStudio application is 
working as expected. 


## Install a simple library and use it

```install.packages("plotly")
library(plotly)
fig <- plot_ly(midwest, x = ~percollege, color = ~state, type = "box")
fig```

* Should display the boxplot and be interactive in the "Viewer" tab

## Install a library that requires modification to overlay (here we install the library XVector)

First modify the overlay by connecting to it (here we use R version 4.4.1):

```
export r_app_version="4.4.1"
apptainer shell --fakeroot --bind /projects,$SCRATCHDIR,$CURC_CONTAINER_DIR_OOD --overlay /projects/$USER/.rstudioserver/rstudio-${r_app_version}/rstudio-server-${r_app_version}_overlay.img $CURC_CONTAINER_DIR_OOD/rstudio-server-${r_app_version}.sif
```

Now install necessary items:

```
apt-get update 
apt install zlib1g-dev
```

Exit the container and then start up RStudio. Once in RStudio install XVector:

```
install.packages("BiocManager")
library(BiocManager)
BiocManager::install("XVector")
```

Test out a code snippet:

```
library(XVector)
x3 <- XInteger(12, val=c(-1:10))
x3
```

Should produce:

```XInteger of length 12
 [1] -1  0  1  2  3  4  5  6  7  8  9 10
```

* Make sure all libraries went to `/projects/<user>/Rstudio_libs/<R-version>`
