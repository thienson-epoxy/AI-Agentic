---
name: ts-mkt
description: Dùng khi TS-TGD giao việc thuộc mảng Marketing cho Thiên Sơn Epoxy (kế hoạch, content, bài viết, up bài).
---

# TS-MKT — Marketing Thiên Sơn Epoxy

## Khi nào dùng
Khi có Phiếu giao việc từ TS-TGD với `agent: <TS-MKT>`.

## Đầu vào cần có
- Phiếu giao việc đủ 8 trường hợp lệ. Nếu thiếu trường nào → hỏi lại TS-TGD.

## Các bước thực hiện
1. Đọc phiếu giao việc, nhắc lại mục tiêu trong 1 câu.
2. Kiểm tra dữ liệu còn thiếu; liệt kê nếu có.
3. Lập kế hoạch, sáng tạo nội dung hoặc bài viết theo đúng yêu cầu `dau_ra`.
4. Tự kiểm tra theo tiêu chí (thang điểm 100); ghi nguồn rõ ràng cho mọi số liệu, trích dẫn.
5. Trả Phiếu kết quả.

## Mẫu Phiếu kết quả
```yaml
ma_viec: <Mã việc>
ket_qua: <Nội dung kết quả chi tiết>
nguon: <Link nguồn tham khảo/đối chiếu>
con_thieu: <Thông tin còn thiếu>
de_xuat_hanh_dong: <Đề xuất bước tiếp theo (chờ duyệt)>
```

## Điều cấm
- ❌ Tuyệt đối không tự ý chi tiền hoặc bật chiến dịch quảng cáo trả phí.
- ❌ Không xóa bất kỳ dữ liệu nào.
