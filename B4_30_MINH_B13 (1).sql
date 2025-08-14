--câu 1 SỬA TENKHOA Tin Học thành Công nghệ thông tin
UPDATE KHOA_30_MINH
SET TENKHOA_30_MINH = N'Công nghệ thông tin'
WHERE MAKHOA_30_MINH = 'TH'
--câu 2 TÌM MASV,TÊN SV CÓ 150000>HB >100000
select MASV_30_MINH, TENSV_30_MINH
FROM SINHVIEN_30_MINH
WHERE HB_30_MINH > 100000 AND HB_30_MINH < 150000
--câu 3 :TÌM MASV,TÊN SV CÓ 150000>HB >100000 dùng between .. and
select MASV_30_MINH, TENSV_30_MINH
FROM SINHVIEN_30_MINH
WHERE HB_30_MINH between 100000 and 150000
--câu 4 LIỆT KÊ SV CÓ NƠI SINH Ở HÀ NỘI
select *
FROM SINHVIEN_30_MINH
WHERE NOISINH_30_MINH = N'Hà Nội'
--câu 5 LIỆT KÊ SV là nữ có hb = 170000
select *
FROM SINHVIEN_30_MINH
WHERE PHAI_30_MINH=N'Nữ' AND HB_30_MINH = 170000
--câu 6 LIỆT KÊ ho, ten SV là nữ , tăng dần theo tên
select HOSV_30_MINH,TENSV_30_MINH
from SINHVIEN_30_MINH
where PHAI_30_MINH=N'Nữ'
order by TENSV_30_MINH ASC
--Câu 7: liệt kê tên sv bắt đầu bằng chữ t
select TENSV_30_MINH
from SINHVIEN_30_MINH
where TENSV_30_MINH LIKE't%'
--Câu 8: liệt kê tên sv có chữ n cuối
select TENSV_30_MINH
from SINHVIEN_30_MINH
where TENSV_30_MINH LIKE'%n'
--Câu 9: Liệt kê hosv, tensv, phai ko có mã A02,B01,A04
select HOSV_30_MINH,TENSV_30_MINH
from SINHVIEN_30_MINH
where PHAI_30_MINH NOT IN ('A02','B01','A04')
--Câu 10: Liệt kê MAHV, DIEMTB=AVG(DIEM) của các sinh viên thi lần 1
select AVG(DIEM) AS DTB_30_MINH
from KQ_30_MINH
where LANTHI=1
group by MASV
--Câu 11: đếm số sv có phái là nữ
select count(MASV_30_MINH) as tongsv_30_Minh
from SINHVIEN_30_MINH
where PHAI_30_MINH =N'Nữ'
--Câu 12: đếm số sv có nơi sinh ở hà nội
select count(MASV_30_MINH) as tongsv_30_Minh
from SINHVIEN_30_MINH
where NOISINH_30_MINH=N'Hà Nội'
--Câu 13: tính tổng điểm của lần thi 1	
select sum(DIEM) as tongdiem_30_minh
from KQ_30_MINH
where LANTHI=1
--Câu 14: tìm điểm lớn nhất, điểm nhỏ nhất, , điểm trung bình của bảng kq
select MAX(DIEM) AS MAXDIEM_30_MINH, MIN(DIEM) AS MINDIEM_30_MINH, AVG(DIEM) AS AVGDIEM_30_MINH
from KQ_30_MINH
--Câu 15: liệt kê những sv nữ, tên có chứa chữ N
select *
from SINHVIEN_30_MINH
where PHAI_30_MINH=N'Nữ' AND TENSV_30_MINH like '%N%'
--Câu 16: liệt kê những sv nam, có họ là trần
select *
from SINHVIEN_30_MINH
where PHAI_30_MINH='Nam' AND HOSV_30_MINH like N'Trần%'
--Câu 17: cho biết tổng số sv trong toàn khoa
--tong sinh vien la bao nhieu trong khoa ( công nghệ thông tin, anh van)
select MAKH_30_MINH,COUNT(MAKH_30_MINH) AS SOLUONGSV_30_MINH
from SINHVIEN_30_MINH
GROUP BY MAKH_30_MINH
--Câu 18: cho biết số lượng môn học mà sv đã học ( tức là tổng số mh có trong bảng kết quả)
select  MASV,COUNT(DISTINCT MAMH) AS TONGSOMH_30_MINH
from KQ_30_MINH
group by MASV
--Câu 19: cho biết tổng số học bổng của mỗi khoa
select MAKH_30_MINH,sum(HB_30_MINH) AS SOLUONGHB_30_MINH
from SINHVIEN_30_MINH
GROUP BY MAKH_30_MINH
--Câu 20: cho biết học bổng cao nhất của mỗi khoa
select MAKH_30_MINH,MAX(HB_30_MINH) AS MAXHB
from SINHVIEN_30_MINH
GROUP BY MAKH_30_MINH
--Câu 21: cho biết nơi nào có hơn 2 sv theo học tại trường ??? 
select NOISINH_30_MINH,count(NOISINH_30_MINH) AS SOSV_30_MINH
from SINHVIEN_30_MINH
GROUP BY NOISINH_30_MINH
HAVING COUNT(NOISINH_30_MINH)>=2
--Câu 22: cho biết những môn nào có trên 3 sv dự thi
select MAMH,count( MASV)AS SOLUONG
FROM KQ_30_MINH
GROUP BY MAMH
HAVING COUNT( MASV) > 3
--Câu 23: cho biết những sv thi lại trên 2 lần
select MASV, COUNT(LANTHI) AS LANTHILAN2CUASV_30_MINH
from KQ_30_MINH
WHERE LANTHI=2
GROUP BY MASV
HAVING COUNT(LANTHI)>1



--Câu 24: cho biết những sv nam có điểm tb lần 1 trên 7.0

SELECT SV.MASV_30_MINH, AVG(KQ.Diem) as DTB_30_MINH
FROM SINHVIEN_30_MINH SV, KQ_30_MINH KQ
WHERE sv.MASV_30_MINH = kq.MASV and SV.PHAI_30_MINH='Nam' AND KQ.LANTHI='1'
group by SV.MASV_30_MINH
HAVING AVG(KQ.DIEM) > 7

--Câu 25: cho biết khoa nào có đông sv nhất ( all)--B1: Liệt kê số sinh viên từng khoaselect count(MASV_30_MINH) as SOSV_30_MINHfrom SINHVIEN_30_MINHgroup by MAKH_30_MINH--B2: TRẢ VỀ KHOA CÓ SỐ SINH VIÊN ĐÔNG NHẤTSELECT MAKH_30_MINHFROM SINHVIEN_30_MINHGROUP BY MAKH_30_MINHHAVING COUNT(MASV_30_MINH)>=ALL(select count(MASV_30_MINH) as SOSV_30_MINHfrom SINHVIEN_30_MINHgroup by MAKH_30_MINH)--Câu 26: cho biết khoa nào có đông nữ nhất--B1: LIỆT KÊ SỐ SINH VIÊN NỮ TỪNG KHOASELECT COUNT(MASV_30_MINH) as SOSVNU_30_MINHFROM SINHVIEN_30_MINHWHERE PHAI_30_MINH =N'Nữ'GROUP BY MAKH_30_MINH--B2: TRẢ VỀ KHOA CÓ ĐÔNG SINH VIÊN NỮ NHẤTSELECT MAKH_30_MINHFROM SINHVIEN_30_MINHWHERE PHAI_30_MINH=N'NỮ'GROUP BY MAKH_30_MINHHAVING COUNT(MASV_30_MINH) >= ALL(SELECT COUNT(MASV_30_MINH) as SOSVNU_30_MINHFROM SINHVIEN_30_MINHWHERE PHAI_30_MINH =N'Nữ'GROUP BY MAKH_30_MINH)--Câu 27: cho biết môn nào có nhiều sv rớt lần 1 nhất (all)--B1: LIỆT KÊ SINH VIÊN RỚT LẦN 1SELECT COUNT(MASV) AS SOSVROTLAN1_30_MINHFROM KQ_30_MINHWHERE DIEM<5 AND LANTHI = 1GROUP BY MAMH--B2: TRẢ VỀ MÔN CÓ NHIỀU SV RỚT LẦN THI 1 NHẤTSELECT MAMH,COUNT( MASV) AS SOLUONGSV_30_MINHFROM KQ_30_MINHWHERE LANTHI = 1 AND DIEM<5GROUP BY MAMHHAVING COUNT( MASV) >= ALL(SELECT COUNT(MASV) AS SOSVROTLAN1_30_MINHFROM KQ_30_MINHWHERE DIEM<5 AND LANTHI = 1GROUP BY MAMH)--Câu 28: cho biết những sv có học bổng lớn hơn bất kỳ học bổng của sv học khoa TH(any)--B1: LIỆT KÊ HỌC BỔNG CỦA SINH VIÊN KHOA THSELECT HB_30_MINHFROM SINHVIEN_30_MINHWHERE MAKH_30_MINH='TH'--B2: TRẢ VỀ NHỮNG SINH VIÊN CÓ HỌC BỔNG LỚN HƠN BẤT KỲ HỌC BỔNG CỦA KHOA THSELECT MASV_30_MINH,HB_30_MINHFROM SINHVIEN_30_MINHWHERE HB_30_MINH > ANY(SELECT HB_30_MINHFROM SINHVIEN_30_MINHWHERE MAKH_30_MINH='TH')--Câu 29: Cho biết những sinh viên có học bổng lớn hơn tất cả học bổng của sv học khoa AV--B1: LIỆT KÊ HỌC BỔNG CỦA SINH VIÊN KHOA AVselect HB_30_MINHfrom SINHVIEN_30_MINHwhere MAKH_30_MINH='AV'--B2: TRẢ VỀ NHỮNG SINH VIÊN CÓ HỌC BỔNG LỚN HƠN TẤT CẢ HỌC BỔNG CỦA SV HỌC KHOA AVselect MASV_30_MINH,HB_30_MINHfrom SINHVIEN_30_MINHwhere HB_30_MINH > all(select HB_30_MINHfrom SINHVIEN_30_MINHwhere MAKH_30_MINH='AV')--Câu 30: Cho biết những sv nào có điểm thi môn csdl lần 2 lớn hơn tất cả--csdl mamh = 01--B1: LIỆT KÊ ĐIỂM THI NHỮNG SV THI MÔN CSDL LẦN 2SELECT DIEMFROM KQ_30_MINHWHERE MAMH= '01' AND LANTHI=2--B2: TRẢ VỀ NHỮNG SINH VIÊN CÓ ĐIỂM THI MÔN CSDL LẦN 2 LỚN HƠN TẤT CẢSELECT MASV,DIEMFROM KQ_30_MINHWHERE LANTHI=2 AND MAMH = '01' AND DIEM >= ALL(SELECT DIEMFROM KQ_30_MINHWHERE MAMH= '01' AND LANTHI=2)--Câu 31: cho biết sv nào ko thi lần 1 mà có dự thi lần 2 SELECT KQ1.MASVFROM KQ_30_MINH KQ1WHERE NOT EXISTS (SELECT *				FROM KQ_30_MINH KQ2				WHERE KQ1.MASV= KQ2.MASV AND KQ2.LANTHI=1)--Câu 32: Cho biết môn học nào không có sinh viên khoa av học--B1: liệt kê môn có sinh viên khoa av họcselect MAMHfrom KQ_30_MINH KQ, SINHVIEN_30_MINH SVWHERE KQ.MASV = SV.MASV_30_MINH AND SV.MAKH_30_MINH ='AV'--B2: Trả về những môn học không có sinh viên khoa av họcselect MAMH_30_MINH, TENMH_30_MINHfrom MONHOC_30_MINHWHERE MAMH_30_MINH NOT IN (select MAMH							from KQ_30_MINH KQ, SINHVIEN_30_MINH SV							WHERE KQ.MASV = SV.MASV_30_MINH AND SV.MAKH_30_MINH ='AV')--Câu 33: Cho biết những sinh viên không rớt môn nào--B1: Liệt kê những sinh viên bị rớt mônselect MASV	from KQ_30_MINHWHERE DIEM<5--B2: Trả về những sinh viên không rớt môn nàoSELECT MASV_30_MINH,TENSV_30_MINHFROM SINHVIEN_30_MINHWHERE MASV_30_MINH NOT IN (select MASV						from KQ_30_MINH					WHERE DIEM<5)--cau 34: Cho biết những sinh viên học khoa av có học bổng của những sv chưa bao giờ rớt--b1: tìm những sinh viên rớt mônSELECT KQ.MASVFROM KQ_30_MINH KQ, SINHVIEN_30_MINH SVWHERE KQ.MASV = SV.MASV_30_MINH AND KQ.DIEM<5SELECT KQ.MASVFROM KQ_30_MINH KQWHERE  KQ.DIEM<5--B2: TRẢ VỀ NHỮNG SINH VIÊN HỌC KHOA AV CÓ HỌC BỔNG CỦA NHỮNG SV CHƯA BAO GIỜ RỚTSELECT MASV_30_MINH,MAKH_30_MINHFROM SINHVIEN_30_MINHWHERE MAKH_30_MINH='AV'AND HB_30_MINH<>0 AND MASV_30_MINH NOT IN(SELECT KQ.MASVFROM KQ_30_MINH KQWHERE  KQ.DIEM<5)--ROT : A01 A02 A03 B01--not existsselect MASV_30_MINH,MAKH_30_MINHfrom SINHVIEN_30_MINH svwhere MAKH_30_MINH='AV'AND HB_30_MINH<>0 and not exists (select *				from KQ_30_MINH kq				where diem<5 and kq.MASV = sv.MASV_30_MINH)SELECT MASV_30_MINH,MAKH_30_MINHFROM SINHVIEN_30_MINHWHERE MAKH_30_MINH='AV'AND HB_30_MINH<>0 AND NOT exists(SELECT KQ.MASVFROM KQ_30_MINH KQWHERE  KQ.DIEM<5)--Câu 35: cho biết những môn được tất cả các sinh vien theo học--b1: đếm số sinh viên select count(MASV_30_MINH) as SLSINHVIEN_30_MINHfrom SINHVIEN_30_MINH--B2: Trả về môn học được tất cả sinh viên theo họcselect MAMHfrom KQ_30_MINHGROUP BY MAMHHAVING COUNT(DISTINCT MASV) = (select count(MASV_30_MINH) as SLSINHVIEN_30_MINH								from SINHVIEN_30_MINH)--Câu 36: Cho biết những sinh viên học tất cả môn--B1: Đếm số môn họcselect count(MAMH_30_MINH) AS SLMONHOC_30_MINHFROM MONHOC_30_MINH--B2: Trả về sinh viên học tất cả mônselect MASVfrom KQ_30_MINHGROUP BY MASVHAVING COUNT(DISTINCT MAMH) = (select count(MAMH_30_MINH) AS SLMONHOC_30_MINH							FROM MONHOC_30_MINH)