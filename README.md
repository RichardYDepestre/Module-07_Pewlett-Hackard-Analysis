# Pewlett-Hackard-analysis (Module 7 Challenge)

## Project Overview: 
#### Employees at Pewlett Hacker at different levels are approaching retirement. Since, most of these employee hold key positions, there is a need to plan for knowledge and experience transters.  We are tasked with determining the number of retiring employees by their titles, and identify current ones that become eligible to participate in a mentorship program. We will present, below, the result of our analysis and prepare management for the “silver tsunami”, as they put it

## Data gathering approach
#### We created scripts to manually build the tables needed and load them with raw data that our client has provided. Data consistency and integrity shaped the design and structures of the tables.
#### We used advanced SQL concepts to extract information about the employees eligible for retirement, the positions and unique titles they hold. Finally, we looked at those eligible to take the reign.
Our client has provided us with the requirements this analysis is based upon:
1) 'Retrieve the emp_no, first_name, and last_name columns from the Employees table; \
1.1. Augment it with the title, from_date, and to_date columns from the Titles table; \
1.2. 'Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number'; \
1.3. 'Export the Retirement Titles table from the previous step as **retirement_titles.csv** and save it to your Data folder in the **Pewlett-Hackard-Analysis** folder'.
The script to build the tables is listed in the following sql file: **Employee_Database_challenge.sql**. \
#### The artifact that came out of this step lists Senior Engineer, Senior Staff, Engineer, Staff, Technique Leader, Assistant Engineer, Manager as ripe for requirement, per PH's date range. [See attached - Retiring Titles](../Pewlett-Hackard-analysis/data/retirement_titles.csv). The data as it appears in this file is raw that is, it contains duplicates. This is a historical table as it accounts for the positions or titles an employee holds while at PH. An accurate number will come in the next step.

2) 'Retrieve the employee number, first and last name, and title columns from the Retirement Titles table'; \
2.1. Create a Unique Titles table using the INTO clause; \
2.2. Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e. to_date) of the most recent title; \
2.3. Export the Unique Titles table as unique_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
#### The artifact that shows the number of unique titles for the employees eligible for retirement. It groups the employees by positions. [See attached - Unique Titles](../Pewlett-Hackard-analysis/data/unique_titles.csv). The retiring_titles file cleans up the previous results and shows size number of employees in Senior Engineer, Senior Staff, Engineer and Staff.
3) Identify by name, birth data, length of time in a department. This requirement is meant to establish a list of potential replacement for the to-be-retired employees.
#### Our analysis indicates that there are 1549 employees that meet the criterion to 'get current employees whose birth dates are between January 1, 1965 and December 31, 1965'. [See attached - Mentoring Eligibility](../Pewlett-Hackard-analysis/data/mentorship_eligibility.csv)
## Analysis
 perused the data from the tables listed above and attempt to answer the following questions: \
q) How many roles will need to be filled as the "silver tsunami" begins to make an impact? \
a) We found, by other of numerical importance, that the following roles will require immediate consideration as to filling them. They are listed in the following table [Retiring Titles](../Pewlett-Hackard-analysis/data/retiring_titles.csv). A total of 90398 employees would be impacted.

q) Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees? \
a) Short answer is yes there are. However, we find that the number of employees slated to be mentored is infinitely small considering the number high quality resources slated to retired.
## Conclusion
#### We believe that we have provided enough data to the manager and assist him in his decision. There are quite a number of employees that fall within the retiring data ranges used in this analysis. We would also reiterate a fact that we observed and documented: the number of employees flagged for mentorship seem small.
