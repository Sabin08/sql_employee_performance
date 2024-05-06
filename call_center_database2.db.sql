/* Q.1 Write a query to find total count of calls and sum of total sales.*/
SELECT COUNT(*) AS TotalCalls, SUM(ProductSold) AS TotalSales 
FROM call;

/*Q.2 Write a query that outputs each agent’s name, the total calls made, 
and their total successful sales. Order the new query by agent name in ascending order.*/
select agent.name, count(*) as total_calls,sum(call.productsold) as total_call  from call
inner join agent on call.agentid = agent.agentid group by agent.name;

/*Q.3 Write a query that outputs each agent’s name, the total calls made, 
and their average success percent. Order the new query by successpercent*/
select agent.name, count(*) as total_calls,avg(call.productsold)*100 as success_percent  from call
inner join agent on call.agentid = agent.agentid group by agent.name order by success_percent desc;

/* Q.4 Modify the query in Q.3 to only consider calls which the customer answered, 
and where the customer’s age is at least 18.*/

select agent.name, count(*) as total_calls,avg(call.productsold)*100 as success_percent 
from call
inner join agent on call.agentid = agent.agentid
inner join customer on call.customerid = customer.customerid 
where customer.age >= 18 and call.pickedup = 1
group by agent.name order by success_percent desc;

/* Q.5 select any records where the age was 18, 20, 25, 30, or 35.*/
select * from customer where age in ('18','20','25','30','35');

/* Q.6 Write query that should show the agent’s name, the total number of calls they made, 
and their product sales conversion percentage. Filter each query to only include 
calls with customers who are 35 or older and whose job contains the word "Engineer".*/
select name, count(*) as total_sales, avg(productsold)*100 as success_percent 
from call
inner join agent on call.agentid = agent.agentid
where customerid in (select customerid from customer 
                     where age >= 35 and occupation like 'Engineer%')
group by name
order by success_percent desc;

/*Q.7 Write a query to find the average duration of calls for each agent in the call table.*/

SELECT a.name, AVG(b.Duration)
FROM agent a, call b
WHERE a.AgentID = b.AgentID
GROUP BY a.name;

/*Q.8 Use a subquery to get the name, call ID, and duration for every call 
where the duration is greater than the average call duration. 
Make sure to exclude calls with a Duration of 0 from the average calculation.
Limit the results to the first 15 calls.*/
select agent.name, call.callid, call.duration from call inner join agent on call.agentid = agent.agentid
where duration > 0 and duration > (select avg(duration) from call where duration <> 0)
limit 15;
                                     
