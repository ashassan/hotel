What classes does each implementation include? Are the lists the same?
ShoppingCart, Order, and CartEntry are classes in both implementations. 

Write down a sentence to describe each class.
CartEntry- calculates the price of an item added to a cart based on unit price and quantity. 
ShoppingCart- calculates the price of total items in a cart
Order- calculates the total price of a cart including sales tax 

How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.
ShoppingCart holds many CartEntry objects and calculates the price of all of them. Order takes one shopping cart object and calculates final price with tax. 

What data does each class store? How (if at all) does this differ between the two implementations? Cart entry stores the data for the unit price and quantity. Shopping cart stores the data for all the entries. Order stores the data for the shopping cart. In the first implementation only order can get data about the price. In Implementaiton B they all have information about the price. 


What methods does each class have? How (if at all) does this differ between the two implementations?In implmentation A the shopping cart and cart entry have no methods. However, in implementation B they both have pricing methods. In both implementaitons Order has total price method.

Consider the Order#total_price method. In each implementation:
Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?
Does total_price directly manipulate the instance variables of other classes?

In implementation A logic is not delegated to lower classes. However, in implementaiton b logic is delegated to lower classes. Total price does not directlymanipulate the instance variables of the other classes. 

If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?

You would have to add an if statement to add a discount if the quantity is higher than the bulk amount. It is easier to modify implementation B. 

Which implementation better adheres to the single responsibility principle?Implementation B better adheres to the single responsibility principle. 


Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?
Implementation B is more loosely coupled than implementation A. In implementation A the order is connected to both shoppingcart and cart entry then shopping cart is also connected to cart entry. In Implementation B order is connected to only shopping cart and shopping cart is connected to cart entry. 


what changes you would need to make to improve this design, and how the resulting design would be an improvement.

my find_reservation_by_date is doing a lot. It is finding the days that are included in between the start date/end date. Then checking if the date is included into that. I decided to add a method in reservation that creates an array with all the dates. That way in find_reservation_by_date it only needs to check if the date is included in that array. 






