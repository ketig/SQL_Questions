/* 1.	დაწერეთ SQL სკრიპტი თანამშრომლების(Employees) ცხრილისთვის, რომელიც გვაჩვენებს უმაღლეს ხელფასს(Salary) 
თითოეული როლის(Role) მიხედვით.*/
select Role, max(Salary) as 'Max Salary' 
	from Employees 
	group by Role;

/* 2.	დაწერეთ SQL სკრიპტი თანამშრომლების(Employees) ცხრილისთვის, რომელიც გვაჩვენებს უმაღლეს ხელფასს(salary) 
თითოეული როლის(role) მიხედვით და ამ ხელფასის მფლობელს(name, surname).*/
select Name as 'Employee Name', LastName as 'Employee Surname',
	Role, Salary 
	from Employees 
	where Salary in 
	(select Max(Salary) from Employees group by role);

/* 3.	დაწერეთ SQL სკრიპტი თანამშრომლების(Employees) ცხრილისთვის, რომელიც თითოეული როლისთვის(Role) 
გვაჩვენებს იმ ხელფასების(Salary) ჯამს, რომელიც მერყეობს 300-დან 600-მდე.*/
select Role, Sum(Salary) as Salary from Employees
	where salary > 300 
	and salary < 600
group by Role

/* 4.	დაწერეთ SQL სკრიპტი პრაისლისტების (PriceList) ცხრილისთვის, 
რომელიც გვაჩვენებს დუბლირებული პროდუქტების რაოდენობას პრაისლისტის ჭრილში*/
select PriceListId as PriceList, Count(*) as DuplicatesCount 
	from PriceList
	group by PriceListId, name
	having count(*) > 1

/* 5.	დაწერეთ SQL სკრიპტი პრაისლისტების (PriceList) ცხრილისთვის, 
რომელიც გვაჩვენებს დუბლირებული პროდუქტების რაოდენობას პროდუქტის და პრაისლისტის ჭრილში*/
select P.PriceListId as PriceList, P.Name as Product, Count(*) as DuplicatesCount
	from PriceListProducts as P
	inner join PriceList as PL on P.PriceListId=PL.PriceListId
	group by P.PriceListId, P.Name
	having count(*) > 1
