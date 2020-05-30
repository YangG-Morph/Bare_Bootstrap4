#Invoke-Expression $(Invoke-WebRequest https://raw.githubusercontent.com/YangG-Morph/Bare_Bootstrap4/master/Bare_Bootstrap4.ps1)

npm install startbootstrap-bare jquery browser-sync gulp sass merge-stream del popper.js
Get-ChildItem node_modules\startbootstrap-bare | Move-Item -Destination .\ -ErrorAction SilentlyContinue
