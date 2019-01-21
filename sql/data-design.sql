-- The statement below sets the collation of the database to utf8
ALTER DATABASE your_database_name_CHANGE_ME CHARACTER SET utf8 COLLATE utf8_unicode_ci;

-- this is a comment in SQL (yes, the space is needed!)
-- these statements will drop the tables and re-add them
-- this is akin to reformatting and reinstalling Windows (OS X never needs a reinstall...) ;)
-- never ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever
-- do this on live data!!!!
DROP TABLE IF EXISTS `Shopping`;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS customer;

-- the CREATE TABLE function is a function that takes tons of arguments to layout the table's schema
CREATE TABLE customer (
	-- this creates the attribute for the primary key
	-- not null means the attribute is required!
	customerID BINARY(16) NOT NULL,
	customerActivationToken CHAR(32),
	customerUserName VARCHAR(32) NOT NULL,
	customerEmail VARCHAR(128) NOT NULL,
	-- to make something optional, exclude the not null
	customerHash CHAR(97) NOT NULL,
	customerPhone VARCHAR(32),
	-- to make sure duplicate data cannot exist, create a unique index
	UNIQUE(customerAtHandle),
	UNIQUE(customerEmail),
	-- this officiates the primary key for the entity
	PRIMARY KEY(customerId)
);

-- create the product entity
CREATE TABLE product (
	-- this is for yet another primary key...
	productId BINARY(16) NOT NULL,
	-- this is for a foreign key
	productCustomerId BINARY(16) NOT NULL,
	productSelection VARCHAR(140) NOT NULL,
	productName VARCHAR(32) NOT NULL,
	-- this creates an index before making a foreign key
	INDEX(productCustomerId),
	-- this creates the actual foreign key relation
	FOREIGN KEY(productCustomerId) REFERENCES customer(customerId),
	-- and finally create the primary key
	PRIMARY KEY(productId)
);

-- create the like entity (a weak entity from an m-to-n for profile --> tweet)
CREATE TABLE `shoppingCart` (
	-- these are still foreign keys
	shoppingCartCustomerId BINARY(16) NOT NULL,
	shoppingCartProductId BINARY(16) NOT NULL,
	-- index the foreign keys
	INDEX(shoppingCartCustomerId),
	INDEX(shoppingCartProductId),
	-- create the foreign key relations
	FOREIGN KEY(shoppingCartCustomerId) REFERENCES customer(customerId),
	FOREIGN KEY(shoppingCartProductId) REFERENCES product(productId),
	-- finally, create a composite foreign key with the two foreign keys
	PRIMARY KEY(shoppingCartCustomerId, shoppingCartProductId)
);

INSERT INTO customer (customerId, customerUserName, customerEmail, customerPhone, customerHash, customerSalt)
VALUES(
  -- generated UUID for customer id converted to binary
   UNHEX(REPLACE('dc12ace9-3796-4902-931c-722e4f19bfd2','-', '')),
  -- customer userName chosen by user
  'rluna41',
  -- email
 'ronaldluna1@gmail.com',
  -- phone
  '5059479586',
  -- hash, salt
 '894e65fe9b536b64d7a1940e46ec9cb923fab7f1d63be350b43106851235cb23e798e19a85fee1ecd84e988dbbbf1c59881b003d94f9a23dcfd132fca5ef27bd', 'd79d674bb81c24fff3a8af16cb4c6c2b28eec296d4c05745d08e9178e3144f5d2478564'
);

INSERT INTO customer (customerId, customerId, customerTitle, customerContent, customerDate)
    VALUES(
        -- genereated UUID for post id converted to binary
        UNHEX(REPLACE('db910b19-11c8-4087-b0c1-d33b92ca74b3','-', '')),
      -- customer userName Id converted from binary
        UNHEX('dc12ace9-3796-4902-931c-722e4f19bfd2'),
      -- customer title
        'customer',
      -- customer content
        'Dont Worry Be Happy',
      -- customer date
        '2019/21/01'
);

INSERT INTO product (productId, customerProductId, customerShoppingcartId, productTitle, ProductContent, productDate)
    VALUE (
    -- generated UUID for comment id converted to binary
    UNHEX(REPLACE('76e5bb3b-890c-4c5d-ba4c-eea7014a3d91','-', '')),
    -- product id
    UNHEX(REPLACE('db910b19-11c8-4087-b0c1-d33b92ca74b3','-', '')),
    -- productCustomer id
    UNHEX('dc12ace9-3796-4902-931c-722e4f19bfd2'),
    -- title
    'this is a title',
    -- product
    'i have product',
    -- date
    '2019/21/01'
);

SELECT customerId, customerUserName, customerEmail
  FROM customer
  WHERE customerEmail LIKE 'Flash%';

SELECT productContent, productTitle, productDate
  FROM product
  WHERE productContent LIKE '%Wish.com';

SELECT shoppingcartDate, shoppingcartTitle, shoppingcartContent
  FROM shoppingcart
  WHERE shoppingcartDate = '2019/21/01';

UPDATE customer
  SET customerUserName = 'TimAdams'
  WHERE customerId = 'dc12ace9-3796-4902-931c-722e4f19bfd2';

UPDATE product
  SET productContent = 'time for content'
  WHERE productId = '76e5bb3b-890c-4c5d-ba4c-eea7014a3d91';

UPDATE shoppingcart
  SET shoppingcartContent = 'my content like your content'
  WHERE shoppingcartcustomerId = 'dc12ace9-3796-4902-931c-722e4f19bfd2';

DELETE FROM customer
  WHERE customerId = 'dc12ace9-3796-4902-931c-722e4f19bfd2';

DELETE FROM product
  WHERE productCustomerId = 'dc12ace9-3796-4902-931c-722e4f19bfd2';

DELETE FROM customer
  WHERE customerUserNameId = 'dc12ace9-3796-4902-931c-722e4f19bfd2';
