# BioStatistics---Correlation_and_Hypothesis_Tests
BioStatistics - Correlation_and_Hypothesis_Tests
# 🧪 Full-Spectrum Statistical Analysis Pipeline (R)

The `Correlation_and_Hypothesis_Tests.R` script provides a single, comprehensive pipeline for performing both **correlation analysis** and a full suite of **parametric and non-parametric hypothesis tests**.

It uses two classic R datasets, `mtcars` and `iris`, to demonstrate a wide range of analytical techniques, automatically generating a log of results, derived data tables, and high-quality visualizations for reproducible statistical exploration.

## 🚀 Key Features

* **Integrated Testing:** Combines correlation analysis with a wide range of hypothesis tests, including $t$-tests, ANOVA, Wilcoxon, Kruskal-Wallis, and Chi-Square.
* **Correlation Suite:** Calculates **Pearson** (Linear), **Spearman** (Rank-based), and **Kendall's Tau** correlation coefficients.
* **Parametric Tests:** Includes **One-Sample $t$-test**, **Independent $t$-test**, and **One-way ANOVA**.
* **Non-Parametric Tests:** Includes **Wilcoxon Signed Rank**, **Mann-Whitney U Test**, and **Kruskal-Wallis Test**.
* **Categorical Analysis:** Performs the **Chi-Square Test** for association between categorical variables.
* **Automated Visualization:** Generates informative plots, including **Correlation Heatmaps** (`corrplot`), **Boxplots**, and **Scatterplots** with regression lines.
* **Reproducible Output:** Automatically logs all statistical results and saves derived data/plots to a specified directory.

---

## ⚙️ How to Run the Script

1.  **Download** the `Correlation_and_Hypothesis_Tests.R` file.
2.  **Prerequisite Check:** Ensure the **`corrplot`** package is installed (the script attempts to install it if missing, but running `install.packages("corrplot")` beforehand is recommended).
3.  **Optional:** Modify the `output_path` variable at the beginning of the script to your desired saving location.
    ```R
    output_path <- "D:/DOWNLOADS" # Change this path
    ```
4.  **Execute** the script in your R environment (RStudio or R console):
    ```R
    source("Correlation_and_Hypothesis_Tests.R")
    ```

---

## 📁 Output Structure

All generated files are saved to the defined `output_path` (default: `D:/DOWNLOADS`).

### Log & Data Files

| Filename | Type | Description |
| :--- | :--- | :--- |
| `Analysis_Log_Results.txt` | Text Log | Comprehensive log of the entire script's execution, including the full output of all statistical tests. |
| `mtcars_correlation_matrix.csv` | CSV | Pearson correlation matrix for `mpg`, `hp`, `wt`, and `disp`. |
| `iris_species_means.csv` | CSV | Mean `Sepal.Length` grouped by `Species`. |
| `iris_correlation_matrix.csv` | CSV | Pearson correlation matrix for the four numeric variables in `iris`. |

### Visualization Files (PNG Plots)

| Filename | Context | Description |
| :--- | :--- | :--- |
| `mtcars_corrplot.png` | `mtcars` | Correlation heatmap of four key vehicle metrics. |
| `iris_corrplot.png` | `iris` | Correlation heatmap of Sepal and Petal measurements. |
| `iris_boxplot.png` | `iris` | Boxplot of `Sepal.Length` across the three species (ANOVA context). |
| `iris_scatterplot.png` | `iris` | Scatterplot of `Sepal.Length` vs. `Petal.Length` with a linear regression line. |

---

## 🔬 Analysis Breakdown

### Part 1: `mtcars` Correlation Analysis

This section explores the relationship between key vehicle characteristics (`mpg`, `hp`, `wt`, `disp`) using three different correlation methods (Pearson, Spearman, Kendall's Tau) and visualizes the results.

### Part 2: `iris` Hypothesis Testing Suite

This section uses the `iris` dataset, primarily focusing on `Sepal.Length` and `Species`, to demonstrate equivalent parametric and non-parametric tests.

| Test | Parametric / Non-Parametric | Variables | Example $\text{H}_0$ |
| :--- | :--- | :--- | :--- |
| **One-Sample Test** | $t$-test / Wilcoxon | `Sepal.Length` | Mean/Median is equal to 5.8. |
| **Two-Sample Test** | Independent $t$-test / Mann-Whitney U | `Sepal.Length` by `Species` (2 groups) | Means/Distributions are equal. |
| **Multi-Group Test** | One-way ANOVA / Kruskal-Wallis | `Sepal.Length` by `Species` (all 3) | Means/Distributions are equal across all groups. |
| **Association Test** | Chi-Square Test | `SepalCat` vs. `Species` | No association exists. |

---
*Created by the Full-Spectrum Statistical Analysis Pipeline using R.*
