# 📈 Forecasting Inflation in the United States (1985–2024)

*A Comparative Analysis Using ARIMA, SVM, and Random Forest Models*

---

## 🎯 **Project Overview**

This research project presents a comprehensive analysis of U.S. inflation dynamics spanning nearly four decades, comparing traditional econometric approaches with cutting-edge machine learning techniques. Through rigorous statistical modeling, we explore how different methodologies capture the complex relationships between inflation and key macroeconomic indicators.

### **Key Highlights**
- **📊 Dataset**: 40 years of U.S. macroeconomic data (1985-2024)
- **🤖 Models**: ARIMA, Support Vector Machines, Random Forest
- **🎯 Best Performance**: Random Forest achieved **96.05% accuracy** (R² = 0.9605)
- **💡 Key Insights**: Oil prices, money supply, and Federal Funds Rate identified as primary inflation drivers

---

## 👥 **Research Team**

| Name | Student ID | Role |
|------|------------|------|
| **M Abdullah Nadeem** | 23I-2522 | Lead Data Scientist |
| **Salar Khan** | 23I-2607 | Statistical Modeling |
| **Talha Zaheer** | 23I-2609 | Economic Analysis |

*Department of Data Science*  
*National University of Computer and Emerging Sciences (FAST)*  
*Spring 2025*

---

## 🔬 **Research Methodology**

### **Data Sources**
- **Federal Reserve Economic Data (FRED)**
- **International Monetary Fund (IMF)**
- **Frequency**: Annual observations
- **Time Span**: 1985-2024 (40 years)

### **Variables Analyzed**
| Variable | Description | Impact on Inflation |
|----------|-------------|-------------------|
| **Oil Price (WTI)** | West Texas Intermediate crude oil price | 🔴 **High Impact** |
| **M2 Money Supply** | Broad money stock measure | 🔴 **High Impact** |
| **Federal Funds Rate** | Key policy interest rate | 🔴 **High Impact** |
| **USD Exchange Rate** | Nominal broad dollar index | 🟡 Medium Impact |
| **Unemployment Rate** | Civilian unemployment percentage | 🟡 Medium Impact |
| **Consumer Price Index** | CPI for all urban consumers | 🟡 Medium Impact |
| **Industrial Production** | Manufacturing output index | 🟢 Low Impact |
| **Retail Sales** | Consumer spending indicator | 🟢 Low Impact |

---

## 🚀 **Model Performance**

### **Comparative Results**

```
┌─────────────────┬─────────────┬────────────────┬─────────────────┐
│     Model       │     R²      │   Strengths    │   Limitations   │
├─────────────────┼─────────────┼────────────────┼─────────────────┤
│ ARIMA           │   0.6582    │ Time series    │ Linear trends   │
│                 │   (65.82%)  │ focused        │ only            │
├─────────────────┼─────────────┼────────────────┼─────────────────┤
│ SVM Regression  │   0.8432    │ Non-linear     │ Hyperparameter  │
│                 │   (84.32%)  │ patterns       │ sensitive       │
├─────────────────┼─────────────┼────────────────┼─────────────────┤
│ Random Forest   │   0.9605    │ Highest        │ Black-box       │
│                 │   (96.05%)  │ accuracy       │ model           │
└─────────────────┴─────────────┴────────────────┴─────────────────┘
```

### **Performance Visualization**
```
Model Accuracy Comparison
ARIMA      ████████████████████                    65.82%
SVM        ███████████████████████████████         84.32%
Random Forest ████████████████████████████████████ 96.05%
```

---

## 📊 **Key Findings**

### **🏆 Champion Model: Random Forest**
- **Exceptional Accuracy**: 96.05% of inflation variance explained
- **Feature Importance**: Successfully identified key economic drivers
- **Robustness**: Excellent performance across different economic cycles

### **💰 Economic Insights**
1. **Oil Price Volatility** drives significant inflation fluctuations
2. **Monetary Policy** (Fed Funds Rate) remains crucial for inflation control  
3. **Money Supply Expansion** shows strong correlation with price increases
4. **External Shocks** (oil, exchange rates) have substantial impact

### **📈 Methodological Contributions**
- Demonstrated superiority of **ensemble methods** over traditional approaches
- Validated **multiple inflation theories** through feature importance analysis
- Established framework for **hybrid econometric-ML modeling**

---

## 🛠️ **Technical Implementation**

### **Data Preprocessing**
- **Standardization**: Z-score normalization for SVM compatibility
- **Min-Max Scaling**: [0,1] range transformation
- **Outlier Detection**: Box-plot analysis and handling
- **Missing Value Treatment**: Interpolation and deletion strategies

### **Model Specifications**

#### **ARIMA Model**
```r
# Auto-selected optimal parameters
model <- auto.arima(inflation_ts)
forecast(model, h=5)  # 5-year projection
```

#### **Support Vector Regression**
```r
# RBF kernel with epsilon-regression
svm_model <- svm(inflation ~ ., 
                 data = scaled_data, 
                 type = "eps-regression",
                 kernel = "radial")
```

#### **Random Forest**
```r
# Ensemble of decision trees
rf_model <- randomForest(inflation ~ ., 
                         data = processed_data,
                         ntree = 500)
```

---

## 📚 **Literature Foundation**

### **Theoretical Framework**
Our analysis builds upon extensive economic literature identifying key inflation determinants:

- **Monetary Factors**: Barth & Bennett (1994) - Money supply effects
- **External Shocks**: Beckmann & Czudaj (2016) - Global factor influence  
- **Trade Effects**: Bhattacharya et al. (2006) - Exchange rate impacts
- **Policy Dynamics**: Ali & Mushtaq (2023) - Central bank decisions
- **Structural Causes**: Manning & Andrianacos (1993) - Long-term effects

---

## 🔮 **Policy Implications**

### **For Central Banks**
- **Enhanced Forecasting**: Machine learning models offer superior predictive capability
- **Early Warning Systems**: High accuracy enables proactive policy responses
- **Multi-factor Monitoring**: Oil prices and money supply require continuous attention

### **For Financial Institutions**
- **Risk Management**: Better inflation predictions improve portfolio planning
- **Investment Strategy**: Understanding key drivers enables strategic positioning
- **Hedging Decisions**: Accurate forecasts support derivative strategies

### **For Economic Research**
- **Methodological Innovation**: Demonstrates value of ML in macroeconomic analysis
- **Theory Validation**: Empirically confirms multiple inflation theories
- **Future Research**: Establishes foundation for advanced modeling approaches

---

## 🚧 **Limitations & Future Work**

### **Current Limitations**
- ⏰ **Annual Frequency**: May mask short-term dynamics
- 📦 **Black Box Nature**: Random Forest lacks interpretability  
- 🔧 **Hyperparameter Tuning**: SVM could benefit from optimization
- 🌍 **Geographic Scope**: Limited to U.S. inflation patterns

### **Future Research Directions**
- 📅 **Higher Frequency Analysis**: Monthly/quarterly data exploration
- 🧠 **Deep Learning**: LSTM/RNN for temporal pattern capture
- 🌐 **Cross-Country Studies**: International inflation comparison
- 🔗 **Hybrid Models**: Combining ARIMA temporal focus with ML power
- 📈 **Real-time Forecasting**: Live prediction systems

---

## 📁 **Project Structure**

```
inflation-forecasting/
├── 📊 data/
│   ├── raw/                    # Original datasets
│   ├── processed/              # Cleaned and transformed data
│   └── external/               # Additional economic indicators
├── 📝 notebooks/
│   ├── 01_data_exploration.R   # Initial data analysis
│   ├── 02_preprocessing.R      # Data cleaning and preparation
│   ├── 03_arima_modeling.R     # Time series analysis
│   ├── 04_svm_modeling.R       # Support vector regression
│   └── 05_random_forest.R      # Ensemble modeling
├── 📈 results/
│   ├── plots/                  # Visualization outputs
│   ├── models/                 # Saved model objects
│   └── forecasts/              # Prediction results
├── 📖 docs/
│   ├── final_report.pdf        # Complete research paper
│   ├── presentation.pptx       # Project presentation
│   └── literature_review.md    # Academic references
└── 🔧 scripts/
    ├── utils.R                 # Helper functions
    └── config.R                # Configuration settings
```

---

## 🏆 **Academic Recognition**

### **Course Information**
- **Course**: Advanced Statistics
- **Institution**: National University of Computer and Emerging Sciences (FAST)
- **Semester**: Spring 2025


### **Key Contributions**
- ✅ Novel application of ensemble methods to inflation forecasting
- ✅ Comprehensive comparison of traditional vs. modern approaches
- ✅ Empirical validation of economic theories through ML feature importance
- ✅ Policy-relevant insights for monetary authorities

---

## 📞 **Contact Information**

For questions, collaborations, or additional information about this research:

- **📧 Email**: [abdullahstan981@gmail.com](mailto:abdullahstan981@gmail.com)
- **🎓 Institution**: FAST-NUCES, Department of Data Science
- **📍 Location**: Islamabad, Pakistan
- **💼 LinkedIn**: [Connect with the team](https://www.linkedin.com/in/muhammad-abdullah-nadeem/)   

---

## 📄 **Citation**

If you use this research in your work, please cite:

```bibtex
@misc{nadeem2025inflation,
  title={Forecasting Inflation in the United States (1985-2024): A Comparative Analysis Using ARIMA, SVM, and Random Forest Models},
  author={Nadeem, M. Abdullah and Khan, Salar and Zaheer, Talha},
  year={2025},
  institution={National University of Computer and Emerging Sciences (FAST)},
  type={Advanced Statistics Project}
}
```

---

## 🔒 **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 **Acknowledgments**

- **Federal Reserve Bank of St. Louis** for FRED data access
- **International Monetary Fund** for global economic indicators
- **FAST-NUCES Faculty** for guidance and support
- **R Community** for excellent statistical computing tools
- **Academic Reviewers** for valuable feedback and insights

---

<div align="center">

### 📊 **"Predicting the Future, One Percentage Point at a Time"** 📊

*Built with ❤️ by the Data Science Team at FAST-NUCES*

[⭐ Star this repository](../../) • [🐛 Report Issues](../../issues) • [🤝 Contribute](../../pulls)

</div>
