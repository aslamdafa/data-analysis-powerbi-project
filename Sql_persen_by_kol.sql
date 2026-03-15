SELECT 
    a.Periode,
    a.Kolektibilitas,
    SUM(a.Sisa_Outstanding) AS total_os_by_kol,
    b.total_os_all,
    SUM(a.Sisa_Outstanding) * 1.0 / b.total_os_all AS persentase
FROM banking_dataset a
JOIN (
    SELECT 
        Periode,
        SUM(Sisa_Outstanding) AS total_os_all
    FROM banking_dataset
    GROUP BY Periode
) b ON a.Periode = b.Periode
GROUP BY a.Periode, a.Kolektibilitas, b.total_os_all
ORDER BY a.Periode, a.Kolektibilitas;
