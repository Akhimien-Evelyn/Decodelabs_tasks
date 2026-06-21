/* --- To Check the Table
*/

SELECT * FROM [Decode_ECommerce_Orders]

--- View specific columns only;
SELECT OrderID, Product,Total_Price, Order_Status FROM [Decode_ECommerce_Orders]

--- Top 10 highest value orders;
SELECT TOP 10 OrderID, Product, Quantity, Total_Price FROM [Decode_ECommerce_Orders]

--- Orders that were delivered;
SELECT * FROM [Decode_ECommerce_Orders]
WHERE Order_Status = 'Delivered'

--- Orders above $3,000
SELECT * FROM [Decode_ECommerce_Orders]
WHERE Total_Price > 3000

--- Outlier Orders (Above upper fence)
SELECT * FROM [Decode_ECommerce_Orders]
WHERE Total_Price > 3330.41

--- Cancelled OR Returned Orders
SELECT * FROM [Decode_ECommerce_Orders]
WHERE Order_Status = 'Cancelled' OR Order_Status = 'Returned'

--- Instagram orders paid by Credit card;
SELECT * FROM [Decode_ECommerce_Orders]
WHERE Referral_Source = 'Instagram' AND Payment_Method = 'Credit Card'

--- Orders with No Coupon used
SELECT * FROM [Decode_ECommerce_Orders]
WHERE Coupon_Code = 'NO COUPON'

--- Total Revenue, Orders, Avg Order Value by Product
SELECT Product,
       COUNT(*) AS TotalOrders,
       SUM(Total_Price) AS TotalRevenue,
       AVG(Total_Price) AS AvgOrderValue
FROM [Decode_ECommerce_Orders]
GROUP BY Product;

--- Order count by Order status
SELECT Order_Status,
      COUNT(*) AS OrderCount
FROM [Decode_ECommerce_Orders]
GROUP BY Order_Status

--- Revenue by Referral source
SELECT Referral_Source,
     COUNT(*) AS Orders,
     SUM(Total_Price) AS TotalRevenue,
     AVG(Total_Price) AS AvgOrderValue
FROM [Decode_ECommerce_Orders]
GROUP BY Referral_Source

--- Revenue by Payment method
SELECT Payment_Method,
     COUNT(*) AS Orders,
     SUM(Total_Price) AS TotalRevenue,
     AVG(Total_Price) AS AOV
FROM [Decode_ECommerce_Orders]
GROUP BY Payment_Method

--- Overall Basic Statistics
SELECT
      COUNT(*) AS TotalOrders,
      SUM(Total_Price) AS TotalRevenue,
      AVG(Total_Price) AS AvgOrderValue,
      MIN(Total_Price) AS SmallestOrder,
      MAX(TOTAL_Price) AS LargestOrder
FROM [Decode_ECommerce_Orders]

--- Count cancelled and Returened Order
SELECT
     COUNT(*) AS 'FailedOrders'
FROM [Decode_ECommerce_Orders]
WHERE Order_Status IN ('Cancelled', 'Returned')

--- Average Order Value with VS without Coupon
SELECT
    CASE WHEN Coupon_Code = 'NO COUPON'
         THEN 'NO COUPON'
         ELSE 'HAS COUPON'
    END AS Coupon_Code,
    COUNT(*) AS Orders,
    AVG(Total_Price) AS AOV
FROM [Decode_ECommerce_Orders]
GROUP BY 
    CASE WHEN Coupon_Code = 'NO COUPON' THEN 'NO COUPON'
         ELSE 'HAS COUPON'
    END

--- Products ranked by Total Revenue (highest first)
SELECT Product,
    SUM(Total_Price) AS TotalRevenue
FROM [Decode_ECommerce_Orders]
GROUP BY Product
ORDER BY TotalRevenue DESC

--- Cheapest Orders first
SELECT OrderID, Product, Total_Price FROM [Decode_ECommerce_Orders]
        ORDER BY Total_Price ASC

--- Most recent Orders first:
SELECT OrderID, Date, Product, Total_Price
FROM [Decode_ECommerce_Orders]
ORDER BY Date DESC
