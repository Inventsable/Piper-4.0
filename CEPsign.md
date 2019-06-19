# CEP sign/certify via AHK

* Input box for full path to extension (assumed to be in `CEP/extensions/`)
* Search for number of pre-existing .zxp's in `/_builds/`, create current version number accordingly, update in `manifest.xml`
* Copy the directory to a temporary staging folder inside `CEP/extensions/`
* Delete `.git`, `./builds/` and optimize for lowest size
* Automate sign/certify with version number appended to repo name
* Place resulting build inside global `extensions/_builds/`
* Prompt to copy into local `./_builds/` as permanent version
* Delete temporary staging folder


## ~~todo~~
* ~~`./host/appName/host.ts`~~
* ~~`./host/appName/tsconfig.json`~~
* ~~`./tsconfig.json`~~
* ~~`./package.json`~~
* ~~`./package-lock.json`~~
* ~~`./.gitignore`~~
