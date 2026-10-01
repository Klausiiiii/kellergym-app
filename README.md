# Kellergym Logbuch

Trainings-Tracker fürs Heimgym. Statische Web-App (GitHub Pages) mit Sync über Supabase.
Funktioniert offline, Änderungen werden hochgeladen, sobald wieder Netz da ist.

## Einrichtung

### 1. Supabase
1. Auf https://supabase.com ein kostenloses Projekt anlegen (Region: Frankfurt / eu-central-1).
2. **SQL Editor** → Inhalt von `supabase-setup.sql` einfügen → **Run**.
3. **Project Settings → API**: `Project URL` und den **Publishable key** (bzw. `anon` key) kopieren
   und in `config.js` eintragen.
4. **Authentication → URL Configuration → Site URL** auf die GitHub-Pages-Adresse setzen
   (`https://<user>.github.io/<repo>/`), damit der Bestätigungslink in der Mail dorthin führt.

### 2. Konto anlegen und absichern
1. App öffnen → **Konto erstellen** → Bestätigungs-Mail anklicken → anmelden.
2. Danach in Supabase **Authentication → Sign In / Providers → „Allow new users to sign up“ ausschalten**.
   Sonst kann sich jeder mit der URL ein Konto anlegen (er sieht deine Daten nicht, belegt aber deine Datenbank).

### 3. GitHub Pages
Repo pushen → **Settings → Pages → Deploy from a branch → main / (root)**.

## Hinweise
- Der Key in `config.js` ist öffentlich gedacht. Die Daten schützt Row Level Security: Jeder Nutzer sieht nur seine eigenen Zeilen.
- Gratis-Projekte pausiert Supabase nach 7 Tagen ohne Aktivität. Reaktivieren per Klick im Dashboard, die Daten bleiben erhalten.
- Export/Import als JSON im Reiter **Verlauf**. Bei der ersten Anmeldung werden lokal vorhandene Trainings automatisch hochgeladen.
- **Keine Trainingsdaten committen** (`.gitignore` blockt `*.json`).
