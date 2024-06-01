Use work
GO
-- Create Join Tables
Select * From Absenteeism_at_work a
left join compensation c
on a.ID = c.ID
left join Reasons r on a.Reason_for_absence = r.number


--- Find the Healthest Emplyee
Select * From Absenteeism_at_work
where Social_drinker = 0 and Social_smoker = 0
and Body_mass_index < 25 and 
Absenteeism_time_in_hours < (Select AVG(Absenteeism_time_in_hours) from Absenteeism_at_work)

--- Compensation Rate Increases for non-smokers/ Budget $983,221 So %68 increase per hour/ $001,414.1 Increase per Year
Select count(*) as Non_Smooker from Absenteeism_at_work
Where Social_smoker=0;

--- Optimize the First Query Performance
Select 
a.ID,
r.Reason,
Case	When Body_mass_index < 18.5 Then 'Underweight'
		When Body_mass_index between 18.5 and 25 Then 'Healthy Weight'
		When Body_mass_index between 25 and 30 Then 'Over Weight'
		Else 'Obese' End as BMI_Category,		-- is a person's weight in kilograms divided by the square of height in meters

Case	When Month_of_absence IN (12, 1, 2) Then 'Winter'
		When Month_of_absence IN (3, 4, 5) Then 'Spring'
		When Month_of_absence IN (6, 7, 8) Then 'Summer'
		When Month_of_absence IN (9, 10, 11) Then 'Fall'
		Else 'Unknow' End as Season_Names,		-- Here we Segment the 4 Seasons
Month_of_absence,
Day_of_the_week,
Transportation_expense,
Son,
Social_drinker,
Social_smoker,
Pet,
Disciplinary_failure,
Age,
Work_load_Average_day,
Hit_target,
Distance_from_Residence_to_Work,
Absenteeism_time_in_hours
From Absenteeism_at_work a
left join compensation c
on a.ID = c.ID
left join Reasons r on a.Reason_for_absence = r.number
