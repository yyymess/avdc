# If you can't run this script, please execute the following command in PowerShell.
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

$CLOUDSCRAPER_PATH=$(python -c 'import cloudscraper as _; print(_.__path__[0])' | select -Last 1)

mkdir build 
mkdir __pycache__

pyinstaller --onefile AV_Data_Capture.py `
    --add-data "$CLOUDSCRAPER_PATH;cloudscraper" `
    --add-data "data/tag_sc_map.csv;data" `
    --add-data "data/actor_dupe_map.csv;data" `
    --add-data "data/config.ini;data"

rmdir -Recurse -Force build
rmdir -Recurse -Force __pycache__
rmdir -Recurse -Force AV_Data_Capture.spec

echo "[Make]Finish"
pause