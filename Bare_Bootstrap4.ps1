#Copy Invoke into Powershell
#Invoke-Expression $(Invoke-WebRequest https://raw.githubusercontent.com/YangG-Morph/Bare_Bootstrap4/master/Bare_Bootstrap4.ps1)
#TODO: Add variable for bootstrap_bare

param(
	[string]$bootstrap
)

npm install $bootstrap jquery browser-sync gulp gulp-sass merge-stream del popper.js del
Get-ChildItem node_modules\$bootstrap | Move-Item -Destination .\ -ErrorAction SilentlyContinue
npm install
npm audit fix

Start-BitsTransfer -Source "https://raw.githubusercontent.com/YangG-Morph/Bare_Bootstrap4/master/gulpfile.js" -Destination ".\"
