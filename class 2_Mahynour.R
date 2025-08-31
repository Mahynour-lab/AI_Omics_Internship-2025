# ===============================
# 1. Operators
# ===============================

# Arithmetic operators
x <- 10
y <- 3
x + y      # Addition
x - y      # Subtraction
x * y      # Multiplication
x / y      # Division
x ^ y      # Power

# Relational operators
x > y      # Greater than
x < y      # Less than
x == y     # Equal
x != y     # Not equal

# Logical operators
(x > 5) & (y < 5)   # AND
(x > 5) | (y > 5)   # OR
!(x > y)            # NOT

# ===============================
# 2. Data Structures
# ===============================

# Vector
genes <- c("GeneA", "GeneB", "GeneC", "GeneD")
values <- c(5.2, 3.8, 6.1, 2.9)

# Matrix
mat <- matrix(values, nrow=2, ncol=2)

# List
my_list <- list(genes=genes, values=values, matrix=mat)

# Data Frame (using your CSV file)
read.csv("C:\\Users\\computer\\Downloads\\DEGs_Data_1.csv")

head(df)   # Preview first rows
str(df)    # Check structure

# ===============================
# 3. Functions
# ===============================

# Example: Function to calculate fold change
fold_change <- function(up, down) {
  return(up / down)
}

# Test function
fold_change(100, 25)

# Example: Function on dataset
mean_expression <- function(df, column) {
  return(mean(df[[column]], na.rm=TRUE))
}

# Use with your dataset (replace with correct column name)
# mean_expression(df, "ExpressionValue")

# ===============================
# 4. for-Loop
# ===============================

# Loop through a vector
for (g in genes) {
  print(paste("Analyzing gene:", g))
}

# Loop over dataset column (replace 'Gene' with actual column name)
for my_list[1, ]      # first row
my_list[1:5, ]    # first 5 rows
my_list[ , 1]     # first column

# Apply function in loop
results <- c()
for (val in values) {
  results <- c(results, val^2)   # Square each value
}
print(results)

