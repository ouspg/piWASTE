## Features

### Frontend
- The user can log in using a pre-made user for Jakke Jäyhä (username “jaksu”, password “1234”) and add products to the shopping cart. The user can purchase the products, and the purchase is added to the user’s purchase history.
- The user has their own user profile with user info, and a list of their past purchases. It is also possible to edit some of the user information from the profile page. The website includes an admin user (with default username “admin” and password “admin”) with higher privileges.
- The products are imaginary items. The product images and descriptions were created by us and are included in the default deployment of the product. The product list has a search bar for filtering products by name. The product page includes buttons for selecting the number of items the user wants to add to the shopping cart. There’s also a way for users to leave reviews for the products, which show up on the product page.

### Login page
- Going to the login page immediately sets the required cookies for access control. The site uses “user_id” integer value to track which user is logged in. The default value for users who are not logged in is 0. This behaviour was left this way on purpose, to give people hints regarding the way the website does access control without having the user log in first.
- The user login page has two fields, one for username and one for password. The user input is directly inserted into an SQL query, which makes it vulnerable for SQL injection (“Injection” from OWASP top 10 list). As an example, the attacker can log in as admin by writing “ OR “1” = “1 in the password field. This results in the query on the server side returning all the users in the table, where it picks the first one. This could theoretically be any user, as the query does not order the results, but it is almost always the admin user. The server sets the “user_id” cookie value to the user id of the user that was picked and redirects the user to main page.

### Product page
- The products page lists all the products. The list of products is generated from server response, which returns all the products which are marked visible. The response includes the product id, and the user can notice that some product ids are missing. The user can then modify the path to a visible product (for example /product/3) and change the product id to /product/<missing id> to see the hidden items. This is an example of “Sensitive Data Exposure” from OWASP top 10 list.
- The user can also change the “user_id” cookie value to something else and leave reviews as other users, which is an example of “Broken Authentication” on OWASP top 10.

### Products page
- The products page contains search field, which can be used to make searches from products database. By the default every product which has visible value 1 generates new product card from template. The template contains name, icon, description and price.

### Shopping cart page
- Shopping cart shows every product listed for purchase. User can add and remove products which are already added to shopping cart. User can also purchase products and purchase history is shown at bottom of the page.
