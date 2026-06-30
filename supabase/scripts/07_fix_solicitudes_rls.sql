-- Asegura que app móvil (anon) y web supervisor (authenticated) lean/escriban
-- fv_credit_applications. Ejecutar si la web no muestra solicitudes en comité.

do $$
begin
  drop policy if exists "fv_apps_rw_anon" on public.fv_credit_applications;
  create policy "fv_apps_rw_anon" on public.fv_credit_applications
    for all to anon using (true) with check (true);

  drop policy if exists "fv_apps_rw_auth" on public.fv_credit_applications;
  create policy "fv_apps_rw_auth" on public.fv_credit_applications
    for all to authenticated using (true) with check (true);
end $$;
