<div align="center">
    <img src="unirennes1.png" alt="Logo">
    <br>
     <img src="istic1ren.png" alt="Logo">

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

![UML Screen Shot](https://github.com/bendicsekb/openfoodfacts_datamart/blob/main/UML_OpenFoodFacts-UML_design.drawio.png)

In the process of completing the given task, we created UML diagram. It represent the structure of our schema. It consists of 2 cubes (product and product version). Product cubes has an measure number of products, product version cube – number of versions. Cubes are described by 5 dimensions (date, barcode, contributor, nutrition and pnns).


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Relational model of the supporting database.

![Relational Screen Shot][sql-screenshot]

Relation diagram is representing the tables we used in the project. It consist of 4 dimensions tables and 2 fact tables. During design, we decided to degrade a nutrition score dimension and not represent it in separate table.


## KTR files of the Kettle transformations for filling the dimensional and fact tables.

Screenshots about kettles

Comment abount kettles

## MDX code for the queries.

1. Number of product descriptions per contributor («creator») and year of creation, on rows

Screenshot about MDX result

Comment abount MDX result

2. Number of versions per month on rows and pnns1 values on columns of all product descriptions createdin 2017.

Screenshot about MDX result

Comment abount MDX result

3. Query 3

Screenshot about MDX result

Comment abount MDX result

4. Query 4

Screenshot about MDX result

Comment abount MDX result

<p align="right">(<a href="#readme-top">back to top</a>)</p>


[product-screenshot]: screenshot.png
[uml-screenshot]: UML_OpenFoodFacts.png
[sql-screenshot]: SQL_Relational.png

