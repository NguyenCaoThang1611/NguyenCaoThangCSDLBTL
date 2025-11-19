
SELECT * FROM THANH_PHO;

INSERT INTO THANH_PHO (MaThanhPho, TenThanhPho) 
VALUES ('TP09', 'Hải Dương');

UPDATE THANH_PHO 
SET TenThanhPho = 'Hải Dương City' 
WHERE MaThanhPho = 'TP09';

DELETE FROM THANH_PHO 
WHERE MaThanhPho= 'TP09';


--2.
SELECT * FROM CHI_NHANH;

INSERT INTO CHI_NHANH (MaChiNhanh, TenChiNhanh, MaThanhPho)
VALUES ('CN09', 'Chi nhánh Hải Dương', 'TP09');

UPDATE CHI_NHANH 
SET TenChiNhanh = 'CN Hải Dương' 
WHERE MaChiNhanh = 'CN09';

DELETE FROM CHI_NHANH WHERE MaChiNhanh = 'CN09';


--3.
SELECT * FROM TRAM_DUNG;

SELECT MaTram, TenTram, ViTri, TrangThai
FROM TRAM_DUNG
WHERE TrangThai = N'Hoạt động';

SELECT *
FROM TRAM_DUNG
WHERE TenTram LIKE N'%Hà Nội%' OR ViTri LIKE N'%Hà Nội%';

SELECT *
FROM TRAM_DUNG
WHERE TrangThai LIKE N'%Tạm%';

UPDATE TRAM_DUNG
SET ViTri = N'Trung tâm Cầu Giấy, Hà Nội', NgayCapNhat = GETDATE()
WHERE MaTram = 'T003';

 DELETE FROM TRAM_DUNG WHERE MaTram = 'T015';

 INSERT INTO TRAM_DUNG VALUES ('T016', N'Trạm Mỹ Đình', N'Mỹ Đình, Hà Nội', NULL, N'Hoạt động', GETDATE(), N'Trung tâm');

--4.

SELECT *
FROM TUYEN_XE;

SELECT MaTuyen, TenTuyen, TrangThai, NgayCapNhat
FROM TUYEN_XE
WHERE TrangThai = N'Đang chạy';

SELECT MaTuyen, TenTuyen, TrangThai
FROM TUYEN_XE
WHERE TrangThai = N'Tạm dừng';

SELECT *
FROM TUYEN_XE
WHERE MaTuyen = 'TX01'; 

SELECT *
FROM TUYEN_XE
WHERE TenTuyen LIKE N'%Giáp Bát%';

SELECT TrangThai, COUNT(*) AS SoLuong
FROM TUYEN_XE
GROUP BY TrangThai;

UPDATE TUYEN_XE
SET TrangThai = N'Tạm dừng', NgayCapNhat = GETDATE()
WHERE MaTuyen = 'TX05';

DELETE FROM TUYEN_XE
WHERE MaTuyen = 'TX10';

SELECT TX.MaTuyen, TX.TenTuyen, CN.TenChiNhanh
FROM TUYEN_XE TX
JOIN CHI_NHANH CN ON TX.MaChiNhanh = CN.MaChiNhanh
WHERE CN.MaChiNhanh = 'CN01';

SELECT TOP 1 *
FROM TUYEN_XE
ORDER BY NgayCapNhat DESC;

--5.

SELECT *
FROM TUYEN_TRAM;

SELECT MaTuyen, MaTram, ThuTu
FROM TUYEN_TRAM
ORDER BY MaTuyen, ThuTu;

SELECT MaTuyen, MaTram, ThuTu
FROM TUYEN_TRAM
WHERE MaTuyen = 'TX02'
ORDER BY ThuTu;

SELECT MaTuyen, MaTram
FROM TUYEN_TRAM
WHERE MaTram = 'T003';

SELECT MaTuyen, COUNT(*) AS SoTram
FROM TUYEN_TRAM
GROUP BY MaTuyen;

SELECT TOP 1 MaTuyen, COUNT(*) AS SoTram
FROM TUYEN_TRAM
GROUP BY MaTuyen
ORDER BY SoTram DESC;


SELECT 
    TT.MaTuyen,
    TX.TenTuyen,
    TT.MaTram,
    TD.TenTram,
    TT.ThuTu
FROM TUYEN_TRAM TT
JOIN TUYEN_XE TX ON TT.MaTuyen = TX.MaTuyen
JOIN TRAM_DUNG TD ON TT.MaTram = TD.MaTram
ORDER BY TT.MaTuyen, TT.ThuTu;

UPDATE TUYEN_TRAM
SET ThuTu = 1
WHERE MaTuyen = 'TX02' AND MaTram = 'T003';

DELETE FROM TUYEN_TRAM
WHERE MaTuyen = 'TX10' AND MaTram = 'T015';

--.6
SELECT *
FROM XE_BUYT;

SELECT MaXe, SoXe, SoChoNgoi, MaTuyen, TrangThai, NgayCapNhat
FROM XE_BUYT
WHERE TrangThai = N'Hoạt động';

SELECT MaXe, SoXe, TrangThai
FROM XE_BUYT
WHERE TrangThai IN (N'Bảo trì', N'Tạm ngừng', N'Tạm nghỉ');

SELECT MaXe, SoXe, MaTuyen, TrangThai
FROM XE_BUYT
WHERE MaTuyen = 'TX02';

SELECT *
FROM XE_BUYT
WHERE SoXe LIKE '%29C%';

SELECT TrangThai, COUNT(*) AS SoLuongXe
FROM XE_BUYT
GROUP BY TrangThai;

SELECT MaTuyen, COUNT(*) AS SoLuongXe
FROM XE_BUYT
GROUP BY MaTuyen;

SELECT 
    X.MaXe, X.SoXe, X.SoChoNgoi, X.TrangThai, 
    T.MaTuyen, T.TenTuyen
FROM XE_BUYT X
JOIN TUYEN_XE T ON X.MaTuyen = T.MaTuyen;

SELECT MaXe, SoXe, MoTa
FROM XE_BUYT
WHERE MoTa LIKE N'%Mini%';

UPDATE XE_BUYT
SET TrangThai = N'Bảo trì', NgayCapNhat = GETDATE()
WHERE MaXe = 'X04';

DELETE FROM XE_BUYT
WHERE MaXe = 'X13';


--8:

SELECT * FROM PHAN_CONG_LAI_XE;

SELECT * FROM PHAN_CONG_LAI_XE WHERE Ngay = '2025-06-24';

SELECT * FROM PHAN_CONG_LAI_XE WHERE TrangThai = N'Đã lái';

SELECT * FROM PHAN_CONG_LAI_XE WHERE TrangThai = N'Dự kiến';

SELECT * FROM PHAN_CONG_LAI_XE WHERE MaTaiXe = 'TXE05';

SELECT * FROM PHAN_CONG_LAI_XE WHERE MaXe = 'X10';

SELECT MaTaiXe, COUNT(*) AS SoLanLai
FROM PHAN_CONG_LAI_XE
GROUP BY MaTaiXe;

SELECT MaTaiXe, MaXe, Ngay, MoTa, TrangThai
FROM PHAN_CONG_LAI_XE
ORDER BY Ngay DESC;

SELECT * FROM PHAN_CONG_LAI_XE WHERE MoTa LIKE N'%sáng%';

UPDATE PHAN_CONG_LAI_XE
SET TrangThai = N'Đã lái', NgayCapNhat = GETDATE()
WHERE TrangThai = N'Dự kiến';
GO
