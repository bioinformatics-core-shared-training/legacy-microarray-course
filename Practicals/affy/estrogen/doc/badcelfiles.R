library(affy)
## library(estrogen)

datadir="/scratch/homes/rgentlem/Genetics/Iglehart"
fn = dir(datadir, pattern="CEL$")

rk = function(m) matrix(rank(m), nrow=nrow(m))
savejpg = function(x) {dev.copy(jpeg, quality=100, width=640, height=640, file=x); dev.off() }
par(ask=FALSE)

for (f in fn) {
  a = ReadAffy(filenames = file.path(datadir, f))
  image(a) ## , col=gentlecol(256))
  savejpg(paste(f, 1, "jpg", sep="."))
  image(a, transfo=rk) ## , col=gentlecol(256))
  savejpg(paste(f, 2, "jpg", sep="."))
  gc()
}
