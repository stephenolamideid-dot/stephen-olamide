#!/bin/sh
# Run once from this folder: downloads your Base44-hosted images into /assets
# and points content/site.json at the local copies, so the site no longer depends on Base44.
set -e
B=https://media.base44.com/images/public/6aaa75d04f54c5cf115da112
mkdir -p assets
curl -fL "$B/90bb96d89_1e8b64f0-f09e-4ab4-b264-56fc75fca842_removalai_preview.png" -o assets/portrait.png
curl -fL "$B/c0a948c6f_THEDEVILKNOWSYOURNAME_pages-to-jpg-0001.jpg" -o assets/devil-cover.jpg
sed -i.bak "s#$B/[^\"]*removalai_preview.png#/assets/portrait.png#g; s#$B/[^\"]*THEDEVILKNOWSYOURNAME[^\"]*\.jpg#/assets/devil-cover.jpg#g" content/site.json
rm -f content/site.json.bak
echo "Done. Commit the assets folder and content/site.json."
