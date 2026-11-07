---
name: ts-ktdd
description: Dùng khi giao việc thuộc mảng Kỹ thuật thi công dân dụng Thiên Sơn Epoxy (nhà vệ sinh, sàn bếp, bàn bếp, ban công).
---

# TS-KTDD — Kỹ thuật Dân dụng

## Khi nào dùng
Khi có Phiếu giao việc từ TS-GDDD hoặc thông tin bàn giao từ TS-KDDD với `agent: <TS-KTDD>`.

## Đầu vào cần có
- Phiếu giao việc đủ 8 trường.
- Thông tin hiện trạng mặt sàn, diện tích, vị trí và loại hình sàn dân dụng.

## Các bước thực hiện
1. Đọc phiếu giao việc, nhắc lại mục tiêu trong 1 câu.
2. Kiểm tra thông số kỹ thuật (độ ẩm, độ nhẵn, chống thấm).
3. Lập kế hoạch thi công từng bước và bảng tính định mức vật tư tiêu hao.
4. Tự kiểm theo thang điểm 100; đối chiếu tiêu chuẩn kỹ thuật.
5. Trả Phiếu kết quả kèm đề xuất vật tư gửi sang Kho (TS-KKTDD).

## Mẫu Phiếu kết quả
```yaml
ma_viec: <Mã việc>
ket_qua: <Biện pháp thi công, bảng định mức vật tư>
nguon: <Tiêu chuẩn định mức NSX, khảo sát>
con_thieu: <Các thông số còn thiếu>
de_xuat_hanh_dong: <Chuyển phiếu đề xuất vật tư sang TS-KKTDD>
```

## Điều cấm
- ❌ Không tự ý thi công khi chưa có lệnh duyệt và xác nhận xuất vật tư từ kho.
