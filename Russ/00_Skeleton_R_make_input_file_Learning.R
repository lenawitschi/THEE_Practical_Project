
## Here you choose specific values for each parameter of interest
## Output a SLiM file that will run x number of reps with the parameter values you choose


rm(list=ls(all=TRUE)) ## clear R environment

options(scipen = 999) ## scientific notation penalty


## choose working directory
setwd("/Users/russjasper/Dropbox/My Mac (Russs-MacBook-Air.local)/Desktop/BERN/Evolutionary_Rescue")



## Parameters
## These are the parameters we 'soft-coded' in SLiM that we will chose values for in R
u <- 1e-8
r <- 1e-8
reps <- 5


## File name for SLiM input file (this is what we will input into SLiM)
sh_name <- paste0("SLiM_input_u",u,"_r",r,"_reps",reps,".txt")


## Make a code block for SLiM with your parameter values
slim_code_block <- paste0("slim -d u=",u," -d r=",r," 03_Skeleton_SLiM.slim")

## Make a SLiM script
## Write your SLiM 'code block' to the script
write ("#SLiM", sh_name)
write (paste0("for rep in {1..",reps,"}"), sh_name, append = TRUE)
write ("do", sh_name, append = TRUE)
write (slim_code_block, sh_name, append = TRUE)
write ("done", sh_name, append = TRUE)

## Copy/paste SLiM script into command line to run SLiM simulations
## Outputs a new results file from SLiM for however many reps you define above

