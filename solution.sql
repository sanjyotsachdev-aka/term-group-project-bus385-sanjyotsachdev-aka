-- Write your SQL query below:
SELECT c.ClassID, c.ClassName, c.Instructor, c.ScheduleDate, c.ScheduleTime, 
       m.MemberID, m.FirstName, m.LastName
FROM Classes c
LEFT JOIN ClassRegistrations cr ON c.ClassID = cr.ClassID
LEFT JOIN Members m ON cr.MemberID = m.MemberID
WHERE c.ClassName = 'Zumba'
ORDER BY c.ClassID;

SELECT DATE_FORMAT(PaymentDate, '%Y/%m') AS Month,
       SUM(Amount) AS `Total Revenue`
FROM Payments
GROUP BY DATE_FORMAT(PaymentDate, '%Y/%m')
ORDER BY Month;

SELECT DATE_FORMAT(p.PaymentDate, '%Y/%m') AS Month,
       mp.PlanName AS `Plan Name`,
       SUM(p.Amount) AS `Total Revenue`
FROM Payments p
JOIN Members m ON p.MemberID = m.MemberID
JOIN MembershipPlans mp ON m.MembershipPlanID = mp.MembershipPlanID
WHERE DATE_FORMAT(p.PaymentDate, '%Y/%m') = '2026/04'
GROUP BY Month, mp.PlanName
ORDER BY Month, `Total Revenue` DESC;
