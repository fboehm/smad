insert overwrite local directory 'doma'
row format delimited 
fields terminated by "\t"
select 
	id_str, 
	created_at, 
	regexp_replace(text, "[ \t\r\n]+", " "), 
	user.id_str, 
	regexp_replace(user.name, "[ \t\r\n]+", " "), 
	user.screen_name, 
	retweeted_status.id_str, 
	retweeted_status.created_at, 
	regexp_replace(retweeted_status.text, "[ \t\r\n]+", " "),
	retweeted_status.user.id_str, 
	regexp_replace(retweeted_status.user.name, "[ \t\r\n]+", " "),
	retweeted_status.user.screen_name 
from gh_rc
where 
	year = 2013 and ( (month = 6 and day >= 12) 
	or (month = 7 and day <= 10) ) and (lower(text) like '%doma%' 
	or lower(text) like '% defense of marriage act%' 
	or lower(text) like '% prop 8%' 
	or lower(text) like '% gay marriage%' 
	or lower(text) like '% gay rights%' 
	or lower(text) like '% same sex marriage%' 
	or lower(text) like '% same sex couples%' 
	or lower(text) like '% Windsor v%' 
	or lower(text) like '% marriage equality%' 
	or lower(text) like '% marriage license%' 
	or lower(text) like '% #doma%' 
	or lower(text) like '% #loveislove%' 
	or lower(text) like '% #marriageequality%' 
	or lower(text) like '% #noh8%' 
	or lower(text) like '% #equality%' 
	or lower(text) like '% #proud%' 
	or lower(text) like '% #gaymarriage%' 
	or lower(text) like '% #prop8%' 
	or lower(text) like '% #equality matters%' 
	or lower(text) like '% scotus%' 
	or lower(text) like '% supreme court%' 
	or lower(text) like '% scotus blog%' 
	or lower(text) like '% #scotus%' 
	or lower(text) like '% #supremecourt%' 
	or lower(text) like '% #scotus%' 
	or lower(retweeted_status.text) like '%doma%' 
	or lower(retweeted_status.text) like '% defense of marriage act%' 
	or lower(retweeted_status.text) like '% prop 8%' 
	or lower(retweeted_status.text) like '% gay marriage%' 
	or lower(retweeted_status.text) like '% gay rights%' 
	or lower(retweeted_status.text) like '% same sex marriage%' 
	or lower(retweeted_status.text) like '% same sex couples%' 
	or lower(retweeted_status.text) like '% Windsor v%' 
	or lower(retweeted_status.text) like '% marriage equality%' 
	or lower(retweeted_status.text) like '% marriage license%' 
	or lower(retweeted_status.text) like '% #doma%' 
	or lower(retweeted_status.text) like '% #loveislove%' 
	or lower(retweeted_status.text) like '% #marriageequality%' 
	or lower(retweeted_status.text) like '% #noh8%' 
	or lower(retweeted_status.text) like '% #equality%' 
	or lower(retweeted_status.text) like '% #proud%' 
	or lower(retweeted_status.text) like '% #gaymarriage%' 
	or lower(retweeted_status.text) like '% #prop8%' 
	or lower(retweeted_status.text) like '% #equality matters%' 
	or lower(retweeted_status.text) like '% scotus%' 
	or lower(retweeted_status.text) like '% supreme court%' 
	or lower(retweeted_status.text) like '% scotus blog%' 
	or lower(retweeted_status.text) like '% #scotus%' 
	or lower(retweeted_status.text) like '% #supremecourt%' 
	or lower(retweeted_status.text) like '% #scotus%');
