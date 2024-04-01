
--- Question 1

--- what is the total number of parts per theme

select* from dbo.analytics_main

select theme_name, sum(num_parts) as total_num_parts
from dbo.analytics_main
--- where parent_theme_name is not null
group by theme_name
order by 2 desc


--- Question 2

--- What is the total number of parts per year

select year, sum(num_parts) as total_num_parts
from dbo.analytics_main
where parent_theme_name is not null
group by year
order by 2 desc

--- Question 3

--- How many sets were created in each century in the dataset

select Century, count(set_num) as total_set_num
from dbo.analytics_main
---where parent_theme_name is not null
group by Century

--- Question 4

--- What percentage of sets ever released in the 21st Century were Trains Themed

;with cte as
(
	select Century, theme_name, count(set_num) as total_set_num 
	from analytics_main
	where Century = '21st_Century'
	group by Century, theme_name
)
select sum(total_set_num), sum(percentage)
from(
	select Century, theme_name, total_set_num,sum(total_set_num) OVER() as total, cast(1.00 * total_set_num / sum(total_set_num) OVER() as decimal(5,4))*100 Percentage
	from cte
	---order by 3 desc
	)m
where theme_name like '%Star wars%'


--- Question 5

--- What is the popular theme by year in terms of sets released in the 21st Century 
	
select year, theme_name, total_set_num
from(
	select year, theme_name, count(set_num) as total_set_num, ROW_NUMBER() OVER(partition by year order by count(set_num) desc) rn 
	from analytics_main
	where Century = '21st_Century'
		and parent_theme_name is not null
	group by year, theme_name
)m
where rn= 1
order by year desc

--- Question 6

--- What is the most produced color of lego ever in terms of quantity of parts?

select color_name, sum(quantity) as quantity_of_parts
from
	(
	select
		inv.color_id, inv.inventory_id, inv.part_num, cast(inv.quantity as numeric) quantity, inv.is_spare, c.name as color_name, c.rgb, p.name as part_name, p.part_material, pc.name as category_name
	from inventory_parts inv
	inner join colors c
		on inv.color_id = c.id
	inner join parts p
		on inv.part_num = p.part_num
	inner join part_categories pc
		on part_cat_id = pc.id
	)main

group by color_name
order by 2 desc