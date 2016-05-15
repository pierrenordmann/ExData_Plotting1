# The objective of this script is to create a png file with a plot in it

# To do so, we will first read the file containing the data that we will use in the plot
      # A preliminary task is needed before reading this file - you need to download the file and copy it in your ./Data folder
      # you can download the file at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
      
      # We dont need all the lines in the file : we only need data of Feb 1st 2007 and  Feb 2nd 2007
      # So we skip a few rows and then read only the rows we are intereste in
      power_consumption <- read.csv(file = "./Data/household_power_consumption.txt",sep=";",
                                    skip = 66636, nrows = 2880)
      
      # The operation of skipping a few rows messed up the variable names, so we read only the first line of the file
      # and then assign the variable names to our complete dataframe
      power_consumption_header <- read.csv(file = "./Data/household_power_consumption.txt",sep=";",nrows=1)
      
      names(power_consumption) <- names(power_consumption_header)
      
      # We create a column that concatenates date and time
      power_consumption$DateandTime <- paste(power_consumption$Date, power_consumption$Time)
      # We convert this newly created column to a nice time format
      power_consumption$DateandTime <- strptime(power_consumption$DateandTime, "%d/%m/%Y %H:%M:%S")

# Now let's move to the plot part
      # We set the margins so that it displays nicely
      par(mar = c(4,5,4,1))
      
      # We set the file to which we will export our plot
      png(filename = "./plot1.png", width = 480, height = 480)
      # Here comes the plot itself
      hist(power_consumption$Global_active_power,col = "red", 
           main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
      dev.off()
      