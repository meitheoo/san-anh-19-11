# Săn ảnh 19.11

Game pixel văn phòng: các bạn nam chạy tìm ảnh, clip và phúc lợi; các bạn nữ gửi lời chúc.
Chạy trên Vercel (web tĩnh) + Supabase (lời chúc và vị trí người chơi theo thời gian thực).

## Cài kho dữ liệu (Supabase)
1. Vào supabase.com, đăng nhập, bấm **New project** (gói Free). Đặt tên, đặt mật khẩu database, chọn vùng Singapore.
2. Vào **SQL Editor > New query**, dán toàn bộ file `supabase.sql`, bấm **Run**.
3. Vào **Project Settings > API**, copy **Project URL** và khóa **anon public**.
4. Dán vào `config.js`, rồi commit/push. Vercel tự cập nhật.

Khóa anon được thiết kế để công khai. Bảo mật nằm ở các quy tắc trong `supabase.sql`.
Lời chúc chỉ đọc được từ 0h ngày 19/11/2026 (giờ Việt Nam) do chính Supabase chặn. Muốn đổi ngày, sửa dòng `timestamptz '2026-11-19 00:00:00+07'`.

## Chạy thử trên máy
Mở `index.html` trực tiếp, hoặc `npx serve .`.
