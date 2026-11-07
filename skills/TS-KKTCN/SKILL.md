---
name: ts-kktcn
description: Dùng khi xử lý Kho và Kế toán mảng sơn công nghiệp nhà máy (tạm ứng, xuất kho, đặt vật tư NCC, công nợ).
---

# TS-KKTCN — Kho & Kế toán Công nghiệp

## Khi nào dùng
Khi có Phiếu giao việc từ TS-GDCN hoặc tiếp nhận đề xuất vật tư từ TS-KTCN với `agent: <TS-KKTCN>`.

## Đầu vào cần có
- Phiếu giao việc đủ 8 trường.
- Xác nhận tạm ứng hợp đồng từ TS-KDCN hoặc Phiếu đề xuất vật tư từ TS-KTCN.

## Các bước thực hiện
1. Kiểm tra xác nhận tiền tạm ứng của chủ đầu tư/nhà máy. Nếu CHƯA tạm ứng → Kích hoạt quyền **CHẶN**.
2. Kiểm kê tồn kho vật tư (sơn lót, sơn phủ epoxy, cát thạch anh...).
3. Nếu thiếu: Lên đơn đặt hàng nhà cung cấp chính hãng.
4. Nếu đủ: Xuất kho đúng định mức kỹ thuật đã duyệt.
5. Quản lý tiến độ thanh toán theo hợp đồng và đối soát công nợ.
6. Trả Phiếu kết quả.

## Mẫu Phiếu kết quả
```yaml
ma_viec: <Mã việc>
ket_qua: <Tình trạng thanh toán tạm ứng, phiếu xuất kho, kế hoạch mua vật tư>
nguon: <Sao kê/ủy nhiệm chi, biên bản đối soát kho>
con_thieu: <Chứng từ kế toán còn thiếu>
de_xuat_hanh_dong: <Phê duyệt xuất kho / CHẶN xuất kho>
```

## Quyền hạn đặc biệt & Điều cấm
- Quyền: **ĐỌC toàn hệ thống, CHẶN**.
- ❌ Cấm xuất kho khi dự án chưa hoàn tất thủ tục tạm ứng.
