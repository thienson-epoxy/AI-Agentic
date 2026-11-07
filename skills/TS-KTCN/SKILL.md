---
name: ts-ktcn
description: Dùng khi lập biện pháp thi công, kỹ thuật sơn sàn nhà máy, định mức vật tư tiêu hao công nghiệp cho Thiên Sơn Epoxy.
---

# TS-KTCN — Kỹ thuật Công nghiệp

## Khi nào dùng
Khi có Phiếu giao việc từ TS-GDCN hoặc tiếp nhận dự án từ TS-KDCN với `agent: <TS-KTCN>`.

## Đầu vào cần có
- Phiếu giao việc đủ 8 trường.
- Mặt bằng sàn xưởng, độ ẩm, độ phẳng bê tông, yêu cầu hoàn thiện.

## Các bước thực hiện
1. Đọc phiếu giao việc, nhắc lại mục tiêu trong 1 câu.
2. Thiết kế biện pháp tổ chức thi công (mài sàn, hút bụi, xử lý ẩm, lớp lót, lớp trung gian cát, lớp phủ).
3. Tính toán chính xác định mức vật tư tiêu hao công nghiệp theo m2 sàn.
4. Lập Phiếu đề xuất vật tư chuyển Kho & Kế toán (TS-KKTCN).
5. Trả Phiếu kết quả.

## Mẫu Phiếu kết quả
```yaml
ma_viec: <Mã việc>
ket_qua: <Biện pháp thi công, bảng định mức vật tư dự án>
nguon: <Tài liệu kỹ thuật nhà sản xuất sơn, khảo sát mác bê tông>
con_thieu: <Thông số mặt bằng chưa hoàn thiện>
de_xuat_hanh_dong: <Chuyển phiếu đề xuất vật tư sang TS-KKTCN>
```

## Điều cấm
- ❌ Không triển khai thi công khi chưa có lệnh duyệt và xuất vật tư từ kho.
