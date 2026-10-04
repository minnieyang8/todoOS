# Todo OS

A calm personal planner. Plain HTML/JS: no build step, no install. Data is saved in the browser; optional Supabase sync and optional photo reading.

## Deploy (GitHub + Vercel)
1. **Unzip** this file. You should see `index.html`, `api/`, `README.md` and others.
2. **GitHub:** sign in at github.com > **New repository** > name it `todo-os` > Private > **Create repository**.
3. On the new repo page click **uploading an existing file**, drag in ALL the unzipped files and the `api` folder (not the zip itself), then **Commit changes**.
4. **Vercel:** sign in at vercel.com with GitHub > **Add New > Project** > pick `todo-os` > **Import**.
5. Leave Framework Preset as **Other**, leave Build Command and Output Directory empty > **Deploy**. In about a minute you get a link like `todo-os.vercel.app`.
6. **Install on a phone:** open the link in Chrome > menu > **Add to Home screen** (iPhone: Safari > Share > Add to Home Screen).

## Step 7: Sync between phone and laptop (optional, free)
1. supabase.com > New project (any name, save the password).
2. **SQL Editor > New query**, paste everything from `supabase.sql`, **Run**.
3. **Project Settings > API**: copy the **Project URL** and the **anon public** key.
4. Open `config.js` on GitHub, click the pencil icon, paste both between the quotes, **Commit**. Vercel redeploys by itself.
5. In the app: **More > Settings & backup > Sync across devices > Start sync**. Copy the code to your other device and use **Connect and download**.
Notes: the last device to save wins, so avoid editing the same thing on two devices at once. Anyone with the code can read and change the data, so treat it like a password.

## Step 8: Read timetable photos (optional, costs money)
Needs an Anthropic API key. In Vercel: project > Settings > Environment Variables > add `ANTHROPIC_API_KEY` > redeploy. The `/api/read` address is public, so only do this if you accept that risk (or use Vercel's password protection). Without the key the photo button simply does not appear; typing or pasting still works.

## Good to know
- Reminders and the chime only work while the app is open. For critical deadlines also set a phone alarm.
- Back up regularly: More > Import / Export > Export data.
- Clearing browser data erases local data unless sync is on.
