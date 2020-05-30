#Copy Invoke into Powershell
#Invoke-Expression $(Invoke-WebRequest https://raw.githubusercontent.com/YangG-Morph/Bare_Bootstrap4/master/Bare_Bootstrap4.ps1)

npm install startbootstrap-bare jquery browser-sync gulp sass merge-stream del popper.js
Get-ChildItem node_modules\startbootstrap-bare | Move-Item -Destination .\ -ErrorAction SilentlyContinue
npm install
npm audit fix

#Set project to open up with Chrome
((Get-Content -path gulpfile.js) -replace 'port: 3000','port: 3000,browser: ["Chrome"]') | Set-Content -Path gulpfile.js
