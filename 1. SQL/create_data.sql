-- create a database
 
create database project1;

use project1;

-- Create the first table called branches

CREATE TABLE branches (
    branch_id VARCHAR(10) PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    region VARCHAR(20)
);

-- Create teh second table called customers

CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    branch_id VARCHAR(10) NOT NULL,
    customer_type VARCHAR(20),
    join_date DATE,
    CONSTRAINT fk_customer_branch
        FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id)
);

-- Create teh third table (main table) called transactions

CREATE TABLE transactions (
    transaction_id VARCHAR(15) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    transaction_date DATE,
    amount DECIMAL(12,2),
    transaction_type VARCHAR(30),
    CONSTRAINT fk_transaction_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);


-- insert sample data to each table 

-- Branches
INSERT INTO branches VALUES
('B001', 'Hyderabad Central', 'Hyderabad', 'South'),
('B002', 'Bangalore East', 'Bangalore', 'South'),
('B003', 'Mumbai North', 'Mumbai', 'West'),
('B004', 'Delhi South', 'Delhi', 'North'),
('B005', 'Chennai Central', 'Chennai', 'South');

-- Customers
INSERT INTO customers VALUES
('C001', 'B001', 'Retail', '2022-01-15'),
('C002', 'B001', 'SME',    '2022-03-10'),
('C003', 'B002', 'Retail', '2022-02-20'),
('C004', 'B002', 'Retail', '2022-05-18'),
('C005', 'B003', 'SME',    '2021-11-25'),
('C006', 'B003', 'Retail', '2022-06-12'),
('C007', 'B004', 'Retail', '2022-04-01'),
('C008', 'B004', 'SME',    '2022-07-19'),
('C009', 'B005', 'Retail', '2022-03-08'),
('C010', 'B005', 'Retail', '2022-08-30');

-- Transactions
INSERT INTO transactions VALUES
('T001', 'C001', '2023-01-05',  5000,  'Deposit'),
('T002', 'C002', '2023-01-07', 15000,  'Loan Payment'),
('T003', 'C003', '2023-01-10',  3000,  'Deposit'),
('T004', 'C004', '2023-01-15',  2000,  'Withdrawal'),
('T005', 'C005', '2023-02-02', 25000,  'Loan Payment'),
('T006', 'C006', '2023-02-08',  4000,  'Deposit'),
('T007', 'C007', '2023-02-14',  3500,  'Deposit'),
('T008', 'C008', '2023-02-20', 18000,  'Loan Payment'),
('T009', 'C009', '2023-03-05',  2200,  'Withdrawal'),
('T010', 'C010', '2023-03-12',  4500,  'Deposit');

