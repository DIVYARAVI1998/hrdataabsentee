--create a join table

select * from Absenteeism_at_work a
left join compensation b on 
a.ID=b.ID
left join Reasons R on a.Reason_for_absence=R.Number

---find the healthiest 
select * from Absenteeism_at_work 
where Social_drinker=0 and Social_smoker=0 and Body_mass_index <25 and 
Absenteeism_time_in_hours < (select AVG(Absenteeism_time_in_hours) from Absenteeism_at_work )

---compensation ivrease for  non smokers
select COUNT(*) as non_smoker from Absenteeism_at_work
where Social_smoker=0


-- optimize the query 
select a.ID,R.Reason ,Month_of_absence,Body_mass_index,
case when Body_mass_index <18.5 then 'underweight'
     when Body_mass_index between 18.5 and 25 then 'healthy'
	 when Body_mass_index between 25 and 30  then 'over weight'
	 when Body_mass_index >30 then 'obese'
	 else 'unknown' end as bmi_category,

case when Month_of_absence in(12,1,2) then 'winter'
     when Month_of_absence in(3,4,5) then 'spring'
	 when Month_of_absence in(6,7,8) then 'summer'
	 when Month_of_absence in(9,10,11) then 'rainfall'
	 else 'unknown' end as season_names,
	 Month_of_absence,
	 Day_of_the_week,
	 Transportation_expense,
	 Social_drinker,
	 Social_smoker,
	 Age
from Absenteeism_at_work a
left join compensation b on 
a.ID=b.ID
left join Reasons R on a.Reason_for_absence=R.Number

