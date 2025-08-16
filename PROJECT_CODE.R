# Task 2
library(patchwork)
library(readr)
library(forecast)
library(e1071)
library(randomForest)
library(Metrics)
library(dplyr)
library(ggplot2)
library(tidyr)

# Load data
data <- read_csv("C:\\Users\\Abdullah\\Desktop\\AbdullahsFolder\\Semester4\\advstats\\AN_FOLDER\\Usa_inflation_data.csv")


# Clean column names (remove spaces and trailing underscores)
names(data) <- trimws(names(data))

# Print data summary
print(summary(data))

# Mode function
get_mode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

# Calculate modes
modes <- sapply(data, get_mode)
print("Modes of each variable:")
print(modes)


#     TASK 3


# Rename to avoid conflict
df <- data

# Remove 'Year' column
data_box <- df[, !(names(df) %in% c("Year"))]

# Standardize data (z-score: mean = 0, sd = 1)
data_scaled <- as.data.frame(scale(data_box))

# Convert wide data to long format
data_long <- pivot_longer(data_scaled, cols = everything(), names_to = "Variable", values_to = "Value")

# Create boxplot
ggplot(data_long, aes(x = Variable, y = Value, fill = Variable)) +
  geom_boxplot(outlier.colour = "yellow", outlier.shape = 8) +
  theme_minimal() +
  labs(title = "Standardized Box and Whisker Plot for All Variables",
       x = "Variables",
       y = "Standardized Values") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_discrete(guide = FALSE)




# Task 4

# Scatter Plot 1: Avg Hourly Earnings
plot1 <- ggplot(data, aes(x = Year, y = Avg_wage)) +
  geom_point(color = "steelblue") +
  labs(title = "Avg_Wage", y = "Earnings ($)", x = "Year") +
  theme_minimal()

# Scatter Plot 2: Money Supply (M2)
plot2 <- ggplot(data, aes(x = Year, y = M2SL)) +
  geom_point(color = "firebrick") +
  labs(title = "Money Supply (M2)", y = "Billions USD", x = "Year") +
  theme_minimal()

# Scatter Plot 3: WTI Oil Prices
plot3 <- ggplot(data, aes(x = Year, y = Oil_Price_WTI)) +
  geom_point(color = "forestgreen") +
  labs(title = "WTI Oil Prices", y = "Price per Barrel", x = "Year") +
  theme_minimal()

# Scatter Plot 4: USD Exchange Rate
plot4 <- ggplot(data, aes(x = Year, y = USD_Exchange_Rate)) +
  geom_point(color = "mediumorchid") +
  labs(title = "USD Exchange Rate", y = "Exchange Rate", x = "Year") +
  theme_minimal()

# Scatter Plot 5: Federal Funds Rate
plot5 <- ggplot(data, aes(x = Year, y = Federal_Funds_Rate)) +
  geom_point(color = "cadetblue") +
  labs(title = "Federal Funds Rate", y = "Rate (%)", x = "Year") +
  theme_minimal()

# Scatter Plot 6: CPI
plot6 <- ggplot(data, aes(x = Year, y = CPIAUCNS)) +
  geom_point(color = "gray20") +
  labs(title = "Consumer Price Index", y = "Index", x = "Year") +
  theme_minimal()

# Scatter Plot 7: Unemployment Rate
plot7 <- ggplot(data, aes(x = Year, y = Unemployement_Rate)) +
  geom_point(color = "chocolate4") +
  labs(title = "Unemployment Rate", y = "%Unemployement", x = "Year") +
  theme_minimal()

# Scatter Plot 8: Inflation Expectations
plot8 <- ggplot(data, aes(x = Year, y = Inflation_Expectation)) +
  geom_point(color = "darkorange") +
  labs(title = "Inflation Expectations", y = "%Inflation", x = "Year") +
  theme_minimal()

# Combine plots
(plot1 | plot2) / (plot3 | plot4) / (plot5 | plot6) / (plot7 | plot8)



# Task 5


# Extract target and independent features
y <- data[["Inflation_Expectation"]]
X <- data[, !(names(data) %in% c("Year", "Inflation_Expectation"))]

# ---------------------------
# Task 5: ARIMA, SVM, RF Models
# ---------------------------

# Convert to time series
Inflation_Expectation <- ts(y, start = min(data$Year), frequency = 1)

# ARIMA Model
arima_model <- auto.arima(Inflation_Expectation)
arima_fitted <- fitted(arima_model)
target_variable <- y

# ARIMA Metrics
arima_r2 <- 1 - sum((arima_fitted - target_variable)^2) / sum((target_variable - mean(target_variable))^2)
cat("ARIMA R²:", round(arima_r2, 4), "\n")
cat("ARIMA RMSE:", rmse(target_variable, arima_fitted), "\n")
cat("ARIMA MAE :", mae(target_variable, arima_fitted), "\n")

# ARIMA Plot
plot(target_variable, type = "l", col = "blue", lwd = 2,
     main = "ARIMA: Actual vs Fitted", ylab = "Inflation", xlab = "Year Index")
lines(1:length(arima_fitted), arima_fitted, col = "red", lwd = 2)
legend("topleft", legend = c("Actual", "Fitted"), col = c("blue", "red"), lwd = 2)

# SVM Model
svm_model <- svm(X, y)
svm_preds <- predict(svm_model, X)
svm_r2 <- 1 - sum((y - svm_preds)^2) / sum((y - mean(y))^2)
cat("SVM R^2:", round(svm_r2, 4), "\n")

# SVM Plot
plot(y, type = "l", col = "blue", lwd = 2,
     main = "SVM: Actual vs Predicted", ylab = "Inflation", xlab = "Year Index")
lines(1:length(svm_preds), svm_preds, col = "darkgreen", lwd = 2)
legend("topleft", legend = c("Actual", "Predicted"), col = c("blue", "darkgreen"), lwd = 2)

# Random Forest Model
rf_model <- randomForest(X, y)
rf_preds <- predict(rf_model, X)
rf_r2 <- 1 - sum((y - rf_preds)^2) / sum((y - mean(y))^2)
cat("Random Forest R^2:", round(rf_r2, 4), "\n")

# Random Forest Plot
plot(y, type = "l", col = "blue", lwd = 2,
     main = "Random Forest: Actual vs Predicted", ylab = "Inflation", xlab = "Year Index")
lines(1:length(rf_preds), rf_preds, col = "purple", lwd = 2)
legend("topleft", legend = c("Actual", "Predicted"), col = c("blue", "purple"), lwd = 2)



