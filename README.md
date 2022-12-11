<div align="center">
    <img src="images/unirennes1.png" alt="Logo">
    <br>
     <img src="images/istic1ren.png" alt="Logo">

  <h3 align="center">Université Rennes 1, EIT Digital Data Science </h3>
  <h3 align="center"> Data warehouse (EDD), proffesor Marc Bousse </h3>
  <h3 align="center">  Marta Barbara Rzechowska  </h3>
  <h3 align="center">  Marton Bendeguz Bendicsek  </h3>
  <h3 align="center">  Daniel Marouf  </h3>
  
  <p align="center">
    Datamart for open food facts data warehouse with Pentaho.
  </p>
</div>



<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a></li>
        <li><a href="#class-diagram-representing-the-multidimensional-model-in-uml-notation">Class diagram representing the multidimensional model in UML notation.</a></li>
    <li>
      <a href="#relational-model-of-the-supporting-database">Relational model of the supporting database.</a>
      </li>
      <li>
      <a href="href="#ktr-files-of-the-kettle-transformations-for-filling-the-dimensional-and-fact-tables">KTR files of the Kettle transformations for filling the dimensional and fact tables.</a>
      </li>
        <li><a href="#mdx-code-for-the-queries">MDX code for these queries.</a></li>
  </ol>
</details>


<!-- ABOUT THE PROJECT -->
## About The Project

![Product Name Screen Shot][product-screenshot]
                                  
Aim
Design and develop two Mondrian cubes and their supporting database, using as source three existing tables,obtained     through     an     existing integration process.
Task
In UML notation, a class diagram represents a multidimensional model. The Mondrian schema's XML code. A relational database's supporting model. The database created using a SQL script. KTR files of the Kettle transformations for filling the dimensional and fact tables. For these queries' MDX code: Number of versions each month on rows, pnns1 values on columns, and the number of product descriptions per contributor and year of production for all product descriptions generated in 2017. At least two more queries of your choice's MDX code.


Original

Class diagram representing the multidimensional model in UML notation.XML code of the Mondrian schema. Relational model of the supporting database. SQL script used to create the database. KTR files of the Kettle transformations for filling the dimensional and fact tables. MDX code for these queries:◦number of product descriptions per contributor  and year of creation, on rows;◦number of versions per month on rows and pnns1 values on columns of all product descriptions created in 2017. MDX code for at least two other queries of your choice.

Screenshots of results for queries described in steps 6 and 7.9.«Readme» document explaining design choices for steps 1, 3, 5 and 7 above, plus comments on queryresults (step 8).


<p align="right">(<a href="#readme-top">back to top</a>)</p>



## Class diagram representing the multidimensional model in UML notation.

![UML Screen Shot](https://github.com/bendicsekb/openfoodfacts_datamart/blob/main/images/UML_OpenFoodFacts-UML.png)

In the process of completing the given task, we created UML diagram. It represent the structure of our schema. It consists of 2 cubes (product and product version). Product cubes has an measure number of products, product version cube – number of versions. Cubes are described by 5 dimensions (date, barcode, contributor, nutrition and pnns).


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Relational model of the supporting database.

![Relational Screen Shot][sql-screenshot]

Relation diagram is representing the tables we used in the project. It consist of 4 dimensions tables and 2 fact tables. During design, we decided to degrade a nutrition score dimension and not represent it in separate table.


## KTR files of the Kettle transformations for filling the dimensional and fact tables.

1. Dimensions in Kettle

![Kettle Dimensions Screen Shot](https://github.com/bendicsekb/openfoodfacts_datamart/blob/main/images/dimensions_kettle.png)

We selected distinct values from pnns and contributor tables. For date dimension we choose all the unique dates from both date of creation and date of modification columns. For barcode dimension, we selected the one value of an product name for each barcode. We made an assumption that the same barcode means the same product – even if some small details can occur, like change in the package size. Nutrition table isn’t included, as we decided to degrade it and not have an separate dimension table. <br />
SQL queries for barcode and date dimensions:
```
SELECT max(barcode)as barcode, max(product_name) as product_name from OFF_version_produit group by barcode;
SELECT distinct `date_creation` FROM `OFF_version_produit` UNION SELECT distinct `date_modification` FROM `OFF_version_produit`;
```

2. Product facts in Kettle

![UML Screen Shot](https://github.com/bendicsekb/openfoodfacts_datamart/blob/main/images/product_facts_kettle.png)

For the product fact tables we selected barcode, date of creation and pseudo from OFF_version_produit database. Then we use a combination of the sort and marge join transformation steps to join the fact with dimensional tables. In the product fact table we selected the sequential numbers of the dimension values, replacing the original values. The expectation is a barcode, which is an unique key by itself. 

3. Product vesrsion facts in Kettle

![UML Screen Shot](https://github.com/bendicsekb/openfoodfacts_datamart/blob/main/images/product_version_facts_kettle.png)

For a product version fact table we selected barcode, date of creation, date of modification, pnns2, pseudo and nutrition score fr from OFF_version_produit database. Then we use a combination of the sort and marge join transformation steps to join the fact and dimensional tables. In the product version fact table we selected the sequential numbers of the dimension values replacing the original values. The 2 expectations are barcode, which is an unique key by itself, and nutrition score. We don’t have a join for nutrition score as we degraded dimension and we use values from an original database. 

## MDX code for the queries.

1. Number of product descriptions per contributor («creator») and year of creation, on rows
```
select {[Measures].[nb_Description]} on columns,
non empty {crossjoin([dim_usage_date].[Year].Members, [dim_contributor].[Contributor].Members)} on rows
from Product
```
![MDX Query 1 Screen Shot](https://github.com/bendicsekb/openfoodfacts_datamart/blob/main/images/product_descriptions_per_contributor.png)

Comment abount MDX result

2. Number of versions per month on rows and pnns1 values on columns of all product descriptions createdin 2017.
```
select {[dim_usage_PNNS.PNNS_values].[PNNS1].Members} ON COLUMNS,
  Generate({[dim_usage_date_creation.Month_Year].[2017]}, Descendants([dim_usage_date_creation].CurrentMember, [dim_usage_date_modification.Month_Year].[Month])) ON ROWS
from [Product_version]
```
![MDX Query 2 Screen Shot](https://github.com/bendicsekb/openfoodfacts_datamart/blob/main/images/versions_per_month_of_all_descriptions.png)


Comment abount MDX result

3. Products, that had more than 1 update in 2018.
```
select [Measures].[nb_Version] on columns,
filter({[dim_usage_barcode].Members}, [Measures].[nb_Version].CurrentMember > 1) on rows
from [Product_version]
where [dim_usage_date_modification].[Year].[2018]
```
![MDX Query 3 Screen Shot](https://github.com/bendicsekb/openfoodfacts_datamart/blob/main/images/products_more_than_one_update.png)

Comment abount MDX result

4. Nutrition scores by year for products in biscuits and cakes (PNNS category).
```
select non empty [dim_usage_date_modification].[Year].Members on columns,
non empty crossjoin(filter(([dim_usage_barcode].Children), [Measures].[nb_Version] >= 2), [Nutrition_score].Children) on rows
from [Product_version]
where [dim_usage_PNNS].[PNNS2].[Biscuits and cakes]
```
![MDX Query 4 Screen Shot](https://github.com/bendicsekb/openfoodfacts_datamart/blob/main/images/nutrition_score_by_year_cakes.png)

Comment abount MDX result

<p align="right">(<a href="#readme-top">back to top</a>)</p>


[product-screenshot]: images/screenshot.png
[sql-screenshot]: images/MySQL_Relational.png

