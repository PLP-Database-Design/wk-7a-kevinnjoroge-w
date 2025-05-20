WITH RECURSIVE ProductSplit AS (
  SELECT
    OrderID,
    CustomerName,
    TRIM(SUBSTRING_INDEX(Products, ',', 1)) AS Product,
    SUBSTRING(Products, LENGTH(SUBSTRING_INDEX(Products, ',', 1)) + 2) AS RemainingProducts
  FROM ProductDetail
  UNION ALL
  SELECT
    OrderID,
    CustomerName,
    TRIM(SUBSTRING_INDEX(RemainingProducts, ',', 1)),
    SUBSTRING(RemainingProducts, LENGTH(SUBSTRING_INDEX(RemainingProducts, ',', 1)) + 2)
  FROM ProductSplit
  WHERE RemainingProducts <> ''
)
SELECT OrderID, CustomerName, Product
FROM ProductSplit
ORDER BY OrderID;






CREATE TABLE Orders AS
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;
CREATE TABLE OrderDetails_2NF AS
SELECT OrderID, Product, Quantity
FROM OrderDetails;
