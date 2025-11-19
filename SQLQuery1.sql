﻿CREATE DATABASE QUAN_LY_XE_BUYT;
GO

USE QUAN_LY_XE_BUYT;
GO

--  TẠO BẢNG + DỮ LIỆU: THÀNH PHỐ

CREATE TABLE THANH_PHO (
    MaThanhPho VARCHAR(10) PRIMARY KEY,
    TenThanhPho NVARCHAR(100),
    GhiChu NVARCHAR(255),
    TrangThai NVARCHAR(50),
    NgayCapNhat DATETIME,
    MoTa NVARCHAR(255)
);

INSERT INTO THANH_PHO (MaThanhPho, TenThanhPho)
VALUES 
('TP04', N'Hải Phòng'),
('TP05', N'Cần Thơ'),
('TP06', N'Bình Dương'),
('TP07', N'Biên Hòa'),
('TP08', N'Bắc Ninh'),
('TP09', N'Nha Trang'),
('TP10', N'Vũng Tàu'),
('TP11', N'Huế'),
('TP12', N'Thanh Hóa'),
('TP13', N'Quảng Ninh'),
('TP14', N'Buôn Ma Thuột'),
('TP15', N'Lạng Sơn');


--  TẠO BẢNG + DỮ LIỆU: CHI NHÁNH
CREATE TABLE CHI_NHANH (
    MaChiNhanh VARCHAR(10) PRIMARY KEY,
    TenChiNhanh NVARCHAR(100),
    MaThanhPho VARCHAR(10) FOREIGN KEY REFERENCES THANH_PHO(MaThanhPho),
     ViTri NVARCHAR(255),
    GhiChu NVARCHAR(255),
    TrangThai NVARCHAR(50),
    NgayCapNhat DATETIME,
    MoTa NVARCHAR(255)
);
INSERT INTO CHI_NHANH (MaChiNhanh, TenChiNhanh, MaThanhPho, GhiChu, TrangThai, NgayCapNhat, MoTa) 
VALUES 
('CN03', N'Chi nhánh Hải Phòng', 'TP04', NULL, N'Hoạt động', GETDATE(), N'Khu vực miền Bắc'),
('CN04', N'Chi nhánh Cần Thơ', 'TP05', NULL, N'Hoạt động', GETDATE(), N'Khu vực miền Tây'),
('CN05', N'Chi nhánh Bình Dương', 'TP06', NULL, N'Tạm ngừng', GETDATE(), N'Chi nhánh công nghiệp'),
('CN06', N'Chi nhánh Biên Hòa', 'TP07', NULL, N'Hoạt động', GETDATE(), N'Đông Nam Bộ'),
('CN07', N'Chi nhánh Bắc Ninh', 'TP08', NULL, N'Hoạt động', GETDATE(), N'Bắc Ninh City'),
('CN08', N'Chi nhánh Nha Trang', 'TP09', NULL, N'Hoạt động', GETDATE(), N'Trung Bộ'),
('CN09', N'Chi nhánh Vũng Tàu', 'TP10', NULL, N'Tạm dừng', GETDATE(), N'Du lịch biển'),
('CN10', N'Chi nhánh Huế', 'TP11', NULL, N'Hoạt động', GETDATE(), N'Vùng cố đô'),
('CN11', N'Chi nhánh Thanh Hóa', 'TP12', NULL, N'Hoạt động', GETDATE(), N'Bắc Trung Bộ'),
('CN12', N'Chi nhánh Quảng Ninh', 'TP13', NULL, N'Hoạt động', GETDATE(), N'Vùng than'),
('CN13', N'Chi nhánh Đắk Lắk', 'TP14', NULL, N'Hoạt động', GETDATE(), N'Tây Nguyên'),
('CN14', N'Chi nhánh Lạng Sơn', 'TP15', NULL, N'Hoạt động', GETDATE(), N'Biên giới phía Bắc');

--  TẠO BẢNG + DỮ LIỆU: TRẠM DỪNG
CREATE TABLE TRAM_DUNG (
    MaTram VARCHAR(10) PRIMARY KEY,
    TenTram NVARCHAR(100),
    ViTri NVARCHAR(255),
    GhiChu NVARCHAR(255),
    TrangThai NVARCHAR(50),
    NgayCapNhat DATETIME,
    MoTa NVARCHAR(255)
);

INSERT INTO TRAM_DUNG (MaTram, TenTram, ViTri, GhiChu, TrangThai, NgayCapNhat, MoTa) 
VALUES 
('T003', N'Trạm Cầu Giấy', N'Cầu Giấy, Hà Nội', NULL, N'Hoạt động', GETDATE(), N'Trung tâm'),
('T004', N'Trạm Tân Bình', N'Tân Bình, TP.HCM', NULL, N'Hoạt động', GETDATE(), N'Trung chuyển'),
('T005', N'Trạm Quận 7', N'Quận 7, TP.HCM', NULL, N'Tạm ngừng', GETDATE(), N'Đông khách'),
('T006', N'Trạm Long Biên', N'Long Biên, Hà Nội', NULL, N'Hoạt động', GETDATE(), N'Đầu mối xe'),
('T007', N'Trạm Bắc Ninh', N'Bắc Ninh', NULL, N'Hoạt động', GETDATE(), N'Trạm tỉnh'),
('T008', N'Trạm Cần Thơ', N'Ninh Kiều, Cần Thơ', NULL, N'Hoạt động', GETDATE(), N'Trung tâm'),
('T009', N'Trạm Biên Hòa', N'TP Biên Hòa', NULL, N'Tạm nghỉ', GETDATE(), N'Tạm ngưng'),
('T010', N'Trạm Đà Lạt', N'TP Đà Lạt', NULL, N'Hoạt động', GETDATE(), N'Trạm du lịch'),
('T011', N'Trạm Quảng Ninh', N'Uông Bí, Quảng Ninh', NULL, N'Hoạt động', GETDATE(), N'Khai thác mới'),
('T012', N'Trạm Vũng Tàu', N'TP Vũng Tàu', NULL, N'Hoạt động', GETDATE(), N'Biển'),
('T013', N'Trạm Huế', N'TP Huế', NULL, N'Hoạt động', GETDATE(), N'Trung tâm'),
('T014', N'Trạm Tây Hồ', N'Tây Hồ, Hà Nội', NULL, N'Hoạt động', GETDATE(), N'Khu nghỉ dưỡng'),
('T015', N'Trạm Hòa Bình', N'TP Hòa Bình', NULL, N'Tạm dừng', GETDATE(), N'Trung chuyển');


--  TẠO BẢNG + DỮ LIỆU: TUYẾN XE
CREATE TABLE TUYEN_XE (
    MaTuyen VARCHAR(10) PRIMARY KEY,
    TenTuyen NVARCHAR(100),
    TramKhoiHanh VARCHAR(10) FOREIGN KEY REFERENCES TRAM_DUNG(MaTram),
    TramKetThuc VARCHAR(10) FOREIGN KEY REFERENCES TRAM_DUNG(MaTram),
    MaChiNhanh VARCHAR(10) FOREIGN KEY REFERENCES CHI_NHANH(MaChiNhanh),
    GhiChu NVARCHAR(255),
    TrangThai NVARCHAR(50),
    NgayCapNhat DATETIME,
    MoTa NVARCHAR(255)
);

INSERT INTO TUYEN_XE (MaTuyen, TenTuyen, TramKhoiHanh, TramKetThuc, MaChiNhanh, GhiChu, TrangThai, NgayCapNhat, MoTa)
VALUES 
('TX02', N'Tuyến Cầu Giấy - Long Biên', 'T003', 'T006', 'CN01', NULL, N'Đang chạy', GETDATE(), N'Nội đô HN'),
('TX03', N'Tuyến Tân Bình - Quận 7', 'T004', 'T005', 'CN02', NULL, N'Tạm dừng', GETDATE(), N'Nội đô HCM'),
('TX04', N'Tuyến Bắc Ninh - Mỹ Đình', 'T007', 'T002', 'CN07', NULL, N'Đang chạy', GETDATE(), N'Tỉnh - Thành'),
('TX05', N'Tuyến Cần Thơ - Quận 1', 'T008', 'T001', 'CN04', NULL, N'Đang chạy', GETDATE(), N'Liên vùng'),
('TX06', N'Tuyến Biên Hòa - Vũng Tàu', 'T009', 'T012', 'CN06', NULL, N'Đang chạy', GETDATE(), N'Liên tỉnh'),
('TX07', N'Tuyến Huế - Đà Nẵng', 'T013', 'T010', 'CN10', NULL, N'Đang chạy', GETDATE(), N'Trung Bộ'),
('TX08', N'Tuyến Tây Hồ - Cầu Giấy', 'T014', 'T003', 'CN01', NULL, N'Đang chạy', GETDATE(), N'Nội đô'),
('TX09', N'Tuyến Quảng Ninh - Bắc Ninh', 'T011', 'T007', 'CN12', NULL, N'Đang chạy', GETDATE(), N'Khai thác mới'),
('TX10', N'Tuyến Hòa Bình - Hà Nội', 'T015', 'T002', 'CN13', NULL, N'Tạm nghỉ', GETDATE(), N'Dự phòng');

--  TẠO BẢNG + DỮ LIỆU: TUYẾN - TRẠM
CREATE TABLE TUYEN_TRAM (
    MaTuyen VARCHAR(10) FOREIGN KEY REFERENCES TUYEN_XE(MaTuyen),
    MaTram VARCHAR(10) FOREIGN KEY REFERENCES TRAM_DUNG(MaTram),
    ThuTu INT,
    PRIMARY KEY (MaTuyen, MaTram)
);

INSERT INTO TUYEN_TRAM (MaTuyen, MaTram, ThuTu)
VALUES 
('TX02', 'T003', 1),
('TX02', 'T006', 2),
('TX03', 'T004', 1),
('TX03', 'T005', 2),
('TX04', 'T007', 1),
('TX04', 'T002', 2),
('TX05', 'T008', 1),
('TX05', 'T001', 2),
('TX06', 'T009', 1),
('TX06', 'T012', 2),
('TX07', 'T013', 1),
('TX07', 'T010', 2),
('TX08', 'T014', 1),
('TX08', 'T003', 2),
('TX10', 'T015', 1);

--  TẠO BẢNG + DỮ LIỆU: XE BUÝT
CREATE TABLE XE_BUYT (
    MaXe VARCHAR(10) PRIMARY KEY,
    SoXe VARCHAR(20),
    SoChoNgoi INT,
    MaTuyen VARCHAR(10) FOREIGN KEY REFERENCES TUYEN_XE(MaTuyen),
    GhiChu NVARCHAR(255),
    TrangThai NVARCHAR(50),
    NgayCapNhat DATETIME,
    MoTa NVARCHAR(255)
);

INSERT INTO XE_BUYT (MaXe, SoXe, SoChoNgoi, MaTuyen, GhiChu, TrangThai, NgayCapNhat, MoTa)
VALUES 
('X03', '29C-11111', 40, 'TX02', NULL, N'Hoạt động', GETDATE(), N'Tiêu chuẩn'),
('X04', '29C-22222', 35, 'TX03', NULL, N'Bảo trì', GETDATE(), N'Mini'),
('X05', '29C-33333', 30, 'TX04', NULL, N'Hoạt động', GETDATE(), N'Tiêu chuẩn'),
('X06', '29C-44444', 45, 'TX05', NULL, N'Tạm nghỉ', GETDATE(), N'Tuyến dài'),
('X07', '29C-55555', 50, 'TX06', NULL, N'Hoạt động', GETDATE(), N'Tiêu chuẩn cao'),
('X08', '29C-66666', 20, 'TX07', NULL, N'Hoạt động', GETDATE(), N'Mini bus'),
('X09', '29C-77777', 36, 'TX08', NULL, N'Bảo trì', GETDATE(), N'Ngắn tuyến'),
('X10', '29C-88888', 32, 'TX09', NULL, N'Hoạt động', GETDATE(), N'Liên tỉnh'),
('X11', '29C-99999', 28, 'TX10', NULL, N'Tạm ngừng', GETDATE(), N'Dự phòng'),
('X12', '30A-12345', 40, 'TX01', NULL, N'Đang sử dụng', GETDATE(), N'Tuyến chính'),
('X13', '30A-23456', 30, 'TX02', NULL, N'Đang sử dụng', GETDATE(), N'Xe nhỏ');


--  TẠO BẢNG + DỮ LIỆU: TÀI XẾ
CREATE TABLE TAI_XE (
    MaTaiXe VARCHAR(10) PRIMARY KEY,
    TenTaiXe NVARCHAR(100),
    SoDienThoai VARCHAR(20),
    CMND VARCHAR(20),
    NgaySinh DATE,
    DiaChi NVARCHAR(255),
    HangBang VARCHAR(5),
    GhiChu NVARCHAR(255),
    TrangThai NVARCHAR(50),
    NgayCapNhat DATETIME,
    MoTa NVARCHAR(255)
);

INSERT INTO TAI_XE (MaTaiXe, TenTaiXe, SoDienThoai, CMND, NgaySinh, DiaChi, HangBang, GhiChu, TrangThai, NgayCapNhat, MoTa)
VALUES 
('TXE03', N'Phạm Văn C', '0909555123', '111111111', '1987-03-20', N'Bắc Giang', 'D', NULL, N'Hoạt động', GETDATE(), N'Tài xế giàu kinh nghiệm'),
('TXE04', N'Trần Thị D', '0909777456', '222222222', '1989-07-11', N'Hải Phòng', 'C', NULL, N'Nghỉ phép', GETDATE(), N'Mới vào nghề'),
('TXE05', N'Ngô Văn E', '0911333444', '333333333', '1980-12-30', N'Nam Định', 'D', NULL, N'Hoạt động', GETDATE(), N'Lái lâu năm'),
('TXE06', N'Hoàng Thị F', '0938123456', '444444444', '1992-06-14', N'Nghệ An', 'C', NULL, N'Hoạt động', GETDATE(), N'Rất nghiêm túc'),
('TXE07', N'Nguyễn Văn G', '0944234567', '555555555', '1985-09-09', N'TP.HCM', 'D', NULL, N'Tạm nghỉ', GETDATE(), N'Đã nghỉ tạm thời'),
('TXE08', N'Lý Thị H', '0911001223', '666666666', '1993-01-25', N'Cần Thơ', 'C', NULL, N'Hoạt động', GETDATE(), N'Nữ tài xế'),
('TXE09', N'Trịnh Văn I', '0907766543', '777777777', '1981-11-15', N'Hà Nội', 'D', NULL, N'Nghỉ phép', GETDATE(), N'Chuyên tuyến Bắc'),
('TXE10', N'Lưu Văn K', '0988111000', '888888888', '1995-08-08', N'Bình Dương', 'C', NULL, N'Hoạt động', GETDATE(), N'Nhẹ nhàng'),
('TXE11', N'Hồ Thị L', '0977888999', '999999999', '1988-10-10', N'Đà Nẵng', 'D', NULL, N'Hoạt động', GETDATE(), N'Tuyệt vời'),
('TXE12', N'Tạ Văn M', '0911222333', '121212121', '1984-04-17', N'Bắc Ninh', 'D', NULL, N'Hoạt động', GETDATE(), N'Lái tuyến dài'),
('TXE13', N'Đỗ Thị N', '0933111222', '232323232', '1986-02-28', N'Lào Cai', 'C', NULL, N'Tạm nghỉ', GETDATE(), N'Cẩn thận'),
('TXE14', N'Bùi Văn O', '0944333444', '343434343', '1982-03-03', N'Lạng Sơn', 'D', NULL, N'Hoạt động', GETDATE(), N'10 năm tuyến miền Bắc'),
('TXE15', N'Trần Thị P', '0955222333', '454545454', '1991-09-29', N'Hà Nam', 'C', NULL, N'Nghỉ phép', GETDATE(), N'Mới vào nghề');


--  TẠO BẢNG + DỮ LIỆU: PHÂN CÔNG LÁI XE
CREATE TABLE PHAN_CONG_LAI_XE (
    MaTaiXe VARCHAR(10) FOREIGN KEY REFERENCES TAI_XE(MaTaiXe),
    MaXe VARCHAR(10) FOREIGN KEY REFERENCES XE_BUYT(MaXe),
    Ngay DATE,
    GhiChu NVARCHAR(255),
    TrangThai NVARCHAR(50),
    NgayCapNhat DATETIME,
    MoTa NVARCHAR(255),
    PRIMARY KEY (MaTaiXe, MaXe, Ngay)
);

INSERT INTO PHAN_CONG_LAI_XE (MaTaiXe, MaXe, Ngay, GhiChu, TrangThai, NgayCapNhat, MoTa)
VALUES 
('TXE03', 'X03', '2025-06-21', NULL, N'Đã lái', GETDATE(), N'Ca chiều'),
('TXE04', 'X04', '2025-06-21', NULL, N'Dự kiến', GETDATE(), N'Ca sáng'),
('TXE05', 'X05', '2025-06-22', NULL, N'Đã lái', GETDATE(), N'Ca chiều'),
('TXE06', 'X06', '2025-06-22', NULL, N'Đã lái', GETDATE(), N'Ca tối'),
('TXE07', 'X07', '2025-06-23', NULL, N'Dự kiến', GETDATE(), N'Ca sáng'),
('TXE08', 'X08', '2025-06-23', NULL, N'Đã lái', GETDATE(), N'Ca chiều'),
('TXE09', 'X09', '2025-06-24', NULL, N'Dự kiến', GETDATE(), N'Ca sáng'),
('TXE10', 'X10', '2025-06-24', NULL, N'Đã lái', GETDATE(), N'Ca sáng'),
('TXE11', 'X11', '2025-06-25', NULL, N'Đã lái', GETDATE(), N'Ca tối'),
('TXE12', 'X12', '2025-06-25', NULL, N'Dự kiến', GETDATE(), N'Ca chiều'),
('TXE13', 'X13', '2025-06-26', NULL, N'Đã lái', GETDATE(), N'Ca sáng'),
('TXE14', 'X01', '2025-06-26', NULL, N'Đã lái', GETDATE(), N'Ca chiều'),
('TXE15', 'X02', '2025-06-27', NULL, N'Dự kiến', GETDATE(), N'Ca tối');
