
## Same code as before, except now we will loop through multiple different options for u, r, etc
## Outputs a new SLiM input file for each combination of parameter values

rm(list=ls(all=TRUE)) ## clear R environment

options(scipen = 999) ## scientific notation penalty


## choose working directory
setwd("/Users/russjasper/Dropbox/My Mac (Russs-MacBook-Air.local)/Desktop/BERN/Evolutionary_Rescue")

## choose number of reps for each parameter set
reps <- 5


## Choose ALL the different parameter values we are interested in
all_u <- c(1e-8, 1e-9)
all_r <- c(1e-8, 1e-9)

for(u in all_u){
for(r in all_r){

  ## File name for SLiM input file (this is what we will input into SLiM)
  sh_name <- paste0("SLiM_input_u",u,"_r",r,"_reps",reps,".txt")
  
  
  ## Make a code block for SLiM with your parameter values
  slim_code_block <- paste0("slim -d u=",u," -d r=",r," 02_Skeleton_SLiM.slim")
  
  ## Make a SLiM script
  ## Write your SLiM 'code block' to the script
  write ("#SLiM", sh_name)
  write (paste0("for rep in {1..",reps,"}"), sh_name, append = TRUE)
  write ("do", sh_name, append = TRUE)
  write (slim_code_block, sh_name, append = TRUE)
  write ("done", sh_name, append = TRUE)

}}

## This gives us a new SLiM input file for each combination of parameter values
  
## Copy/paste SLiM script into command line to run SLiM simulations
## Outputs a new results file from SLiM for however many reps you define above

