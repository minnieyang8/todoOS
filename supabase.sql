-- Run this once in Supabase: SQL Editor > New query > paste > Run
create table if not exists snapshots (code text primary key, data jsonb not null, updated_at timestamptz default now());
alter table snapshots enable row level security;   -- no policies: nobody can read the table directly
create or replace function get_snapshot(p_code text) returns jsonb language sql security definer set search_path = public as $$ select data from snapshots where code = p_code $$;
create or replace function put_snapshot(p_code text, p_data jsonb) returns void language plpgsql security definer set search_path = public as $$
begin insert into snapshots(code, data) values (p_code, p_data) on conflict (code) do update set data = excluded.data, updated_at = now(); end $$;
grant execute on function get_snapshot(text), put_snapshot(text, jsonb) to anon;
