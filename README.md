# Predict Price of a Car

This project aims to predict the price of a car based on various features using machine learning techniques. Below is an overview of the steps involved in the project:

## 1. Scraping Data
The first step involves collecting data from online sources. Web scraping techniques are used to gather car-related data, such as make, model, year, mileage, and price.

## 2. Cleaning Data
The raw data collected is cleaned to remove inconsistencies, handle missing values, and ensure uniformity. This step ensures the dataset is ready for analysis.

## 3. Exploratory Data Analysis (EDA)
EDA is performed to understand the data distribution, identify patterns, and detect outliers. Visualizations and statistical summaries are used to gain insights into the dataset.

## 4. Preprocessing
Data preprocessing includes encoding categorical variables, scaling numerical features, and splitting the dataset into training and testing sets. This step prepares the data for machine learning models.

## 5. Training
Various machine learning algorithms are trained on the preprocessed data to predict car prices. Hyperparameter tuning is performed to optimize model performance.

## 6. Evaluation
The trained models are evaluated using metrics such as Mean Absolute Error (MAE), Mean Squared Error (MSE), and R-squared. The best-performing model is selected for deployment.

## 7. Deploying
The final model is deployed as a web application or API, allowing users to input car details and receive price predictions.

## Project Structure
- `data/`: Contains raw and cleaned datasets.
- `notebooks/`: Jupyter notebooks for EDA, preprocessing, and model training.
- `src/`: Source code for data scraping, preprocessing, and model training.
- `models/`: Saved machine learning models.
- `app/`: Code for the deployment application.

## Requirements
- Python 3.x
- Libraries: pandas, numpy, scikit-learn, matplotlib, seaborn, Flask/Django (for deployment)

## Makefile Commands
This project includes a `Makefile` to simplify common tasks. Below are the available commands and their utilities:

### 1. `make archive`
- **Description**: Archives and compresses the `Models` and `Data` directories into `.tar` files and then zips them.
- **Usage**:
  ```bash
  make archive
  ```
- **Result**: Creates `Models.tar.zip` and `Data.tar.zip` files.

### 2. `make extract`
- **Description**: Moves the compressed files (`Models.tar.zip` and `Data.tar.zip`) outside the `resources` folder, extracts them, and cleans up temporary files.
- **Usage**:
  ```bash
  make extract
  ```
- **Result**: Extracts the contents of the compressed files into the current directory.

### 3. `make clean`
- **Description**: Removes the compressed `.zip` files.
- **Usage**:
  ```bash
  make clean
  ```
- **Result**: Deletes `Models.tar.zip` and `Data.tar.zip`.

## How to Run
1. Clone the repository.
2. Install the required libraries using:
   ```bash
   pip install -r requirements.txt
   ```
3. Run the notebooks in the `notebooks/` folder for data analysis and model training.
4. Use the `Makefile` commands to manage data and models:
   - Archive data and models: `make archive`
   - Extract data and models: `make extract`
   - Clean up zip files: `make clean`
5. Deploy the application by running the script in the `app/` folder.

## License
This project is licensed under the MIT License.