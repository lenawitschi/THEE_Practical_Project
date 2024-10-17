
## Now SLiM has finished
## Read in results from SLiM and analyze
## Record your analyses results

rm(list=ls(all=TRUE)) ## clear R environment

## choose working directory
setwd("/Users/russjasper/Dropbox/My Mac (Russs-MacBook-Air.local)/Desktop/BERN/Evolutionary_Rescue")

## all SLiM output files
slim_out_files <- list.files(pattern = "slim_muts_output")

## make a dataframe to collect results
## each row in the dataframe corresponds to the results from a single SLiM simulation run
## you can add additional columns to the dataframe here if you want to record multiple different metrics (change dim size and dimnames)
results_df <- data.frame(array(NA, dim = c(length(slim_out_files),4), dimnames = list(c(),c("u","r","metric","seed"))))

for(i in 1:length(slim_out_files)){ ## loop over all SLiM results files
  
  single_file <- slim_out_files[i] ## this is the name of a single SLiM result file
  
  get_the_u <- as.numeric(gsub(".*_u|_r.*","",single_file)) ## here we use gsub() to get the value of 'u' that we saved in the name of the results file
  
  get_the_r <- as.numeric(gsub(".*_r|_seed.*","",single_file)) ## as.numeric() converts the value (which is a string) into a number
  
  get_the_seed <- as.numeric(gsub(".*_seed|\\.csv","",single_file))
  
  single_file_df <- read.csv(slim_out_files[i], sep=" ", header=F, stringsAsFactors=F) ## read the data in the SLiM results file into R
  
  ## add in column names here - I was too lazy
  colnames(single_file_df) <- c("")
  
  ## calculate whatever metrics you want, eg, allele frequency, Fst, etc
  ## patch 1 mutations
  patch_1 <- single_file_df[single_file_df[,5]=="p1",]
  ## patch 2 mutations
  patch_2 <- single_file_df[single_file_df[,5]=="p2",]
  
  ## you guys calculate what you want here ##
  #metric <- 

    
  results_df[i,"u"] <- get_the_u ## record the value of 'u' for this particular results file
  
  results_df[i,"r"] <- get_the_r ## record the value of 'r' for this particular results file
  
  results_df[i,"seed"] <- get_the_seed ## record the seed for this particular results file (this lets us keep track of individual reps of a give parameter combination), ie, maybe we did 5 reps of u=1e-8 and r=1e-8, so we will have 5 rows for these specific parameter values
  
  results_df[i,"metric"] <- metric ## record your metric of choice
  
}


## choose working directory
## write your results to disc
setwd("/Users/russjasper/Dropbox/My Mac (Russs-MacBook-Air.local)/Desktop/BERN/Evolutionary_Rescue")
write.csv(results_df, "Example_Results.csv", row.names = F)





