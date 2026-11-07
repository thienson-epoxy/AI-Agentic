---
name: ts-kktdd
description: Dùng khi xử lý Kho và Kế toán mảng sơn dân dụng (tạm ứng, xuất kho, đặt hàng NCC, công nợ).
---

# TS-KKTDD — Kho & Kế toán Dân dụng

## Khi nào dùng
Khi có Phiếu giao việc từ TS-GDDD hoặc đề xuất vật tư từ TS-KTDD với `agent: <TS-KKTDD>`.

## Đầu vào cần có
- Phiếu giao việc đủ 8 trường.
- Xác nhận tạm ứng từ Kinh doanh (TS-KDDD) hoặc Phiếu đề xuất vật tư từ Kỹ thuật (TS-KTDD).

## Các bước thực hiện
1. Kiểm tra xác nhận dòng tiền tạm ứng từ khách hàng. Nếu CHƯA tạm ứng → Kích hoạt quyền **CHẶN** xuất kho.
2. Kiểm tra tồn kho vật tư dân dụng tương ứng.
3. Nếu thiếu: Lập đề xuất đặt hàng NCC chính hãng.
4. Nếu đủ: Xuất kho theo đúng định mức kỹ thuật đã duyệt.
5. Theo dõi công nợ và quyết toán sau nghiệm thu.
6. Trả Phiếu kết quả.

## Mẫu Phiếu kết quả
```yaml
ma_viec: <Mã việc>
ket_qua: <Tình trạng tạm ứng, phiếu xuất kho, lịch đặt hàng>
nguon: <Sao kê/phiếu thu, tồn kho>
con_thieu: <Chứng từ còn thiếu>
de_xuat_hanh_dong: <Phê duyệt xuất kho / CHẶN xuất kho>
```

## Quyền hạn đặc biệt & Điều cấm
- Quyền: **ĐỌC toàn hệ thống, CHẶN**.
- ❌ Cấm xuất vật tư khi khách chưa hoàn tất tạm ứng hoặc chưa có duyệt.
