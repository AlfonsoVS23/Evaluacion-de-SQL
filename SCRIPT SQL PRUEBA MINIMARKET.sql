CREATE SCHEMA IF NOT EXISTS minimarket_schema;
-- creación del schema de la base de datos del minimarket.

CREATE TABLE `minimarket_schema`.`productos`(
`productos_id` INT NOT NULL auto_increment,
`nombreProducto` VARCHAR (30) NOT NULL,
`precio` INT NOT NULL,
PRIMARY KEY (`productos_id`));
-- creación de la tabla 'productos' que incluye las categorias exclusivas de nombre y precio

#####################################111###########################################

CREATE TABLE `minimarket_schema`.`tipoproductos`(
`tipoProductos_id` INT NOT NULL auto_increment,
`nombretipo` VARCHAR (30) NOT NULL,
PRIMARY KEY (`tipoproductos_id`));
-- creación de la tabla 'tipoproductos' 

#####################################222############################################

CREATE TABLE `minimarket_schema`.`clientes`(
`clientes_id` INT NOT NULL auto_increment,
`nombreCliente` VARCHAR (30) NOT NULL,
PRIMARY KEY (`clientes_id`));
-- creación de la tabla 'clientes'

######################################333###########################################

CREATE TABLE `minimarket_schema`.`boletas`(
`boletas_id` INT NOT NULL auto_increment,
`numero` INT,
`fecha` DATE NOT NULL,
PRIMARY KEY (`boletas_id`));
-- creación de la tabla 'Boletas' 

#####################################444############################################

CREATE TABLE `minimarket_schema`.`datosboletas`(
`datosboletas_id` INT NOT NULL auto_increment,
`cantidadProductos` int  NOT NULL,
PRIMARY KEY (`datosboletas_id`));
-- creación de la tabla 'datosBoletas'

#####################################555############################################

CREATE TABLE `minimarket_schema`.`proveedores`(
`proveedores_id` INT NOT NULL auto_increment,
`nombreProveedor` VARCHAR (30) NOT NULL,
PRIMARY KEY (`proveedores_id`));
-- creación de la tabla 'proveedores'

####################################666#############################################

-- DROP TABLE minimarket_schema.tipoproductos;
-- DROP TABLE minimarket_schema.boletas;
-- DROP TABLE minimarket_schema.clientes;
-- DROP TABLE minimarket_schema.datosboletas;
-- DROP TABLE minimarket_schema.proveedores;
-- DROP TABLE minimarket_schema.productos;

-- ALTER TABLE minimarket_schema.boletas DROP foreign key productosboletas;
-- ALTER TABLE minimarket_schema.datosboletas DROP foreign key productosboletas;

-- ALTER TABLE minimarket_schema.boletas DROP foreign key clientesboletas;
-- ALTER TABLE minimarket_schema.datosboletas DROP foreign key clientesboletas;
-- Atajo para borrar tablas en caso de error

################################777#################################################

ALTER TABLE minimarket_schema.productos ADD tipoproductos_id INT NOT NULL;
ALTER TABLE minimarket_schema.productos ADD CONSTRAINT tipopproductos FOREIGN KEY (tipoproductos_id) REFERENCES minimarket_schema.tipoproductos(tipoproductos_id);
-- 1.- Se agrega en tabla productos la FK de tipo de productos

ALTER TABLE minimarket_schema.productos ADD proveedores_id INT NOT NULL;
ALTER TABLE minimarket_schema.productos ADD CONSTRAINT productosproveedores FOREIGN KEY (proveedores_id) REFERENCES minimarket_schema.proveedores(proveedores_id);
-- 2.- Se agrega en tabla productos la FK de proveedores

ALTER TABLE minimarket_schema.datosboletas ADD productos_id INT NOT NULL;
ALTER TABLE minimarket_schema.datosboletas ADD CONSTRAINT productosdatos FOREIGN KEY (productos_id) REFERENCES minimarket_schema.productos(productos_id);
-- 3.- Se agrega en tabla datosboletas la FK de productos

ALTER TABLE minimarket_schema.datosboletas ADD boletas_id INT NOT NULL;
ALTER TABLE minimarket_schema.datosboletas ADD CONSTRAINT boletasydatos FOREIGN KEY (boletas_id) REFERENCES minimarket_schema.boletas(boletas_id);
-- 4.- Se agrega en tabla datosboletas la FK de boletas

ALTER TABLE minimarket_schema.clientes ADD boletas_id INT NOT NULL;
ALTER TABLE minimarket_schema.clientes ADD CONSTRAINT clientesboletas FOREIGN KEY (boletas_id) REFERENCES minimarket_schema.boletas(boletas_id);
-- 5.- Se agrega en tabla clientes la FK de boletas

##################################888###############################################

INSERT INTO minimarket_schema.tipoproductos (nombretipo) VALUES ('bebestibles');
INSERT INTO minimarket_schema.tipoproductos (nombretipo) VALUES ('abarrotes');
INSERT INTO minimarket_schema.tipoproductos (nombretipo) VALUES ('frutasverduras');
INSERT INTO minimarket_schema.tipoproductos (nombretipo) VALUES ('juguetes');
INSERT INTO minimarket_schema.tipoproductos (nombretipo) VALUES ('aseo');
SELECT * FROM minimarket_schema.tipoproductos;
-- poblamos los tipo de productos y revisamos que se hayan agregado

#################################999#################################################

INSERT INTO minimarket_schema.proveedores (nombreProveedor) VALUES ('Andina');
INSERT INTO minimarket_schema.proveedores (nombreProveedor) VALUES ('Panaderia LV426');
INSERT INTO minimarket_schema.proveedores (nombreProveedor) VALUES ('Frutas Sulacco');
INSERT INTO minimarket_schema.proveedores (nombreProveedor) VALUES ('Xenotoys');
INSERT INTO minimarket_schema.proveedores (nombreProveedor) VALUES ('Clorinda');
SELECT * FROM minimarket_schema.proveedores;
-- poblamos los proveedores y revisamos que se hayan agregado

###################################101010###############################################

INSERT INTO minimarket_schema.productos (nombreProducto, precio, tipoproductos_id, proveedores_id) VALUES ('CocaCola', 1250, 1, 1);
INSERT INTO minimarket_schema.productos (nombreProducto, precio, tipoproductos_id, proveedores_id) VALUES ('Pan de Alien', 2000, 2, 2);
INSERT INTO minimarket_schema.productos (nombreProducto, precio, tipoproductos_id, proveedores_id) VALUES ('Manzana Colonial Marine', 450, 3, 3);
INSERT INTO minimarket_schema.productos (nombreProducto, precio, tipoproductos_id, proveedores_id) VALUES ('Juguetito de Xenomorfo', 10000, 4, 4);
INSERT INTO minimarket_schema.productos (nombreProducto, precio, tipoproductos_id, proveedores_id) VALUES ('Cloro', 9999, 5, 5);
SELECT * FROM minimarket_schema.productos;
-- poblamos productos ya con su tipo y proveedor definido

##################################11111111#################################################

USE minimarket_schema;
SELECT nombreProducto as 'Nombre',precio as '$',nombreProveedor as 'Proveedor'
FROM minimarket_schema.productos
INNER JOIN minimarket_schema.proveedores on minimarket_schema.productos.proveedores_id = minimarket_schema.proveedores.proveedores_id;
-- generamos consulta para revisar los productos y su respectivo proveedor

##################################12121212##################################################


INSERT INTO `minimarket_schema`.`boletas` (`boletas_id`, `numero`, `fecha`) VALUES ('1', '486', '2022-12-11');
SELECT * FROM minimarket_schema.boletas;
-- Poblamos una test de boleta para usarlas con las consultas de más adelante

INSERT INTO `minimarket_schema`.`clientes` (`clientes_id`, `nombreCliente`, `boletas_id`) VALUES (1, 'Rebecca Chambers', 1);
SELECT * FROM minimarket_schema.clientes;
-- Poblamos un cliente para test

INSERT INTO `minimarket_schema`.`datosboletas` (`datosboletas_id`, `cantidadProductos`, `productos_id`, `boletas_id`) VALUES ('1', '100', 1, 1);
INSERT INTO `minimarket_schema`.`datosboletas` (`datosboletas_id`, `cantidadProductos`, `productos_id`, `boletas_id`) VALUES ('2', '200', 2, 1);
SELECT * FROM minimarket_schema.datosboletas;
-- poblamos los datos de esa boleta a la boleta anterior

#################################13131313###################################################

USE minimarket_schema;
SELECT fecha as 'aaaa-mm-dd', nombreProducto , cantidadProductos as 'Cantidad de Productos' , precio as 'Precio por unidad' ,cantidadProductos*precio as 'Total de Productos'
FROM minimarket_schema.datosboletas
INNER JOIN minimarket_schema.productos,minimarket_schema.boletas
where (minimarket_schema.datosboletas.productos_id = minimarket_schema.productos.productos_id)
and (minimarket_schema.datosboletas.boletas_id = minimarket_schema.boletas.boletas_id);
-- generamos consulta para mostrar el total de cada producto por boleta, le agregamos algunas referencias a la tabla para que 
-- quede mas bonita y le indicamos de las tablas que pertenece

###################################14141414###############################################

SELECT fecha as 'aaaa-mm-dd', sum(cantidadProductos*precio) as 'Total de Boleta', boletas.boletas_id as 'N° de Boleta'
FROM minimarket_schema.datosboletas
INNER JOIN minimarket_schema.productos,minimarket_schema.boletas
WHERE (minimarket_schema.datosboletas.productos_id = minimarket_schema.productos.productos_id)
and (minimarket_schema.boletas.boletas_id = 1);
-- generamos una consulta sobre el total de la boleta, similar a la anterior pero sin desglose, en este caso, permitiria obtener
-- valores de todas las boletas para obtener una ganancia según el periodo del año correspondiente
-- (quiero dejar registro que boletas tiraba ERROR CODE 1052 indicando que boletas_id era ambiguo y costó bastante solucionarlo)












