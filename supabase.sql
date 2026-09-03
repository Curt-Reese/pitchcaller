create table if not exists public.pitchcaller_games (
  game_id text primary key,
  rows jsonb not null default '[]'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.pitchcaller_games enable row level security;

create policy if not exists "Allow anon access to all pitchcaller games"
  on public.pitchcaller_games
  for all
  using (true)
  with check (true);

-- Optional: quick check query
-- select game_id, updated_at, jsonb_array_length(rows) as row_count from public.pitchcaller_games order by updated_at desc;
