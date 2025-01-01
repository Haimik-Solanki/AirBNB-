-- 2. Write a query to show names from Listings table

SELECT 
    name
FROM
    Listings;

-- 3. Write a query to fetch total listings from the listings table

SELECT 
    COUNT(*) AS total_listings
FROM
    Listings;


-- 4. Write a query to fetch total listing_id from the booking_details table

SELECT 
    COUNT(DISTINCT listing_id) AS total_listings
FROM
    Booking_Details;


-- 5. Write a query to fetch host ids from listings table

SELECT 
    host_id
FROM
    Listings;
        
    
-- 6. Write a query to fetch all unique host name from listings table

 SELECT DISTINCT
    host_name
FROM
    Listings;
        
    
-- 7. Write a query to show all unique neighbourhood_group from listings table

SELECT DISTINCT
    neighbourhood_group
FROM
    Listings;
    
-- Interpretation:
-- The query to find all unique neighborhood groups in the "Listings" table reveals that there are only five distinct groups: 
-- Brooklyn, Manhattan, Queens, Staten Island, and the Bronx.

-- 8. Write a query to show all unique neighbourhood from listings table

SELECT DISTINCT
    neighbourhood
FROM
    Listings;


-- 9. Write a query to fetch unique room_type from listings tables

SELECT DISTINCT
    room_type
FROM
    Listings;

-- Interpretation:
-- Airbnb listings in this dataset offer three primary room types: Private Room, Entire home/apt, and Shared room.    
    
-- 10. Write a query to show all values of Brooklyn & Manhattan from listings tables

SELECT 
    *
FROM
    Listings
WHERE
    neighbourhood_group IN ('Brooklyn' , 'Manhattan');

-- Intepretation:
-- The query successfully retrieves all records from the "Listings" 
-- table where the neighbourhood_group is either "Brooklyn" or "Manhattan." 
-- This includes information such as customer_id, name, host_id, host_name, neighbourhood, 
-- and room_type for each listing in these boroughs.
    
-- 11. Write a query to show maximum price from booking_details table

SELECT 
    MAX(price)
FROM
    Booking_Details;

-- Interpretation:
-- The query to find the maximum price in the "Booking_Details" 
-- table reveals that the highest price listed for any accommodation is 10000.

    
-- 12. Write a query to show minimum price from booking_details table

SELECT 
    MIN(price)
FROM
    Booking_Details;

-- Interpretation:
-- The query to find the minimum price in the "Booking_Details" 
-- table reveals that the lowest price listed for any accommodation is 0.

    
-- 13. Write a query to show average price from booking_details table

SELECT 
    AVG(price)
FROM
    Booking_Details;

-- Interpretation:
-- The average price of accommodations listed in the "Booking_Details" table is 152.72.


-- 14. Write a query to show minimum value of minimum_nights from booking_details table 

SELECT 
    MIN(minimum_nights)
FROM
    Booking_Details;

-- Interpretation:
-- The minimum number of nights required for any stay listed in the "Booking_Details" table is 1.


-- 15. Write a query to show maximum value of minimum_nights from booking_details table

SELECT 
    MAX(minimum_nights)
FROM
    Booking_Details;
    
-- Interpretation:
-- The maximum minimum stay requirement for any accommodation 
-- listed in the "Booking_Details" table is 1250 nights, 
-- which is approximately 3 years and 5 months.
    
 -- 16. Write a query to show average availability_365
 
 SELECT 
    AVG(availability_365)
FROM
    Booking_Details;

-- Interpretation:
-- The average availability of listings throughout the year, 
-- as measured by availability_365, is 112.7 days.


-- 17. Write a query to show id , availability_365 and all availability_365 values greater than 300

SELECT 
    listing_id, availability_365
FROM
    Booking_Details
WHERE
    availability_365 > 300;

-- Interpretation:
-- The query to find listings with availability_365 greater than 300 returns more than 1000 results. 
-- This indicates that a significant number of listings in the "Booking_Details" 
-- table are available for booking for over 300 days in a year.

-- 18. Write a query to show count of id where price is in between 300 to 400

SELECT 
    COUNT(listing_id)
FROM
    Booking_Details
WHERE
    price BETWEEN 300 AND 400;

-- Interpretation:
-- The query to count the number of listings with a price between 300 and 400 reveals 
-- that 2155 listings fall within this price range.


-- 19. Write a query to show count of id where minimum_nights spend is less than 5

SELECT 
    COUNT(listing_id) 
FROM
    Booking_Details
WHERE
    minimum_nights < 5;

-- Interpretation:
-- The query to count the number of listings with 
-- a minimum stay requirement of less than 5 nights reveals that 38,752 listings meet this criteria.

    
-- 20. Write a query to show count where minimum_nights spend is greater than 100

SELECT 
    COUNT(listing_id)
FROM
    Booking_Details
WHERE
    minimum_nights > 100;

-- Interpretation:
-- The query to count the number of listings with 
-- a minimum stay requirement exceeding 100 nights reveals that 174 listings meet this criteria.

    
-- 21. Write a query to show all data of listings & booking_details

SELECT 
    *
FROM
    Listings
        JOIN
    Booking_Details ON Listings.id = Booking_Details.listing_id;

-- Interpretation:
-- The query successfully combined data from both the "Listings" and "Booking_Details" tables, providing 
-- a comprehensive view of each listing, including details like price, availability, host information, and property characteristics.


-- 22. Write a query to show host name and price

SELECT 
    host_name, price
FROM
    Listings 
        JOIN
    Booking_Details  ON id = listing_id; 

-- Interpretation:
-- The query successfully retrieves the host_name and the corresponding price for each listing.
-- Like:
-- host_name: John
-- price: 149$
-- This indicates that "John" is the host for a listing with a price of $149.
    
    
-- 23. Write a query to show room_type and price

SELECT 
    room_type, price
FROM
    Listings 
        JOIN
    Booking_Details  ON id = listing_id;
    
-- Interpretation:
-- The query successfully retrieves the room_type and its corresponding price for each listing.
-- like:
-- room_type: Private room
-- price: 149$
-- This indicates that the listed accommodation is a "Private room" with a price of $149.
    
    
-- 24. Write a query to show neighbourhood_group & minimum_nights spend

SELECT 
    neighbourhood_group, minimum_nights
FROM
    Listings 
        JOIN
    Booking_Details  ON id = listing_id;
    
-- Interpretation:
-- The query successfully retrieves the neighbourhood_group and the corresponding minimum_nights for each listing.
-- like:
-- neighbourhood_group: Brooklyn
-- minimum_nights: 1
-- This indicates that a listing in the "Brooklyn" neighborhood has a minimum stay requirement of 1 night.

    
-- 25. Write a query to show neighbourhood & availability_365

SELECT 
    neighbourhood, availability_365
FROM
    Listings
        JOIN
    Booking_Details ON id = listing_id;
    
-- Interpretation:
-- The query successfully retrieves the neighbourhood and its corresponding availability_365 for each listing.
-- like:
-- neighbourhood: Kensington
-- availability_365: 365
-- This indicates that a listing in the "Kensington" neighborhood is available for booking for 365 days of the year.

    
-- 26. Write a query to show total price by neighbourhood_group

SELECT 
    neighbourhood_group, SUM(price) AS total_price
FROM
    Listings
        JOIN
    Booking_Details ON id = listing_id
GROUP BY neighbourhood_group;

-- Interpretation:
-- The query successfully calculates the total price for each neighbourhood_group.
 
-- Results:
-- neighbourhood_group: Brooklyn, total_price: 2500600
-- neighbourhood_group: Manhattan, total_price: 4264527
-- neighbourhood_group: Queens, total_price: 563867
-- neighbourhood_group: Staten Island, total_price: 42825
-- neighbourhood_group: Bronx, total_price: 95459

-- These results demonstrate the total revenue generated by listings within each neighborhood group.

-- 27. Write a query to show maximum price by neighbourhood_group

SELECT 
    neighbourhood_group, MAX(price) AS max_price
FROM
    Listings
        JOIN
    Booking_Details ON id = listing_id
GROUP BY neighbourhood_group;

-- Interpretation:
-- The query to find the maximum price within each neighbourhood_group reveals 
-- Brooklyn, Manhattan, and Queens exhibit the highest maximum price of 10000.
-- Staten Island has a maximum price of 5000.
-- The Bronx has a maximum price of 2500.

-- 28. Write a query to show maximum night spend by neighbourhood_group

SELECT 
    neighbourhood_group, MAX(minimum_nights) AS max_nights
FROM
    Listings
        JOIN
    Booking_Details ON id = listing_id
GROUP BY neighbourhood_group;

-- Interpretation:
-- The query successfully identifies the maximum minimum stay requirement for each neighbourhood_group.
-- neighbourhood_group: Manhattan, max_nights: 1250
-- neighbourhood_group: Brooklyn, max_nights: 999
-- neighbourhood_group: Queens, max_nights: 500
-- neighbourhood_group: Staten Island, max_nights: 365
-- neighbourhood_group: Bronx, max_nights: 365
-- Manhattan has the longest maximum minimum stay requirement among all neighbourhoods.


-- 29. Write a query to show maximum reviews_per_month spend by neighbourhood

 SELECT 
    neighbourhood,
    MAX(reviews_per_month) AS max_reviews_per_month
FROM
    Listings
        JOIN
    Booking_Details ON id = listing_id
GROUP BY neighbourhood;

-- Interpretation:
-- The query successfully identifies the neighbourhood with the highest average number of reviews per month.
-- neighbourhood: Prospect-Lefferts Gardens
-- max_reviews_per_month: 9.97
-- This indicates that "Prospect-Lefferts Gardens" has the highest average number of reviews per month among all neighbourhoods. 


-- 30. Write a query to show maximum price by room type

SELECT 
    room_type, MAX(price) AS max_price
FROM
    Listings
        JOIN
    Booking_Details ON id = listing_id
GROUP BY room_type; 

-- Interpretation:
-- The query successfully identifies the maximum price for each room type.
-- room_type: Entire home/apt, max_price: 10000
-- room_type: Private room, max_price: 10000 
-- This analysis reveals that the maximum price for both "Entire home/apt" and "Private room" is 10000.

-- 31. Write a query to show average number_of_reviews by room_type

SELECT 
    room_type, AVG(number_of_reviews) AS avg_reviews
FROM
    Listings
        JOIN
    Booking_Details ON id = listing_id
GROUP BY room_type;

-- Interpretation:
-- The query successfully calculates the average number of reviews for each room type.
-- room_type: Private room, avg_reviews: 24.1130
-- room_type: Entire home/apt, avg_reviews: 22.8424
-- room_type: Shared room, avg_reviews: 16.6000
-- This analysis reveals that "Private room" listings tend to have 
-- a slightly higher average number of reviews compared to "Entire home/apt" and "Shared room" listings.  


-- 32. Write a query to show average price by room type

SELECT 
    room_type, AVG(price) AS avg_price
FROM
    Listings
        JOIN
    Booking_Details ON id = listing_id
GROUP BY room_type;

-- Interpretation:
-- The query successfully calculates the average price for each room type.
-- room_type: Entire home/apt, avg_price: 211.7942
-- room_type: Private room, avg_price: 89.7810
-- room_type: Shared room, avg_price: 70.1276
-- This analysis reveals that "Entire home/apt" listings have 
-- the highest average price, followed by "Private room" and then "Shared room". 


-- 33. Write a query to show average night spend by room type

SELECT 
    room_type, AVG(minimum_nights) AS avg_nights
FROM
    Listings
        JOIN
    Booking_Details ON id = listing_id
GROUP BY room_type;

-- Interpretation:
-- The query successfully calculates the average minimum stay requirement for each room type.
-- room_type: Entire home/apt, avg_nights: 8.5069
-- room_type: Shared room, avg_nights: 6.4750
-- room_type: Private room, avg_nights: 5.3779
-- This analysis reveals that "Entire home/apt" listings generally have the longest average minimum stay requirements, 
-- followed by "Shared room" and then "Private room". 


-- 34. Write a query to show average price by room type but average price is less than 100

SELECT 
    room_type, AVG(price) AS avg_price
FROM
    Listings
        JOIN
    Booking_Details ON id = listing_id
GROUP BY room_type
HAVING AVG(price) < 100;

-- Interpretation:
-- The query successfully calculates the average price for each room type and filters the results 
-- to include only those room types with an average price below 100.
-- room_type: Private room, avg_price: 89.7810
-- room_type: Shared room, avg_price: 70.1276
-- This analysis reveals that "Private room" and "Shared room" listings have average prices below 100.


-- 35. Write a query to show average night by neighbourhood and average_nights is greater than 5

SELECT 
    neighbourhood, AVG(minimum_nights) AS avg_nights
FROM
    Listings
        JOIN
    Booking_Details ON id = listing_id
GROUP BY neighbourhood
HAVING AVG(minimum_nights) > 5; 

-- Interpretation:
-- The query successfully calculates the average minimum stay requirement for each neighbourhood and filters the results 
-- to include only neighbourhoods with an average minimum stay greater than 5 nights.
-- neighbourhood: Spuyten Duyvil, avg_nights: 48.25 
-- This analysis reveals that "Spuyten Duyvil" has the highest average minimum stay requirement among
-- the neighbourhoods with an average stay exceeding 5 nights.


-- 36. Write a query to show all data from listings where price is greater than 200 using sub-query

SELECT 
    *
FROM
    booking_details
WHERE
    price >= (SELECT 
            MIN(price)
        FROM
            booking_details
        WHERE
            price >= 200)
ORDER BY price;
            
-- Interpretation:    
-- 	The query retrieves data for 9384 listings where the price in the Booking_Details table is greater than or equal to 200.

            
-- 37. Write a query to show all values from booking_details table where host id is 314941 using sub-query

SELECT 
    *
FROM
    Booking_Details
WHERE
    listing_id IN (SELECT 
            id
        FROM
            Listings
        WHERE
            host_id = 314941);

-- Interpretation:  
-- This query finds customer information for host_id 314941, 
-- specifically for listings with IDs 66275, 114229, and 179741.          

            
-- 38. Find all pairs of id having the same host id, each pair coming once only
        
SELECT 
    a.id AS id1, b.id AS id2, a.host_id
FROM
    listings AS a
        JOIN
    listings AS b ON a.host_id = b.host_id AND a.id < b.id;

-- Interpretation:
-- The query successfully identifies all unique pairs of listings that share the same host.
-- The output provides a list of pairs of listing IDs (id1 and id2) along with their corresponding host_id. 
-- This analysis helps to identify which listings are managed by the same host.

        
-- 39. Write an sql query to show fetch all records that have the term cozy in name

SELECT 
    *
FROM
    Listings
WHERE
    name LIKE '%cozy%'; 
    
-- Interpretation:
-- The query successfully retrieves all records from 
-- the "Booking_Details" table for listings associated with the host having host_id 314941.
-- This includes information such as price, minimum_nights, number_of_reviews, etc., 
-- for all bookings made for the listings hosted by this specific host.

    
-- 40. Write an sql query to show price, host id, neighbourhood_group of manhattan neighbourhood_group

SELECT 
    price, host_id, neighbourhood_group
FROM
    Listings
        JOIN
    Booking_Details ON id = listing_id
WHERE
    neighbourhood_group = 'Manhattan';
    
-- Interpretation:
-- The analysis reveals that there are 21,661 unique host IDs associated with listings in the "Manhattan" neighborhood. 
-- The maximum price observed for any listing in Manhattan is 10,000.
    
-- 41. Write a query to show id , host name, 
-- neighbourhood and price but only for Upper West Side & Williamsburg neighbourhood, 
-- also make sure price is greater than 100

SELECT 
    id, host_name, neighbourhood, price
FROM
    Listings
        JOIN
    Booking_Details ON id = listing_id
WHERE
    neighbourhood IN ('Upper West Side' , 'Williamsburg')
        AND price > 100;

-- Interpretation:
-- The query successfully retrieves the id, host_name, neighbourhood, 
-- and price for all listings located in the "Upper West Side" or "Williamsburg" neighborhoods that have a price greater than 100.

        
-- 42. Write a query to show id , host name, neighbourhood and price for host name Elise and neighbourhood is Bedford-Stuyvesant

SELECT 
    id, host_name, neighbourhood, price
FROM
    Listings
        JOIN
    Booking_Details ON id = listing_id
WHERE
    host_name = 'Elise'
        AND neighbourhood = 'Bedford-Stuyvesant';
        
-- Interpretation 
-- "Three customers have made bookings for listings hosted by 'Elise' in the 'Bedford-Stuyvesant' neighborhood.
-- Their customer IDs are 35249977, 7262439, and 1048190.
-- Among these customers, customer 1048190 made the highest payment, while customer 35249977 made the lowest payment."

        
-- 43. Write a query to show host_name, availability_365,minimum_nights only for 100+ availability_365 and minimum_nights

SELECT 
    host_name, availability_365, minimum_nights
FROM
    Listings
        JOIN
    Booking_Details ON id = listing_id
WHERE
    availability_365 > 100
        AND minimum_nights > 100; 

-- Interpretation 
-- This query finds listings with high availability 
-- throughout the year (> 100 days) and long minimum stays (> 100 nights), revealing potential long-term rental opportunities.

        
-- 44. Write a query to show to fetch id , host_name , number_of_reviews, and reviews_per_month but show only 
-- that records where number of reviews are 500+ and review per month is 5+ 

SELECT 
    id, host_name, number_of_reviews, reviews_per_month
FROM
    Listings
        JOIN
    Booking_Details ON id = listing_id
WHERE
    number_of_reviews > 500
        AND reviews_per_month > 5;

-- Interpretation:
-- The query successfully retrieves the id, host_name, number_of_reviews, and reviews_per_month for all listings 
-- that have received more than 500 reviews and have an average of more than 5 reviews per month.

        
-- 45. Write a query to show neighbourhood_group which have most total number of review

SELECT 
    neighbourhood_group, SUM(number_of_reviews) AS total_reviews
FROM
    Listings
        JOIN
    Booking_Details ON id = listing_id
GROUP BY neighbourhood_group
ORDER BY total_reviews DESC
LIMIT 1;

-- Interpretation:
-- The query successfully identifies the neighborhood group with the highest total number of reviews.
-- neighbourhood_group: Brooklyn, total_reviews: 486574
-- This indicates that the "Brooklyn" neighborhood has received the most reviews across all its listings.


-- 46. Write a query to show host name which have most cheaper total price

SELECT 
    host_name, SUM(price) AS total_price
FROM
    Listings
        JOIN
    Booking_Details ON id = listing_id
GROUP BY host_name
ORDER BY total_price ASC
LIMIT 1;

-- Interpretation:
-- The query successfully identifies the host with the lowest total price across all their listings.
-- host_name: Qiuchi, total_price: 0
-- This indicates that the host named "Qiuchi" has the lowest total price across all their listings, with a total price of 0.


-- 47. Write a query to show host name which have most costly total price

SELECT 
    host_name, SUM(price) AS total_price
FROM
    Listings
        JOIN
    Booking_Details ON id = listing_id
GROUP BY host_name
ORDER BY total_price DESC
LIMIT 1; 

-- Interpretation:
-- The query successfully identifies the host with the highest total price across all their listings.
-- host_name: Sonder (NYC), total_price: 82795
-- This indicates that "Sonder (NYC)" has the highest total price among all hosts, with a total revenue of 82795.


-- 48. Write a query to show host name which have max price using sub-query 

SELECT 
    host_name
FROM
    Listings
WHERE
    id IN (SELECT 
            listing_id
        FROM
            Booking_Details
        WHERE
            price = (SELECT 
                    MAX(price)
                FROM
                    Booking_Details));

-- Interpretation:
-- The query successfully identifies the host(s) with listings having the maximum price.
-- host_name: Kathrine, Erin, Jelena
-- This indicates that Kathrine, Erin, and Jelena are the hosts with listings that have the highest price recorded in the "Booking_Details" table.


-- 49. Write a query to show neighbourhood_group where price is less than 100 

SELECT DISTINCT
    neighbourhood_group
FROM
    Listings
        JOIN
    Booking_Details ON id = listing_id
WHERE
    price < 100;
    
-- Interpretation:
-- The query successfully identifies all the neighbourhood_groups where listings have prices below 100.
-- neighbourhood_group: Brooklyn, Manhattan, Queens, Staten Island, Bronx
-- This indicates that listings with prices below 100 are available in all five boroughs of New York City.

    
-- 50. Write a query to find max price, average availability_365 for each room type and order in ascending by maximum price.

SELECT 
    room_type,
    MAX(price) AS max_price,
    AVG(availability_365) AS avg_availability
FROM
    Listings
        JOIN
    Booking_Details ON id = listing_id
GROUP BY room_type
ORDER BY max_price ASC;

-- Interpretation:
-- The query successfully calculates the maximum price (max_price) and average availability (avg_availability_365) for each room_type. 
-- The results are then ordered in ascending order based on the max_price.
-- room_type: Shared room, max_price: 1800, avg_availability_365: 162.0009 
-- room_type: Private room, max_price: 10000, avg_availability_365: 111.2039
-- room_type: Entire home/apt, max_price: 10000, avg_availability_365: 111.9203
-- 