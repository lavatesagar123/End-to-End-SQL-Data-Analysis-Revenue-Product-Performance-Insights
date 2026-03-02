
# 🍕 Pizza Sales Data Analysis Using SQL

## 📌 Project Overview

This project focuses on analyzing pizza sales data using SQL to uncover meaningful business insights. The goal was to transform raw transactional data into actionable insights related to revenue, customer behavior, product performance, and sales trends.

Using structured queries ranging from basic aggregations to advanced window functions, this project demonstrates practical SQL skills required for Data Analyst roles.

---

## 🎯 Problem Statement

Businesses often collect large volumes of sales data but struggle to extract meaningful insights from it.

The objective of this project is to:

* Analyze pizza sales transactions using SQL
* Identify revenue trends and top-performing products
* Understand customer ordering behavior
* Evaluate category-wise and time-based sales performance
* Support strategic decision-making using data-driven insights

---

## 🛠 Tools & Technologies Used

* SQL
* MySQL
* MySQL Workbench

---

## 🗂 Dataset Description

The dataset consists of structured relational tables designed in a star schema format:

* **Orders** – Contains order date and time
* **Order Details** – Contains quantity and pizza ID
* **Pizzas** – Contains size and price
* **Pizza Types** – Contains category and name

### 📊 Data Model

* Built a **Star Schema Data Model**
* Established 1-to-many relationships between:

  * Orders → Order Details
  * Pizzas → Order Details
  * Pizza Types → Pizzas

This structure ensures accurate aggregation and performance analysis.

---

## 📊 SQL Analysis Performed

### 🔹 Basic Analysis

* Total number of orders placed
* Total revenue generated
* Highest priced pizza
* Most ordered pizza size
* Top 3 pizzas by quantity

### 🔹 Intermediate Analysis

* Category-wise total quantity ordered
* Hourly order distribution
* Average orders per day
* Top 3 pizzas by revenue

### 🔹 Advanced Analysis

* Percentage revenue contribution by pizza type
* Cumulative revenue trend over time
* Category-wise revenue ranking using `RANK()`
* Window functions for running totals and performance comparison

---

## 💡 Key Business Insights

### 💰 Revenue Insights

* A small group of pizzas contributed a major portion of total revenue
* High-priced pizzas did not always generate the highest sales volume
* Certain categories significantly outperformed others

### 🛒 Customer Behavior

* Customers showed strong preference for specific pizza sizes
* Peak ordering hours were identified through time-based analysis
* Daily average order volume showed consistent demand patterns

### 📦 Product Performance

* Top 3 pizzas contributed a large share of total sales
* Some categories had high demand but lower price margins
* Revenue concentration highlighted best-performing product segments

### 📈 Trend Analysis

* Cumulative revenue analysis showed steady business growth
* Time-based patterns can support marketing and promotional strategies

---

## 🎓 Learning Outcomes

Through this project, I gained hands-on experience in:

* Writing optimized SQL queries
* Performing complex joins across multiple tables
* Using aggregation and grouping techniques
* Applying window functions and ranking methods
* Converting raw data into business insights

This project strengthened my ability to think analytically and solve real-world business problems using SQL.

---

## 🚀 How to Use This Repository

1. Import the dataset into MySQL.
2. Run the SQL queries provided in the project file.
3. Modify queries to explore additional business questions.
4. Use insights for reporting and decision-making simulations.

---

## 📬 Contact

**Sagar Lavate**
📧 sagarlavate2025@gmail.com
🔗 LinkedIn: https://www.linkedin.com/in/sagar-lavate


