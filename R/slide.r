#' slide
#' 
#' TODO
#' 
#' @param trainfile,testfile
#' TODO
#' @param logfile
#' TODO
#' @param batchsize
#' TODO
#' @param rehash
#' TODO
#' @param rebuild
#' TODO
#' @param input_dim
#' TODO
#' @param Lr
#' TODO
#' @param epochs
#' TODO
#' @param stepsize
#' TODO
#' @param layers
#' TODO
#' 
#' @importFrom filesampler wc_l
#' @useDynLib slider R_slide
#' @export
slide = function(trainfile, testfile, logfile="/tmp/log.txt", batchsize=1000,
  rehash=1000, rebuild=1000, input_dim=784, Lr=0.0001, epochs=5, stepsize=20,
  layers=3)
{
  check.is.posint(batchsize)
  check.is.posint(rehash)
  check.is.posint(rebuild)
  check.is.posint(input_dim)
  # TODO Lr
  check.is.posint(epochs)
  check.is.posint(stepsize)
  check.is.posint(layers)
  
  trainfile = check_file(trainfile)
  testfile = check_file(testfile)
  
  wc_train = filesampler::wc_l(trainfile) - 1
  wc_test = filesampler::wc_l(testfile) - 1
  
  addparam = function(name, val) paste0(name, "=", val, "\n")
  config = paste0(
    addparam("trainData", trainfile),
    addparam("testData", testfile),
    addparam("totRecords", wc_train),
    addparam("totRecordsTest", wc_test),
    addparam("logFile", logfile),
    
    addparam("Batchsize", batchsize),
    addparam("Rehash", rehash),
    addparam("Rebuild", rebuild),
    addparam("InputDim", input_dim),
    addparam("Lr", Lr),
    addparam("Epoch", epochs),
    addparam("Stepsize", stepsize),
    addparam("numLayer", layers),
    
    addparam("sizesOfLayers", "128,670091"),
    addparam("K", "2,6"),
    addparam("L", "20,50"),
    addparam("RangePow", "6,18"),
    addparam("Sparsity", "1,0.005,1,1")
  )
  
  config_file = tempfile()
  cat(config, file=config_file)
  
  .Call(R_slide, c("./runme", config_file))
  
  unlink(config_file)
}
