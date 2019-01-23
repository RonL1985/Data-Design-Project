INSERT INTO customer (customerId, customerUserName, customerEmail, customerPhone, customerHash,)
VALUES(
  -- generated UUID for customer id converted to binary
   UNHEX(REPLACE('1c8e982f654e46aea06d8c1c0fe50f33','-', '')),
  -- customer userName chosen by user
  'rluna41',
  -- email
 'ronaldluna1@gmail.com',
  -- phone
  '5059479586',
  -- hash,
 '894e65fe9b536b64d7a1940e46ec9cb923fab7f1d63be350b43106851235cb23e798e19a85fee1ecd84e988dbbbf1c59881b003d94f9a23dcfd132fca5ef27bd', 'd79d674bb81c24fff3a8af16cb4c6c2b28eec296d4c05745d08e9178e3144f5d2478564'
);

INSERT INTO product (productId, productcustomerId, productName,)
    VALUES(
        -- genereated UUID for post id converted to binary
        UNHEX(REPLACE('6c6266f6-a93e-4833-8810-19186b31afad','-', '')),
      -- customer userName Id converted from binary
        UNHEX('1c8e982f654e46aea06d8c1c0fe50f33'),
      -- product title
        'customer
);

INSERT INTO product (productId, customerProductId, shoppingcartProducttId, productTitle, ProductContent, productDate)
    VALUE (
    -- generated UUID for comment id converted to binary
    UNHEX(REPLACE('1c8e982f654e46aea06d8c1c0fe50f33','-', '')),
    -- product id
    UNHEX(REPLACE('6c6266f6a93e4833881019186b31afad','-', '')),
    -- productCustomer id
    UNHEX('1c8e982f654e46aea06d8c1c0fe50f33'),
    -- title
    'this is a title',
    -- product
    'I have product',
    -- date
    '2019/21/01'
);

SELECT customerId, customerUserName, customerEmail
  FROM customer
  WHERE customerEmail LIKE '%ona%';

SELECT productContent, productTitle, productDate
  FROM product
  WHERE productTitle LIKE '%hood%';

SELECT shoppingcartDate, shoppingcartTitle, shoppingcartContent
  FROM shoppingcart
  WHERE shoppingcartTitle

UPDATE customer
  SET customerUserName = 'TimAdams'
  WHERE customerId = '1c8e982f654e46aea06d8c1c0fe50f33';

UPDATE product
  SET productContent = 'time for content'
  WHERE productId = '6c6266f6a93e4833881019186b31afad';

UPDATE shoppingcart
  SET shoppingcartContent = 'my content like your content'
  WHERE shoppingcartcustomerId = '1c8e982f654e46aea06d8c1c0fe50f33';

DELETE FROM customer
  WHERE customerId = '1c8e982f654e46aea06d8c1c0fe50f33';

DELETE FROM product
  WHERE productCustomerId = '1c8e982f654e46aea06d8c1c0fe50f33';

DELETE FROM customer
  WHERE customerUserNameId = '1c8e982f654e46aea06d8c1c0fe50f33';

SELECT customer.customerId,customer.customerUserName, product.productId, product.productName from customer inner join product on customer.customerId = product. productCustomerId WHERE customerId = '1c8e982f654e46aea06d8c1c0fe50f33';

SELECT productId, COUNT(*) FROM product
WHERE ProductCustomertId = '6c6266f6a93e4833881019186b31afad';

