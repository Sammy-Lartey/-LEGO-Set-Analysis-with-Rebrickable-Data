USE [REBRICKABLE]
GO

/****** Object:  View [dbo].[analytics_main]    Script Date: 3/28/2024 12:30:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER view [dbo].[analytics_main] as


select s.set_num, s.name as set_name, s.year, s.theme_id, cast(s.num_parts as numeric) num_parts, t.name as theme_name, t.parent_id, p.name as parent_theme_name,
case 
	when s.year between 1901 and 2000 then '20th_Century'
	when s.year between 2001 and 2100 then '21st_Century'
end
as Century
from dbo.sets s
left join [dbo].[themes] t
	on s.theme_id = t.id
left join [dbo].[themes] p
	on t.parent_id = p.id
GO



