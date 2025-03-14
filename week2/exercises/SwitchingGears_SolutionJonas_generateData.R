# Load necessary library
library(dplyr)

# Generate a random list of student names
set.seed(123)  # For reproducibility
names <- paste("Student", seq(1, 100))

# Generate random weights (between 45 kg and 100 kg)
weights <- round(runif(100, min = 45, max = 100), 1)

# Generate random heights (between 1.5 m and 2.0 m)
heights <- round(runif(100, min = 1.5, max = 2.0), 2)

# Create a data frame
student_data <- data.frame(Name = names, Weight = weights, Height = heights)

# Save the data to a TSV file
write.table(student_data, file = "../data4exercises/SwitchingGears_jonas_student_data.tsv", sep = "\t", row.names = FALSE)

# Display the first few rows of the generated data
head(student_data)

# generate a function to calculate ther BMI
calculate_bmi <- function(weight, height) {
  bmi <- weight / (height^2)
  return(bmi)
}

# Apply the function to the student data
student_data$BMI <- calculate_bmi(student_data$Weight, student_data$Height)

# plot
plot(student_data$Height, student_data$Weight, xlab = "Height (m)", ylab = "Weight (kg)", main = "Student Height vs. Weight")

# plot histogram of BMI
hist(student_data$BMI, xlab = "BMI", main = "Distribution of Student BMI", breaks = 20)

# obesity cutoff
obesity_cutoff <- 30

# what percentage is obese
obese_students <- student_data %>% filter(BMI >= obesity_cutoff)
obese_percentage <- nrow(obese_students) / nrow(student_data) * 100
cat("Percentage of students classified as obese:", obese_percentage, "%\n")

# indicate in a hist w/ colors which are obese but use ggplot for plotting
library(ggplot2)
# ggplot hist
ggplot(student_data, aes(x = BMI, fill = BMI >= obesity_cutoff)) +
  geom_histogram(binwidth = 1, color = "black") +
  scale_fill_manual(values = c("red", "blue"), labels = c("Obese", "Not Obese")) +
  labs(x = "BMI", y = "Frequency", title = "Distribution of Student BMI") +
  theme_minimal()


