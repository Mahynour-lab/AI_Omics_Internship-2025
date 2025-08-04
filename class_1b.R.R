# check current directory
getwd()

# set work directory
setwd("C:/Users/computer/OneDrive/Desktop/AI_Omics_Internship_2025")

dir.create("raw_data")
dir.create("clean_data")
dir.create("scripts")
dir.create("results")
dir.create("plots")

# Load the dataset
patient_Info <- read.csv("C:/Users/computer/Downloads/patient_info.csv")

# View data structure
str("patient_Info")

# View data in a spreadsheet-like format
View("patient_Info")

# Gender to factor
patient_Info$gender <- as.factor("patient_info$gender")

# Diagnosis to factor
patient_Info$diagnosis <- as.factor("patient_Info$diagnosis")

# Smoker to factor
patient_Info$smoker <- as.factor("patient_Info$smoker")

# BMI should be numeric, confirm
class("patient_Info$bmi")

# Create smoker_bin: 1 if smoker, 0 if not
patient_Info$smoker_bin <- as.factor(patient_Info$smoker_bin)

# Convert to factor
patient_Info$smoker_bin <- as.factor("patient_Info$smoker_bin")

# Save cleaned data in clean_data folder
write.csv(patient_Info, file = "clean_data/patient_info_clean.csv", row.names = FALSE)

# Save selected objects
save(patient_Info, file = "results/patient_Info_workspace.RData")

# Save full workspace
save.image(file = "results/full_workspace.RData")

# Plot BMI distribution
hist(patient_Info$bmi, 
     main = "BMI Distribution", 
     xlab = "BMI", 
     col = "skyblue", 
     border = "white")

# Barplot of smoker status
barplot(table(patient_Info$smoker), 
        main = "Smoker Status", 
        col = c("orange", "red"))

save.image(file= "full_workspace.Rdata")
