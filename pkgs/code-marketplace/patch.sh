#!/usr/bin/env sh

product_json_path="/usr/lib/code/product.json"

_patch() {
  # Patch "extensionsGallery"

  # Remove original "extensionsGallery" key.
  sed -i -z -e 's/\t"extensionsGallery.*item"\n\t},\n//' \
    "${1}"

  # Add new "extensionsGallery" key
  # Use vim to open product.json in official release and visual select the lines of "extensionsGallery"
  # Execute :'<,'>join
  # Select joined line and execute :'<,'>s/\//\\\//g
  sed -i -e '/^\t"quality/a\\t"extensionsGallery": { "nlsBaseUrl": "https:\/\/www.vscode-unpkg.net\/_lp\/", "serviceUrl": "https:\/\/marketplace.visualstudio.com\/_apis\/public\/gallery", "cacheUrl": "https:\/\/vscode.blob.core.windows.net\/gallery\/index", "itemUrl": "https:\/\/marketplace.visualstudio.com\/items", "publisherUrl": "https:\/\/marketplace.visualstudio.com\/publishers", "resourceUrlTemplate": "https:\/\/{publisher}.vscode-unpkg.net\/{publisher}\/{name}\/{version}\/{path}", "controlUrl": "https:\/\/az764295.vo.msecnd.net\/extensions\/marketplace.json", "recommendationsUrl": "https:\/\/az764295.vo.msecnd.net\/extensions\/workspaceRecommendations.json.gz" },' \
    "${1}"



  # Patch "linkProtectionTrustedDomains"

  # Use vim to open product.json in official release and visual select the line of "linkProtectionTrustedDomains"
  # Execute :'<,'>s/\//\\\//g
  sed -i -e 's/^\t"linkProtectionTrustedDomains.*/\t"linkProtectionTrustedDomains": ["https:\/\/*.visualstudio.com", "https:\/\/*.microsoft.com", "https:\/\/aka.ms", "https:\/\/*.gallerycdn.vsassets.io", "https:\/\/*.github.com", "https:\/\/login.microsoftonline.com", "https:\/\/*.vscode.dev", "https:\/\/*.github.dev"],/' \
    "${1}"

  # Patch extension tips

  # Use vim to open product.json in official release and visual select the line of
  # "extensionTips" "extensionImportantTips" "keymapExtensionTips" "languageExtensionTips" "configBasedExtensionTips" "exeBasedExtensionTips" "webExtensionTips" "remoteExtensionTips" "extensionKeywords"
  # :'<,'>join
  # :'<,'>s/\\/\\\\/g
  # :'<,'>s/\//\\\//g
  sed -i -e '/^\t"linkProtectionTrustedDomains/a\\t"extensionTips": { "ms-dotnettools.csharp": "{**\/*.cs,**\/project.json,**\/global.json,**\/*.csproj,**\/*.cshtml,**\/*.sln,**\/appsettings.json}", "firefox-devtools.vscode-firefox-debug": "{**\/*.ts,**\/*.tsx,**\/*.js,**\/*.jsx,**\/*.es6,**\/.babelrc}", "ms-edgedevtools.vscode-edge-devtools": "{**\/*.ts,**\/*.tsx,**\/*.js,**\/*.css,**\/*.html}", "golang.Go": "**\/*.go", "ms-vscode.PowerShell": "{**\/*.ps1,**\/*.psd1,**\/*.psm1,**\/*.ps.config,**\/*.ps1.config}", "Ionide.Ionide-fsharp": "{**\/*.fsx,**\/*.fsi,**\/*.fs,**\/*.ml,**\/*.mli}", "dbaeumer.vscode-eslint": "{**\/*.js,**\/*.jsx,**\/*.es6,**\/.eslintrc.*,**\/.eslintrc,**\/.babelrc,**\/jsconfig.json}", "ms-vscode.vscode-typescript-tslint-plugin": "{**\/tslint.json}", "bmewburn.vscode-intelephense-client": "{**\/*.php,**\/php.ini}", "xdebug.php-debug": "{**\/*.php,**\/php.ini}", "rust-lang.rust-analyzer": "{**\/*.rs,**\/*.rslib}", "ms-vscode.cpptools-extension-pack": "{**\/*.c,**\/*.cpp,**\/*.cc,**\/.cxx,**\/*.hh,**\/*.hpp,**\/*.hxx,**\/*.h}", "DavidAnson.vscode-markdownlint": "{**\/*.md}", "ms-azuretools.vscode-docker": "{**\/dockerfile,**\/Dockerfile,**\/docker-compose.yml,**\/docker-compose.*.yml,**\/*.cs,**\/project.json,**\/global.json,**\/*.csproj,**\/*.cshtml,**\/*.sln,**\/appsettings.json,**\/*.py,**\/*.ipynb,**\/*.js,**\/*.ts,**\/package.json}", "EditorConfig.EditorConfig": "{**\/.editorconfig}", "HookyQR.beautify": "{**\/.jsbeautifyrc}", "donjayamanne.githistory": "{**\/.gitignore,**\/.git}", "felipecaputo.git-project-manager": "{**\/.gitignore,**\/.git}", "eamodio.gitlens": "{**\/.gitignore,**\/.git}", "rebornix.Ruby": "{**\/*.rb,**\/*.erb,**\/*.reek,**\/.fasterer.yml,**\/ruby-lint.yml,**\/.rubocop.yml}", "DotJoshJohnson.xml": "{**\/*.xml}", "stylelint.vscode-stylelint": "{**\/.stylelintrc,**\/stylelint.config.js}", "ms-mssql.mssql": "{**\/*.sql}", "mtxr.sqltools": "{**\/*.sql}", "usqlextpublisher.usql-vscode-ext": "{**\/*.usql}", "ms-vscode.sublime-keybindings": "{**\/.sublime-project,**\/.sublime-workspace}", "k--kato.intellij-idea-keybindings": "{**\/.idea}", "christian-kohler.npm-intellisense": "{**\/package.json}", "vue.volar": "{**\/*.vue}", "ms-python.python": "{**\/*.py,**\/*.ipynb}", "ms-toolsai.jupyter": "{**\/*.ipynb}", "cake-build.cake-vscode": "{**\/build.cake}", "Angular.ng-template": "{**\/.angular-cli.json,**\/angular.json,**\/*.ng.html,**\/*.ng,**\/*.ngml}", "vscjava.vscode-maven": "**\/pom.xml", "ms-azuretools.vscode-azureterraform": "**\/*.tf", "HashiCorp.terraform": "**\/*.tf", "vsciot-vscode.vscode-arduino": "**\/*.ino", "ms-kubernetes-tools.vscode-kubernetes-tools": "{**\/Chart.yaml}", "GoogleCloudTools.cloudcode": "{**\/skaffold.yaml}", "Oracle.oracledevtools": "{**\/*.sql}", "ms-vscode.vscode-github-issue-notebooks": "{**\/*.github-issues}", "REditorSupport.r": "**\/*.r" }, "extensionImportantTips": { "ms-dotnettools.csharp": { "name": "C#", "languages": ["csharp"], "pattern": "{**\/*.cs,**\/global.json,**\/*.csproj,**\/*.cshtml,**\/*.sln}" }, "ms-python.python": { "name": "Python", "languages": ["python"], "pattern": "{**\/*.py}" }, "golang.Go": { "name": "Go", "languages": ["go"], "pattern": "**\/*.go" }, "vscjava.vscode-java-pack": { "name": "Java", "languages": ["java"], "pattern": "{**\/*.java}", "isExtensionPack": true, "whenNotInstalled": ["ASF.apache-netbeans-java"] }, "ms-vscode.PowerShell": { "name": "PowerShell", "languages": ["powershell"], "pattern": "{**\/*.ps1,**\/*.psd1,**\/*.psm1}" }, "ms-vscode.cpptools-extension-pack": { "name": "C\/C++", "languages": ["c", "cpp"], "pattern": "{**\/*.c,**\/*.cpp,**\/*.cc,**\/.cxx,**\/*.hh,**\/*.hpp,**\/*.hxx,**\/*.h}" }, "ms-azuretools.vscode-docker": { "name": "Docker", "languages": ["dockerfile"], "pattern": "{**\/dockerfile,**\/Dockerfile,**\/docker-compose.yml,**\/docker-compose.*.yml}" }, "vue.volar": { "name": "Vetur", "languages": ["vue"], "pattern": "{**\/*.vue}" }, "ms-vscode.makefile-tools": { "name": "Makefile Tools", "languages": ["makefile"], "pattern": "{**\/makefile,**\/Makefile}" }, "ms-vscode.cmake-tools": { "name": "CMake Tools", "pattern": "{**\/CMakeLists.txt}" }, "ms-azure-devops.azure-pipelines": { "name": "Azure Pipelines", "pattern": "{**\/azure-pipelines.yaml}" }, "msazurermtools.azurerm-vscode-tools": { "name": "Azure Resource Manager", "pattern": "{**\/azuredeploy.json}" }, "ms-vscode-remote.remote-containers": { "name": "Remote - Containers", "pattern": "{**\/devcontainer.json}" }, "ms-azuretools.vscode-bicep": { "name": "Bicep", "pattern": "{**\/*.bicep}" }, "svelte.svelte-vscode": { "name": "Svelte", "pattern": "{**\/*.svelte}" }, "ms-vscode.vscode-github-issue-notebooks": { "name": "GitHub Issue Notebooks", "pattern": "{**\/*.github-issues}" }, "ms-playwright.playwright": { "name": "Playwright", "pattern": "{**\/*playwright*.config.ts,**\/*playwright*.config.js,**\/*playwright*.config.mjs}" }, "vscjava.vscode-gradle": { "name": "Gradle for Java", "pattern": "{**\/gradlew,**\/gradlew.bat,**\/build.gradle,**\/build.gradle.kts,**\/settings.gradle,**\/settings.gradle.kts}" }, "REditorSupport.r": { "name": "R", "languages": ["r"], "pattern": "{**\/*.r}" } }, "keymapExtensionTips": ["vscodevim.vim", "ms-vscode.sublime-keybindings", "ms-vscode.atom-keybindings", "ms-vscode.brackets-keybindings", "ms-vscode.vs-keybindings", "ms-vscode.notepadplusplus-keybindings", "k--kato.intellij-idea-keybindings", "lfs.vscode-emacs-friendly", "alphabotsec.vscode-eclipse-keybindings", "alefragnani.delphi-keybindings"], "languageExtensionTips": ["ms-python.python", "ms-vscode.cpptools-extension-pack", "ms-dotnettools.csharp", "ms-toolsai.jupyter", "vscjava.vscode-java-pack", "ecmel.vscode-html-css", "vue.volar", "bmewburn.vscode-intelephense-client", "dsznajder.es7-react-js-snippets", "golang.go", "ms-vscode.powershell", "dart-code.dart-code", "rust-lang.rust-analyzer", "rebornix.ruby"], "configBasedExtensionTips": { "git": { "configPath": ".git\/config", "configName": "Git", "recommendations": { "github.vscode-pull-request-github": { "name": "GitHub Pull Request", "remotes": ["github.com"] }, "eamodio.gitlens": { "name": "GitLens" } } }, "devContainer": { "configPath": ".devcontainer\/devcontainer.json", "configName": "Dev Container", "recommendations": { "ms-vscode-remote.remote-containers": { "name": "Remote - Containers", "important": true } } }, "maven": { "configPath": "pom.xml", "configName": "Maven", "recommendations": { "vscjava.vscode-java-pack": { "name": "Java", "important": true, "isExtensionPack": true, "whenNotInstalled": ["ASF.apache-netbeans-java"] }, "Pivotal.vscode-boot-dev-pack": { "name": "Spring Boot Extension Pack", "isExtensionPack": true } } }, "gradle": { "configPath": "build.gradle", "configName": "Gradle", "recommendations": { "vscjava.vscode-java-pack": { "name": "Java", "important": true, "isExtensionPack": true, "whenNotInstalled": ["ASF.apache-netbeans-java"] } } }, "github-pull-request": { "configPath": ".vscode\/.github-pull-request.rec", "configName": "GitHub", "configScheme": "vscode-vfs", "recommendations": { "github.vscode-pull-request-github": { "name": "GitHub Pull Request", "important": true } } } }, "exeBasedExtensionTips": { "az": { "friendlyName": "Azure CLI", "windowsPath": "%ProgramFiles(x86)%\\\\Microsoft SDKs\\\\Azure\\\\CLI2\\\\wbin\\\\az.cmd", "recommendations": { "ms-vscode.azurecli": { "name": "Azure CLI Tools" } } }, "heroku": { "friendlyName": "Heroku CLI", "windowsPath": "%ProgramFiles%\\\\Heroku\\\\bin\\\\heroku.cmd", "recommendations": { "ms-azuretools.vscode-azureappservice": { "name": "Azure App Service" }, "pkosta2005.heroku-command": { "name": "heroku-cli" } } }, "mongo": { "friendlyName": "Mongo", "windowsPath": "%ProgramFiles%\\\\MongoDB\\\\Server\\\\3.6\\\\bin\\\\mongod.exe", "recommendations": { "ms-azuretools.vscode-cosmosdb": { "name": "Azure Databases" } } }, "serverless": { "friendlyName": "Serverless framework", "windowsPath": "%APPDATA%\\\\npm\\\\serverless.cmd", "recommendations": { "ms-azuretools.vscode-azurefunctions": { "name": "Azure Functions" } } }, "func": { "friendlyName": "Azure Function SDK", "windowsPath": "%APPDATA%\\\\npm\\\\func.cmd", "recommendations": { "ms-azuretools.vscode-azurefunctions": { "name": "Azure Functions" } } }, "mysql": { "friendlyName": "MySQL", "windowsPath": "%ProgramFiles%\\\\MySQL\\\\MySQL Server 8.0\\\\bin\\\\mysqld.exe", "recommendations": { "mtxr.sqltools": { "name": "SQLTools" } } }, "postgres": { "friendlyName": "PostgreSQL", "windowsPath": "%ProgramFiles%\\\\PostgreSQL\\\\11\\\\bin\\\\psql.exe", "recommendations": { "ms-ossdata.vscode-postgresql": { "name": "PostgreSQL" }, "mtxr.sqltools": { "name": "SQLTools" } } }, "sqlcmd": { "friendlyName": "SQL CLI", "recommendations": { "ms-mssql.mssql": { "name": "SQL Server (mssql)" } } }, "now": { "friendlyName": "Now CLI", "windowsPath": "%APPDATA%\\\\npm\\\\now.cmd", "recommendations": { "ms-azuretools.vscode-azureappservice": { "name": "Azure App Service" }, "ms-azuretools.vscode-docker": { "name": "Docker" } } }, "docker": { "friendlyName": "Docker", "windowsPath": "%ProgramFiles%\\\\Docker\\\\Docker\\\\Resources\\\\bin\\\\docker.exe", "recommendations": { "ms-azuretools.vscode-docker": { "name": "Docker", "important": true }, "ms-vscode-remote.remote-containers": { "name": "Remote - Containers", "important": true }, "ms-kubernetes-tools.vscode-kubernetes-tools": { "name": "Kubernetes" }, "GoogleCloudTools.cloudcode": { "name": "Cloud Code" } } }, "kubectl": { "friendlyName": "Kubernetes", "windowsPath": "%ProgramFiles%\\\\Docker\\\\Docker\\\\Resources\\\\bin\\\\kubectl.exe", "recommendations": { "ms-azuretools.vscode-docker": { "name": "Docker" }, "ms-kubernetes-tools.vscode-kubernetes-tools": { "name": "Kubernetes" }, "GoogleCloudTools.cloudcode": { "name": "Cloud Code" }, "ms-vscode-remote.remote-containers": { "name": "Remote - Containers" } } }, "ng": { "friendlyName": "Angular CLI", "windowsPath": "%APPDATA%\\\\npmexit\\\\ng.cmd", "recommendations": { "johnpapa.Angular2": { "name": "Angular Snippets" } } }, "create-react-app": { "friendlyName": "Create React App", "windowsPath": "%APPDATA%\\\\npm\\\\create-react-app.cmd", "recommendations": { "msjsdiag.vscode-react-native": { "name": "React Native Tools" } } }, "react-native": { "friendlyName": "React Native", "windowsPath": "%APPDATA%\\\\npm\\\\react-native-cli", "recommendations": { "msjsdiag.vscode-react-native": { "name": "React Native Tools" } } }, "p4": { "friendlyName": "Perforce", "recommendations": { "slevesque.perforce": { "name": "Perforce for VS Code" } } }, "hg": { "friendlyName": "Mercurial", "recommendations": { "mrcrowl.hg": { "name": "Hg" } } }, "git": { "friendlyName": "Git", "windowsPath": "%ProgramFiles%\\\\Git\\\\git-bash.exe", "recommendations": { "eamodio.gitlens": { "name": "GitLens" } } }, "svn": { "friendlyName": "Subversion", "windowsPath": "%ProgramFiles%\\\\TortoiseSVN\\\\bin\\\\TortoiseProc.exe", "recommendations": { "johnstoncode.svn-scm": { "name": "SVN" } } }, "subl": { "friendlyName": "Sublime", "windowsPath": "%ProgramFiles%\\\\Sublime Text3\\\\sublime_text.exe", "recommendations": { "ms-vscode.sublime-keybindings": { "name": "Sublime Text Keymap and Settings Importer" } } }, "atom": { "friendlyName": "Atom", "windowsPath": "%USERPROFILE%\\\\AppData\\\\Local\\\\atom\\\\bin\\\\atom.cmd", "recommendations": { "ms-vscode.atom-keybindings": { "name": "Atom Keymap" } } }, "brackets": { "friendlyName": "Brackets", "windowsPath": "%ProgramFiles(x86)%\\\\Brackets\\\\Brackets.exe", "recommendations": { "ms-vscode.brackets-keybindings": { "name": "Brackets Keymap" } } }, "notepadplusplus": { "friendlyName": "Notepad++", "windowsPath": "%ProgramFiles%\\\\Notepad++\\\\Notepad++.exe", "recommendations": { "ms-vscode.notepadplusplus-keybindings": { "name": "Notepad++ keymap" } } }, "vi": { "friendlyName": "VIM", "windowsPath": "%ProgramFiles(x86)%\\\\Vim\\\\vim80\\\\gvim.exe", "recommendations": { "vscodevim.vim": { "name": "Vim" } } }, "mvn": { "friendlyName": "Maven", "recommendations": { "vscjava.vscode-java-pack": { "name": "Java", "important": true, "isExtensionPack": true, "whenNotInstalled": ["ASF.apache-netbeans-java"] } } }, "gradle": { "friendlyName": "Gradle", "recommendations": { "vscjava.vscode-java-pack": { "name": "Java", "important": true, "isExtensionPack": true, "whenNotInstalled": ["ASF.apache-netbeans-java"] } } }, "Microsoft Edge": { "friendlyName": "Microsoft Edge", "windowsPath": "%USERPROFILE%\\\\AppData\\\\Local\\\\Microsoft\\\\Edge\\\\Application\\\\msedge.exe", "recommendations": { "ms-edgedevtools.vscode-edge-devtools": { "name": "Microsoft Edge Developer Tools" } } }, "Microsoft Edge Dev": { "friendlyName": "Microsoft Edge Dev", "windowsPath": "%USERPROFILE%\\\\AppData\\\\Local\\\\Microsoft\\\\Edge Dev\\\\Application\\\\msedge.exe", "recommendations": { "ms-edgedevtools.vscode-edge-devtools": { "name": "Microsoft Edge Developer Tools" } } }, "Microsoft Edge Beta": { "friendlyName": "Microsoft Edge Beta", "windowsPath": "%USERPROFILE%\\\\AppData\\\\Local\\\\Microsoft\\\\Edge Beta\\\\Application\\\\msedge.exe", "recommendations": { "ms-edgedevtools.vscode-edge-devtools": { "name": "Microsoft Edge Developer Tools" } } }, "Microsoft Edge Canary": { "friendlyName": "Microsoft Edge Canary", "windowsPath": "%USERPROFILE%\\\\AppData\\\\Local\\\\Microsoft\\\\Edge SxS\\\\Application\\\\msedge.exe", "recommendations": { "ms-edgedevtools.vscode-edge-devtools": { "name": "Microsoft Edge Developer Tools" } } }, "Mozilla Firefox (x86)": { "friendlyName": "Mozilla Firefox", "windowsPath": "%ProgramFiles(x86)%\\\\Mozilla Firefox\\\\firefox.exe", "recommendations": { "firefox-devtools.vscode-firefox-debug": { "name": "Debugger for Firefox" } } }, "Mozilla Firefox Developer Edition (x86)": { "friendlyName": "Mozilla Firefox Developer Edition", "windowsPath": "%ProgramFiles(x86)%\\\\Firefox Developer Edition\\\\firefox.exe", "recommendations": { "firefox-devtools.vscode-firefox-debug": { "name": "Debugger for Firefox" } } }, "Mozilla Firefox": { "friendlyName": "Mozilla Firefox", "windowsPath": "%ProgramFiles%\\\\Mozilla Firefox\\\\firefox.exe", "recommendations": { "firefox-devtools.vscode-firefox-debug": { "name": "Debugger for Firefox" } } }, "Mozilla Firefox Developer Edition": { "friendlyName": "Mozilla Firefox Developer Edition", "windowsPath": "%ProgramFiles%\\\\Firefox Developer Edition\\\\firefox.exe", "recommendations": { "firefox-devtools.vscode-firefox-debug": { "name": "Debugger for Firefox" } } }, "cordova": { "friendlyName": "Cordova", "windowsPath": "%APPDATA%\\\\npm\\\\cordova", "recommendations": { "msjsdiag.cordova-tools": { "name": "Cordova Tools" } } }, "gcloud": { "friendlyName": "Google GCloud CLI", "windowsPath": "%ProgramFiles(x86)%\\\\Google\\\\Cloud SDK\\\\google-cloud-sdk\\\\bin\\\\gcloud.cmd", "recommendations": { "GoogleCloudTools.cloudcode": { "name": "Cloud Code" } } }, "skaffold": { "friendlyName": "Skaffold Code to Cluster", "recommendations": { "ms-azuretools.vscode-docker": { "name": "Docker" }, "ms-kubernetes-tools.vscode-kubernetes-tools": { "name": "Kubernetes" }, "GoogleCloudTools.cloudcode": { "name": "Cloud Code" } } }, "minikube": { "friendlyName": "MiniKube Local Kubernetes Cluster", "recommendations": { "ms-azuretools.vscode-docker": { "name": "Docker" }, "ms-kubernetes-tools.vscode-kubernetes-tools": { "name": "Kubernetes" }, "GoogleCloudTools.cloudcode": { "name": "Cloud Code" }, "ms-vscode-remote.remote-containers": { "name": "Remote - Containers" } } }, "podman": { "friendlyName": "Podman", "recommendations": { "ms-vscode-remote.remote-containers": { "name": "Remote - Containers" } } }, "wsl": { "friendlyName": "Windows Subsystem for Linux (WSL)", "windowsPath": "%WINDIR%\\\\system32\\\\lxss\\\\LxssManager.dll", "important": true, "recommendations": { "ms-vscode-remote.remote-wsl": { "name": "Remote - WSL", "important": true } } } }, "webExtensionTips": ["tyriar.luna-paint", "codespaces-contrib.codeswing", "ms-vscode.vscode-github-issue-notebooks", "esbenp.prettier-vscode", "hediet.vscode-drawio"], "remoteExtensionTips": { "wsl": { "friendlyName": "Remote - WSL", "extensionId": "ms-vscode-remote.remote-wsl" }, "ssh-remote": { "friendlyName": "Remote - SSH", "extensionId": "ms-vscode-remote.remote-ssh" }, "dev-container": { "friendlyName": "Remote - Containers", "extensionId": "ms-vscode-remote.remote-containers" }, "attached-container": { "friendlyName": "Remote - Containers", "extensionId": "ms-vscode-remote.remote-containers" }, "vsonline": { "friendlyName": "Visual Studio Online", "extensionId": "ms-vsonline.vsonline" } }, "extensionKeywords": { "md": ["Markdown"], "js": ["JavaScript"], "jsx": ["JavaScript"], "es6": ["JavaScript"], "html": ["Html"], "ts": ["TypeScript"], "tsx": ["TypeScript"], "css": ["CSS"], "scss": ["SASS"], "txt": ["Text"], "php": ["PHP"], "php3": ["PHP"], "php4": ["PHP"], "ph3": ["PHP"], "ph4": ["PHP"], "xml": ["XML"], "py": ["Python"], "pyc": ["Python"], "pyd": ["Python"], "pyo": ["Python"], "pyw": ["Python"], "pyz": ["Python"], "java": ["Java"], "class": ["Java"], "jar": ["Java"], "c": ["c", "objective c", "objective-c"], "m": ["objective c", "objective-c"], "mm": ["objective c", "objective-c"], "cpp": ["cpp", "c plus plus", "c", "c++"], "cc": ["cpp", "c plus plus", "c", "c++"], "cxx": ["cpp", "c plus plus", "c++"], "hh": ["cpp", "c plus plus", "c++"], "hpp": ["cpp", "c++"], "h": ["cpp", "c plus plus", "c++", "c", "objective c", "objective-c"], "sql": ["sql"], "sh": ["bash"], "bash": ["bash"], "zsh": ["bash", "zshell"], "cs": ["c#", "csharp"], "csproj": ["c#", "csharp"], "sln": ["c#", "csharp"], "go": ["go"], "sty": ["latex"], "tex": ["latex"], "ps": ["powershell"], "ps1": ["powershell"], "rs": ["rust"], "rslib": ["rust"], "hs": ["haskell"], "lhs": ["haskell"], "scm": ["scheme"], "ss": ["scheme"], "clj": ["clojure"], "cljs": ["clojure"], "cljc": ["clojure"], "edn": ["clojure"], "erl": ["erlang"], "hrl": ["erlang"], "scala": ["scala"], "sc": ["scala"], "pl": ["perl"], "pm": ["perl"], "t": ["perl"], "pod": ["perl"], "groovy": ["groovy"], "swift": ["swift"], "rb": ["ruby"], "rbw": ["ruby"], "jl": ["julia"], "f": ["fortran"], "for": ["fortran"], "f90": ["fortran"], "f95": ["fortran"], "coffee": ["CoffeeScript"], "litcoffee": ["CoffeeScript"], "yaml": ["yaml"], "yml": ["yaml"], "dart": ["dart"], "json": ["json"] },' \
    "${1}"
}

_restore() {
  sed -i -e 's/^\t"extensionsGallery.*/\t"extensionsGallery": {\n\t\t"serviceUrl": "https:\/\/open-vsx.org\/vscode\/gallery",\n\t\t"itemUrl": "https:\/\/open-vsx.org\/vscode\/item"\n\t},/' \
    -e 's/^\t"linkProtectionTrustedDomains.*/\t"linkProtectionTrustedDomains": ["https:\/\/open-vsx.org"],/' \
    -e '/^\t"extensionTips/d' \
    "${1}"
}

# Use grep -q to detect if product.json has already been patched.
if grep -q "open-vsx" "${product_json_path}" & [ "$1" = '' ]; then
  _patch "${product_json_path}"
elif ! grep -q "open-vsx" "${product_json_path}" & [ "$1" = '-R' ]; then
  _restore "${product_json_path}"
fi
