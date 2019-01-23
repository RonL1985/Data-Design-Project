-- The statement below sets the collation of the database to utf8
ALTER DATABASE your_database_name_CHANGE_ME CHARACTER SET utf8 COLLATE utf8_unicode_ci;

-- this is a comment in SQL (yes, the space is needed!)
-- these statements will drop the tables and re-add them
-- this is akin to reformatting and reinstalling Windows (OS X never needs a reinstall...) ;)
-- never ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever
-- do this on live data!!!!
DROP TABLE IF EXISTS `ShoppingCart`;
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

-- create the like entity (a weak entity from an m-to-n for profile --> customer)
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
