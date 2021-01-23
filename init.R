my_packages <- c("xml2","rvest","tidyverse","lubridate","stringi","rapportools",
                 "DBI","odbc","RSQLite","magrittr","dbplyr")
install_if_missing <- function(p) {
  if(p %in% rownames(installed.packages())==FALSE){
    install.packages(p)}
}

invisible(sapply(my_packages, install_if_missing))