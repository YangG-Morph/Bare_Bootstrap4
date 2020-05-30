#Copy Invoke into Powershell
#Invoke-Expression $(Invoke-WebRequest https://raw.githubusercontent.com/YangG-Morph/Bare_Bootstrap4/master/Bare_Bootstrap4.ps1)
#TODO: Add variable for bootstrap_bare

npm install jquery startbootstrap-resume browser-sync gulp gulp-sass merge-stream del popper.js del
Get-ChildItem node_modules\startbootstrap | Move-Item -Destination .\ -ErrorAction SilentlyContinue
npm install
npm audit fix

(New-Object System.Net.WebClient).DownloadFile(https://raw.githubusercontent.com/YangG-Morph/Bare_Bootstrap4/master/gulpfile.js, gulpfile.js)
