
# function for merging r objects (chars, int, data.frame, ...) of different sizes
#

cbind_na <- function(..., first = TRUE) {

  ## check lsit of entry
  padNA <- function (mydata, rowsneeded, first = TRUE){
    temp1 = colnames(mydata)
    rowsneeded = rowsneeded - nrow(mydata)
    temp2 = setNames(
      data.frame(matrix(rep(NA, length(temp1) * rowsneeded),
                        ncol = length(temp1))), temp1)
    if (isTRUE(first)) rbind(mydata, temp2)
    else rbind(temp2, mydata)
  }

  ## create cols names
  dotnames <- function(...) {
    vnames <- names(as.list(substitute(list(...)))[-1L])
    vnames <- unlist(vnames, FALSE, FALSE)
    vnames
  }

  ##main of function
  Names <- dotnames(...)
  datalist <- setNames(list(...), Names)
  nrows <- max(sapply(datalist, function(x)
    ifelse(is.null(dim(x)), length(x), nrow(x))))
  datalist <- lapply(seq_along(datalist), function(x) {
    z <- datalist[[x]]
    if (is.null(dim(z))) {
      z <- setNames(data.frame(z), Names[x])
    } else {
      if (is.null(colnames(z))) {
        colnames(z) <- paste(Names[x], sequence(ncol(z)), sep = "_")
      } else {
        colnames(z) <- paste(Names[x], colnames(z), sep = "_")
      }
    }
    padNA(z, rowsneeded = nrows, first = first)
  })
  do.call(cbind, datalist)
}



# Burkina Function collect
#
source("C:/Users/aso.RCTS/Desktop/R_/afnewsAPI/zzz/bf_news_collecte.R")


