-- Chạy toàn bộ file này một lần trong Supabase: SQL Editor > New query > Run

create table if not exists public.wishes (
  id uuid primary key default gen_random_uuid(),
  to_id text not null check (to_id in ('khoi','cong','tuananh','nam','tin')),
  from_name text not null check (char_length(from_name) between 1 and 40),
  text text not null check (char_length(text) between 1 and 600),
  created_at timestamptz not null default now()
);

alter table public.wishes enable row level security;

-- Ai cũng gửi được lời chúc
drop policy if exists "anyone can send" on public.wishes;
create policy "anyone can send" on public.wishes
  for insert to anon, authenticated with check (true);

-- Đọc được lời chúc bất cứ lúc nào (game chỉ hiện đúng lời của nhân vật đang chơi)
drop policy if exists "read after 19.11" on public.wishes;
drop policy if exists "read anytime" on public.wishes;
create policy "read anytime" on public.wishes
  for select to anon, authenticated
  using (true);

-- Đếm số lời chúc (không lộ nội dung) để hiện "Đã có N lời chúc"
create or replace function public.wish_count()
returns table(to_id text, n bigint)
language sql security definer set search_path = public as $$
  select to_id, count(*) from public.wishes group by to_id
$$;
grant execute on function public.wish_count() to anon, authenticated;
