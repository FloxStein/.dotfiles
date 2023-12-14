Create Table Cat (
	name Varchar(50) Primary Key,
	birth Date,
	body_weight real
);

Create Table Ate (
	cat_name Varchar(50) references Cat(name),
	time Date
);
