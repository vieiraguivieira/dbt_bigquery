select 
    prod.productname
    ,prod.listprice
    ,prod.SubCategoryID
    ,first_value(prod.productname) over (partition by prod.SubCategoryID order by prod.listprice asc) as leastexpensive
    ,first_value(prod.listprice) over (partition by prod.SubCategoryID order by prod.listprice asc) as leastexpensive
    ,first_value(prod.productname) over (partition by prod.SubCategoryID order by prod.listprice desc) as mostexpensive
    ,first_value(prod.listprice) over (partition by prod.SubCategoryID order by prod.listprice desc) as mostexpensive
from adventureworks.products as prod
left join adventureworks.productsubcategories as subcat on subcat.SubCategoryID = prod.SubCategoryID
order by prod.SubCategoryID asc, prod.listprice asc