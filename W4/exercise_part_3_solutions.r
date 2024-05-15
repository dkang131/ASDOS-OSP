### solutions to the excersises from the day 3 of SPL

#######
# No.1 & No.2
#######################

# set working directory

tab    = read.table("dax30.txt", sep="", dec=",")
labels = as.numeric( format( as.Date(tab[,1], "%d/%m/%Y"), "%Y")  )

# put labels where the year chages
where.put = c(1, which(diff(labels) == 1) + 1)

# R <- diff(tab[,2])    # returns
R <- diff(log(tab[,2])) # log returns

# Plot DAX index
pdf("dax30_index.pdf", width=8, height=6)      #simularily for .png (slide 4)

  plot(tab[,2], type = "l", lwd = 2, lty = 1, pch=16, col = "blue3", 
       frame=T, axes=F, xlab="Datum", ylab="DAX")

  abline(h=seq(1000,8000,by=500), lty="dotted", lwd=0.5, col="grey")
  abline(v=where.put, lty="dotted", lwd=0.5, col = "grey")
  #y axis
  axis(side=2, at=seq(1000,8000,by=500), label=seq(1000,8000,by=500), lwd=1) 
  #x axis
  axis(side=1, at=where.put, label=labels[where.put], lwd=0.5)    

dev.off()

# Plot log return
pdf("dax30_rate.pdf", width=8, height=6)  #simularily for .png (slide 4)
    plot(R, type = "l", lwd = 2, lty = 1, pch = 16, col = "blue3", 
         frame = TRUE, axes = FALSE, xlab = "Datum", 
         ylab = expression(R[t]))   
    abline(h=seq(-0.15, 0.1, by = 0.025), lty="dotted", lwd=0.5, col = "grey")
    abline(v=where.put, lty="dotted", lwd=0.5, col = "grey")
    #y axis
    axis(side=2, at=seq(-0.15, 0.1, by = 0.025), label=seq(-0.15, 0.10, by = 0.025), lwd=1)    
    #x axis
    axis(side=1, at=where.put, label=labels[where.put], lwd=0.5)
dev.off()

# Plot return distribtion
pdf("dax30_distribution.pdf", width=8, height=6)
   k <- hist(R, breaks=44, freq=F, col="yellow2", 
              xlim=c(-0.075, 0.075), main="", ylab="Dichte")   
   lines(density(R, bw=0.01, na.rm=T, kernel="epanechnikov"), 
          col="blue3", lwd=2)   
   range <- seq(-0.15, 0.15, by = 0.001)    
   m     <- mean(R)    
   sdd   <- sd(R)
   lines(range, dnorm(range, m, sdd), type="l", lwd=2, col="red3")    
   lines(range, dt((range-m)/sdd, 5)/sdd, type="l", lwd=2, col="green3") 
   legend(-0.07, 40, c("Histogram", "Epanechnikov ", "Normal", 
                       "t-Vert.,5 df"), 
      lty=1, lwd=3, col=c("yellow2", "blue3", "red3", "green3"), bg="white")
dev.off()

##############
# No.3
#################################

tab = read.table("dax30.txt",sep="",dec=",")
new.data = tab[1:10,]
write.csv(new.data, "10dax30.csv")


##############
# No.4
#################################
#Interactive normal distribution
#################################

# install.packages("rpanel")

library(rpanel)

plot.dice = function(panel) {
        plot( function(x) 
                dnorm(x, mean = panel$mean1, sd = panel$sd1), 
                col = "red3", lwd = 3, xlim = c(-4,4), ylim = c(0,0.6), 
                xlab = "", ylab = "")
        
        panel
}

panel = rp.control(title = "Normal Distribution")

rp.slider(panel, mean1, -4, 4, log = FALSE, action = plot.dice, 
          showvalue = TRUE, title = "mu", initval = 0)

rp.slider(panel, sd1, 0.5, 3, log = FALSE, action = plot.dice, 
          showvalue = TRUE, title = "sd", initval = 1)




