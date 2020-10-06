investment_value<-function(x,y,z=0.95, different_years=c(3,5)){
  # Computes the value of an investment x after 10 years,
  # if there is an annual growth rate of y. Except that in 
  # years 3 and 5, there is a different growth rate of z.
  # Add the new command here for testing purpose
  if(!(is.numeric(x) && is.numeric(y) && is.numeric(z))){
    stop("Please double check on your inputs, x, y and z should all be numbers!")
  }
  multiplier = 1 + y
  different_multiplier = 1 + z
  beginning_x=x
  for(i in 1:10){
    # Bug 1: in this case, i is not looping through 1 to 10 but 2 to 11
    # i=i+1
    if (!(i %in% different_years)){      # should be true unless i is in the different_years vector
      # Bug 2: beginnign_x is not changing
      beginning_x<-beginning_x*multiplier
    } else {
      # In the different years we had a recession
      # Bug 3: the diff year is not multiplied by the correct user-input
      beginning_x<-beginning_x*different_multiplier#.96
    }
  }
  return(beginning_x)
}
