#' @useDynLib slider R_slide
#' @export
slide = function(trainfile, testfile, batchsize=1000, rehash=1000, rebuild=1000, input_dim=784, Lr=0.0001, epochs=5, stepsize=20, layers=3)
{
  check.is.posint(batchsize)
  check.is.posint(rehash)
  check.is.posint(rebuild)
  check.is.posint(input_dim)
  # Lr
  check.is.posint(epochs)
  check.is.posint(stepsize)
  check.is.posint(layers)
  
  trainfile = check_file(trainfile)
  testfile = check_file(testfile)
  
  addparam = function(name, val) paste0(name, "=", val, "\n")
  config = paste0(
    addparam("trainData", trainfile),
    addparam("testData", testfile),
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
    addparam("Sparsity", "1,0.005,1,1"),
    
    addparam("totRecords", 5000),
    addparam("totRecordsTest", 500),
    addparam("logFile", "/tmp/log.txt")
  )
  
  config_file = tempfile()
  cat(config, file=config_file)
  
  .Call(R_slide, c("./runme", config_file))
  
  unlink(config_file)
}
