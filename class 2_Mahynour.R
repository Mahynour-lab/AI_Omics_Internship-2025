install.packages("downloader")
library(downloader)
raw_url = "https://raw.githubusercontent.com/AI-Biotechnology-Bioinformatics/AI_and_Omics_Research_Internship_2025/refs/heads/main/DEGs_Data_1.csv"
file_name = "DEGs_Data_1.csv"
download(url = raw_url, destfile = file_name)
data = read.csv("DEGs_Data_1.csv")
raw_url2 = "https://raw.githubusercontent.com/AI-Biotechnology-Bioinformatics/AI_and_Omics_Research_Internship_2025/refs/heads/main/DEGs_Data_2.csv"
file_name2 = "DEGs_Data_2.csv"
download(url = raw_url2, destfile = file_name2)
data2 = read.csv("DEGs_Data_2.csv")

# 1. Define a function to classify genes
classify_gene = function(logFC, padj){
  if(logFC > 1 & padj < 0.05){
    return("Upregulated")
  } else if (logFC < -1 & padj < 0.05){
    return("Downregulated")
  } else {
    return("Not_Significant")
  }
}

# 2. Set input and output directories
input_dir <- "Raw_Data"
output_dir <- "Results"
if(!dir.exists(output_dir)){
  dir.create(output_dir)
}
# 3. List of files to process
files_to_process <- c("DEGs_Data_1.csv", "DEGs_Data_2.csv") 
result_list <- list()
for ("DEGs_Data_1.csv", "DEGs_Data_2.csv" in files_to_process) {
  cat("\nProcessing:", "DEGs_Data_1.csv", "DEGs_Data_2.csv", "\n")
  
  input_file_path <- file.path(input_dir, "DEGs_Data_1.csv", "DEGs_Data_2.csv")

  # Handle missing padj values (replace with 1)
  data$padj[is.na(data$padj)] <- 1
  # Apply classify_gene() to each row
  data$status <- mapply(classify_gene, data$logFC, data$padj)
  # Save results in list
  results_list[[file_name]] <- data
  # Save results to CSV
  output_dir <- file.path(output_dir, paste0("results", "DEGs_Data_1.csv", "DEGs_Data_2.csv"))
  write.csv(data, output_dir, row.names = FALSE)
  cat("Results saved to:", output_dir, "\n")
}


results_1 <- results_list[["DEGs_Data_1.csv"]]
results_2 <- results_list[["DEGs_Data_2.csv"]]

# Handle missing padj values (replace with 1)
data2$padj[is.na(data2$padj)] <- 1
# Apply classify_gene() to each row
data2$status <- mapply(classify_gene, data2$logFC, data2$padj)
# Save results in list
results_list[[file_name2]] <- data2
# Save results to CSV
output_dir <- file.path(output_dir, paste0("results", "DEGs_Data_2.csv"))
write.csv(data2, output_dir, row.names = FALSE)
cat("Results saved to:", output_dir, "\n")
    
results_2 <- results_list[["DEGs_Data_2.csv"]]

