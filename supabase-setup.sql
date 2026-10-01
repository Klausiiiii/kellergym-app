-- Kellergym Logbuch: einmal im Supabase SQL Editor ausführen.
create table if not exists public.sessions (
  user_id    uuid        not null default auth.uid() references auth.users(id) on delete cascade,
  id         text        not null,
  date       date        not null,
  data       jsonb       not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, id)
);

alter table public.sessions enable row level security;

-- Jeder sieht und ändert nur seine eigenen Trainings
create policy "eigene lesen"   on public.sessions for select to authenticated using ((select auth.uid()) = user_id);
create policy "eigene anlegen" on public.sessions for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "eigene ändern"  on public.sessions for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "eigene löschen" on public.sessions for delete to authenticated using ((select auth.uid()) = user_id);

grant select, insert, update, delete on public.sessions to authenticated;
