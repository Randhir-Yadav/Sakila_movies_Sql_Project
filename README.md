# Sakila_movies_Sql_Project
# Project Overview
The Sakila Database provides a schema for a DVD rental store that includes entities like films, actors, staff, customers, and rentals. It's designed for practicing SQL queries, database administration, and learning complex relational data models. The Sakila database is commonly used by MySQL and PostgreSQL users.

# Database Schema
The database schema for Sakila includes several key entities:

# Actor: Information about film actors.
# Film: Information about the films being rented.
# Customer: Customer details.
# Rental: Transactional information related to the rental of DVDs.
# Payment: Details of payments made by customers.
# Store: Store details.
# Staff: Employees of the rental store.
# Category: Categorization of films.
# Inventory: Tracking the inventory of films at different stores.

# Technologies Used
MySQL / PostgreSQL: Relational Database Management Systems used to manage the Sakila database.
SQL: Structured Query Language to interact with the database.

# Features
A real-world use case for a DVD rental store, including films, actors, rentals, payments, and customer data.
Pre-populated tables with data to practice SQL queries and database administration tasks.
Complex relationships between tables to practice joins, subqueries, and database transactions.
Practice advanced SQL concepts like views, stored procedures, and triggers (depending on your database engine).
# Setup and Installation
1. MySQL Installation
Download the Sakila Database:

You can download the official MySQL version of the Sakila database from MySQL official Sakila page.
Import the Sakila Database:

bash
# Copy code
mysql -u root -p < /path/to/sakila-schema.sql
mysql -u root -p < /path/to/sakila-data.sql

Once you have the Sakila database installed, you can start practicing SQL queries such as:

Retrieving customer rental history.
Getting the most popular films.
Analyzing payments made by customers and revenues generated by each store.
You can also explore relationships between tables by writing complex JOIN queries.

# Access the Database
# MySQL:

mysql -u root -p sakila

# SQL Queries Examples
Here are some example queries to get started:

Get the most rented films:

# sql
SELECT f.title, COUNT(r.rental_id) AS rentals
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rentals DESC
LIMIT 10;
List all customers with their total rental payments:

# sql
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_payment
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY total_payment DESC;
Find all films by a specific actor:

# sql
SELECT f.title
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE a.first_name = 'Johnny' AND a.last_name = 'Lollobrigida';
# Contributing
Contributions are welcome! Feel free to fork this repository and submit a pull request with new queries, insights, or improvements to the schema.

