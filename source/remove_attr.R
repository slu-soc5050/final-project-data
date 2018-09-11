remove_attr <- function(x) {
  for (i in length(x)) attr(x[[i]], "value.labels") <- NULL
  x <- as.data.frame(x)
  return(x)
}
