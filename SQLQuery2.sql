/****** Script for SelectTopNRows command from SSMS  ******/

select * from Orders

select Category,Region,round(avg(sales),0) as Average_sales from Orders where Category is not null group by Region, Category order by Average_sales desc

select category, round(sum(Sales),0) as Total_sales, round(sum(profit),0) as Total_profit from Orders --where Category is not null 
group by Category
order by Category, Total_sales, Total_profit desc;

select  round(sum(sales),0) as Total_sales, round(sum(profit),0) as Total_profit from Orders group by Sales, Profit order by Total_sales desc; 
select  round(sum(profit),0) as Total_profit  from Orders group by Profit order by Profit desc;

select * from [dbo].[People]
select * from [dbo].[Orders]

select * from [Projects].[dbo].[Orders] inner join [Projects].[dbo].[People] on [dbo].[Orders].[Region] = [dbo].[People].[Region]

select [dbo].[Orders].Region, AVG(sales) as Average_Sales from [Projects].[dbo].[Orders] 
 inner join 
[Projects].[dbo].[People] on [dbo].[Orders].[Region] = [dbo].[People].[Region]  
group by [dbo].[Orders].Region 

select State, Category, Sales,
 case 
   when sales >120 then 'Selling'
   when sales <50  then  'Not selling'
   else 'Average sale' 
end as Summary
from [dbo].[Orders] where sales is not null

select [Sub-Category], ROUND(avg(profit), 1) as Average_Profit from [dbo].[Orders] where [Sub-Category] is not null 
group by [Sub-Category] having avg(Profit) >30 order by Average_Profit desc;

select City + ', ' + State as Location from [dbo].[Orders]

