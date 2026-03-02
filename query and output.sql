-- SIMPLE TYPE QUESTION 
-- 1.Retrieve the total number of orders placed.
SELECT count(order_id) AS total_order FROM orders ;

-- 2. Calculate the total revenue generated from pizza sales.
SELECT 
    SUM(pizzas.price * order_details.quntity) AS TOTAL_REVENUE
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizaa_id;
    
-- 3. Identify the highest-priced pizza.
SELECT 
    pizza_types.name, pizzas.price AS highest_price
FROM
    pizzas
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;

-- 4. Identify the most common pizza size ordered.
SELECT 
    pizzas.size,
    COUNT(order_details.order_details_id) AS order_count
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizaa_id
GROUP BY pizzas.size
ORDER BY order_count DESC
LIMIT 1;

-- 5.List the top 3 most ordered pizza types along with their quantities.

SELECT pizza_types.name, count(order_details.quntity) AS quntities
FROM pizza_types JOIN pizzas 
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details
ON order_details.pizaa_id = pizzas.pizza_id
GROUP BY pizza_types.name ORDER BY quntities DESC LIMIT 3 ;

-- Intermediate QUESTION 
-- 1.Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT pizza_types.category, sum(order_details.quntity) AS PZAAS_QUN_CAT
FROM pizza_types JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
ON order_details.pizaa_id = pizzas.pizza_id
GROUP BY pizza_types.category ORDER BY PZAAS_QUN_CAT ;

-- 2. Determine the distribution of orders by hour of the day.
SELECT hour(order_time), count(order_id)  FROM orders
GROUP BY hour(order_time);

-- 3. Join relevant tables to find the category-wise distribution of pizzas.
 SELECT category , count(category) AS TOTAL_COUNT_CATEGORY FROM pizza_types
 GROUP BY category ORDER BY TOTAL_COUNT_CATEGORY DESC;
 
 -- 4. Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT ROUND(AVG(total_quantity),0) 
FROM (
    SELECT orders.Order_date, 
           SUM(order_details.quntity) AS total_quantity
    FROM order_details 
    JOIN orders 
        ON orders.Order_id = order_details.order_id
    GROUP BY orders.Order_date
) AS category_quantity;

-- 5. Determine the top 3 most ordered pizza types based on revenue.
SELECT pizza_types.name, sum(pizzas.price*order_details.quntity) AS TOTAL_REVENUE
FROM pizza_types JOIN pizzas
ON pizza_types.pizza_type_id=pizzas.pizza_type_id
JOIN order_details
ON pizzas.pizza_id=order_details.pizaa_id
GROUP BY pizza_types.name ORDER BY TOTAL_REVENUE DESC LIMIT 5;


-- Advanced QUESTION :
-- 1. Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pizza_types.category,
    ROUND(
        SUM(pizzas.price * order_details.quntity) /
        (
            SELECT SUM(pizzas.price * order_details.quntity)
            FROM pizzas
            JOIN order_details 
                ON pizzas.pizza_id = order_details.pizaa_id
        ) * 100
    , 2) AS revenue_percentage
FROM pizza_types
JOIN pizzas 
    ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details
    ON pizzas.pizza_id = order_details.pizaa_id
GROUP BY pizza_types.category
ORDER BY revenue_percentage DESC
LIMIT 5;

-- 2. Analyze the cumulative revenue generated over time.

SELECT 
    Order_date,
    ROUND(
        SUM(price_all) OVER (ORDER BY Order_date),
    1) AS cum_revenue
FROM (
    SELECT 
        orders.Order_date,
        SUM(order_details.quntity * pizzas.price) AS price_all
    FROM order_details 
    JOIN pizzas
        ON order_details.pizaa_id = pizzas.pizza_id
    JOIN orders
        ON orders.Order_id = order_details.order_id
    GROUP BY orders.Order_date
) AS sale;

-- 3.Determine the top 3 most ordered pizza types based on revenue for each pizza category.
SELECT name, revenue
FROM (
    SELECT 
        category, 
        name, 
        revenue,
        RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS rn
    FROM (
        SELECT 
            pizza_types.category, 
            pizza_types.name,
            SUM(order_details.quntity * pizzas.price) AS revenue
        FROM pizza_types
        JOIN pizzas 
            ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN order_details
            ON order_details.pizaa_id = pizzas.pizza_id
        GROUP BY pizza_types.category, pizza_types.name
    ) AS a
) AS b
WHERE rn <= 3;

