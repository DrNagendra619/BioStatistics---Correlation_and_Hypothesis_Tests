# ==============================================================================
# FILE NAME: Correlation_and_Hypothesis_Tests.R
# PURPOSE: Automated Parametric & Non-Parametric Statistical Analysis
# OUTPUT PATH: D:/DOWNLOADS
# ==============================================================================

# ------------------------------------------------------------------------------
# SETUP: Define Output Path & Logging
# ------------------------------------------------------------------------------
# Define the path where files will be saved
output_path <- "D:/DOWNLOADS"

# Check if directory exists, if not, create it
if(!dir.exists(output_path)){
  dir.create(output_path)
  message("Created directory: ", output_path)
}

# Set working directory
setwd(output_path)

# Start recording all console output to a text file
sink(file = "Analysis_Log_Results.txt", split = TRUE)

print(paste("Analysis started at:", Sys.time()))
print(paste("Script Name: Correlation_and_Hypothesis_Tests.R"))
print(paste("Saving all outputs to:", output_path))

# ==============================================================================
# PART 1: mtcars Dataset Analysis (Correlations)
# ==============================================================================
print("-----------------------------------")
print("PART 1: mtcars Correlation Analysis")
print("-----------------------------------")

# Load built-in dataset 
data(mtcars) 

# 1. Pearson Correlation (Parametric) 
# Measures linear correlation between two numeric variables 
# HO: correlation = 0 | H1: correlation != 0 
print("--- Pearson Correlation (mpg vs hp) ---")
print(cor.test(mtcars$mpg, mtcars$hp, method="pearson"))

# 2. Spearman Correlation (Non-parametric) 
# Rank-based correlation (monotonic relationships) 
print("--- Spearman Correlation (mpg vs hp) ---")
print(cor.test(mtcars$mpg, mtcars$hp, method="spearman"))

# 3. Kendall's Tau (Non-parametric) 
# Rank-based correlation, less sensitive to ties 
print("--- Kendall Correlation (mpg vs hp) ---")
print(cor.test(mtcars$mpg, mtcars$hp, method="kendall"))

# 4. Correlation Matrix & Visualization 
vars_mtcars <- mtcars[, c("mpg", "hp", "wt", "disp")] 

# Save Correlation Matrix to CSV
cor_matrix_mtcars <- cor(vars_mtcars, method="pearson")
write.csv(cor_matrix_mtcars, "mtcars_correlation_matrix.csv")
print("Saved: mtcars_correlation_matrix.csv")

# Visualization: Save to PNG
# Check if corrplot is installed, if not, install it
if(!require(corrplot)) install.packages("corrplot")
library(corrplot)

png(filename = "mtcars_corrplot.png", width = 800, height = 800)
corrplot(cor_matrix_mtcars, method="circle", title = "mtcars Correlation Matrix", mar=c(0,0,2,0))
dev.off() # Close the graphics device
print("Saved: mtcars_corrplot.png")


# ==============================================================================
# PART 2: iris Dataset Analysis (Hypothesis Testing)
# ==============================================================================
print("-----------------------------------")
print("PART 2: iris Dataset Analysis")
print("-----------------------------------")

# STEP 1: Load Data
data(iris) 
print("--- Structure of iris dataset ---")
str(iris) 

# STEP 2: Descriptive Statistics 
print("--- Summary of numeric variables ---")
print(summary(iris[, 1:4]))

# Save Group-wise mean by Species to CSV
group_means <- aggregate(Sepal.Length ~ Species, data=iris, mean) 
write.csv(group_means, "iris_species_means.csv", row.names = FALSE)
print("Saved: iris_species_means.csv")


# STEP 3: Parametric Tests 

# 3a. One-sample t-test (Test if mean Sepal.Length = 5.8)
print("--- One-sample t-test ---")
print(t.test(iris$Sepal.Length, mu=5.8))

# 3b. Independent two-sample t-test (setosa vs versicolor)
subset_data <- subset(iris, Species %in% c("setosa", "versicolor")) 
print("--- Two-sample t-test (Setosa vs Versicolor) ---")
print(t.test(Sepal.Length ~ Species, data=subset_data))

# 3c. One-way ANOVA (Compare Sepal.Length across all three species)
print("--- One-way ANOVA ---")
anova_model <- aov(Sepal.Length ~ Species, data=iris)
print(summary(anova_model)) 


# STEP 4: Non-Parametric Tests 

# 4a. Wilcoxon Signed Rank Test (One-sample) 
print("--- Wilcoxon Signed Rank Test ---")
print(wilcox.test(iris$Sepal.Length, mu=5.8))

# 4b. Mann-Whitney U Test (Two-sample) 
print("--- Mann-Whitney U Test ---")
print(wilcox.test(Sepal.Length ~ Species, data=subset_data))

# 4c. Kruskal-Wallis Test 
print("--- Kruskal-Wallis Test ---")
print(kruskal.test(Sepal.Length ~ Species, data=iris))

# 4d. Chi-Square Test 
# Create categorical variable: "Long" vs "Short" Sepal 
iris$SepalCat <- ifelse(iris$Sepal.Length > 5.8, "Long", "Short") 
tbl <- table(iris$SepalCat, iris$Species) 
print("--- Chi-Square Test ---")
print(tbl)
print(chisq.test(tbl)) 


# STEP 5: Correlation (iris)

# 5a/b. Pearson & Spearman
print("--- Iris Pearson Correlation ---")
print(cor.test(iris$Sepal.Length, iris$Petal.Length, method="pearson"))

# 5c. Correlation Matrix & Visualization
vars_iris <- iris[, 1:4] # numeric columns only 
cor_matrix_iris <- cor(vars_iris, method="pearson")
write.csv(cor_matrix_iris, "iris_correlation_matrix.csv")

# Save iris Heatmap
png(filename = "iris_corrplot.png", width = 800, height = 800)
corrplot(cor_matrix_iris, method="circle", title = "Iris Correlation Matrix", mar=c(0,0,2,0))
dev.off()
print("Saved: iris_corrplot.png")


# STEP 6: Visualization (Plots)

# 6a. Boxplot
png(filename = "iris_boxplot.png", width = 800, height = 600)
boxplot(Sepal.Length ~ Species, data=iris, 
        col=c("lightblue", "lightgreen", "lightpink"),
        main = "Boxplot of Sepal Length by Species")
dev.off()
print("Saved: iris_boxplot.png")

# 6b. Scatter plot with regression line 
png(filename = "iris_scatterplot.png", width = 800, height = 600)
plot(iris$Sepal.Length, iris$Petal.Length, pch=19, col="blue",
     main = "Scatter Plot: Sepal vs Petal Length",
     xlab = "Sepal Length", ylab = "Petal Length")
abline(lm(Petal.Length ~ Sepal.Length, data=iris), col="red", lwd=2) 
dev.off()
print("Saved: iris_scatterplot.png")

# ==============================================================================
# TEARDOWN
# ==============================================================================
# Stop logging to text file
sink()
message("Analysis Complete.")
message("Please check D:/DOWNLOADS for:")
message("1. Analysis_Log_Results.txt (Statistical Results)")
message("2. CSV Files (Data Tables)")
message("3. PNG Files (Plots)")

