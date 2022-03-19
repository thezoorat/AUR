#!/usr/bin/env sh

if [ "${1}" = "-R" ]; then
  sed -i -e 's/^[[:blank:]]*"nameLong":.*/\t"nameLong": "Code - OSS",/' \
    -e 's/^[[:blank:]]*"extensionEnabledApiProposals":.*/\t"extensionAllowedProposedApi": ["ms-vscode.vscode-js-profile-flame", "ms-vscode.vscode-js-profile-table", "GitHub.remotehub", "GitHub.remotehub-insiders"],/' \
    -e '/^[[:blank:]]*"extensionSyncedKeys/d' \
    /usr/lib/code/product.json
else
  # To patch proposed api:
  # Use vim to visual select "extensionEnabledApiProposals"
  # Then press :join<CR>
  # To patch sync server:
  # Use vim to visual select "extensionSyncedKeys" "linkProtectionTrustedDomains" "auth" "configurationSync.store"
  # Then press :join<CR>
  # Select joined line and execute :'<,'>s/\//\\\//g
  sed -i -e 's/^[[:blank:]]*"nameLong":.*/\t"nameLong": "Visual Studio Code",/' \
    -e 's/^[[:blank:]]*"extensionAllowedProposedApi":.*/\t"extensionEnabledApiProposals": { "ms-vscode.vscode-selfhost-test-provider": ["testObserver"], "VisualStudioExptTeam.vscodeintellicode-completions": ["inlineCompletions"], "ms-vsliveshare.vsliveshare": ["contribMenuBarHome", "diffCommand", "documentFiltersExclusive", "fileSearchProvider", "findTextInFiles", "notebookCellExecutionState", "notebookContentProvider", "notebookEditor", "notebookEditorEdit", "notebookLiveShare", "terminalDimensions", "terminalDataWriteEvent", "textDocumentNotebook", "textSearchProvider"], "ms-vscode.js-debug": ["portsAttributes", "findTextInFiles", "workspaceTrust", "resolvers"], "ms-toolsai.vscode-ai-remote": ["resolvers", "notebookEditor"], "ms-python.python": ["quickPickSortByLabel", "testObserver", "notebookEditor"], "ms-dotnettools.dotnet-interactive-vscode": ["notebookConcatTextDocument", "notebookContentProvider", "notebookCellExecutionState", "notebookControllerKind", "notebookDebugOptions", "notebookDeprecated", "notebookEditor", "notebookEditorDecorationType", "notebookEditorEdit", "notebookLiveShare", "notebookMessaging", "notebookMime", "textDocumentNotebook"], "GitHub.codespaces": ["contribMenuBarHome", "contribRemoteHelp", "contribViewsRemote", "notebookEditor", "resolvers", "terminalDataWriteEvent", "treeViewReveal"], "ms-vscode.azure-repos": ["extensionRuntime", "fileSearchProvider", "resolvers", "textSearchProvider"], "ms-vscode.vscode-github-issue-notebooks": ["notebookEditor"], "tanhakabir.rest-book": ["notebookEditor"], "ms-vscode-remote.remote-wsl": ["resolvers", "contribViewsRemote"], "ms-vscode-remote.remote-ssh": ["resolvers", "terminalDataWriteEvent", "contribViewsRemote", "telemetry"], "ms-vscode-remote.remote-containers": ["resolvers", "workspaceTrust", "terminalDimensions", "contribViewsRemote"], "ms-vscode.js-debug-nightly": ["portsAttributes", "findTextInFiles", "workspaceTrust", "resolvers"], "ms-vscode.lsif-browser": ["documentFiltersExclusive"], "GitHub.vscode-pull-request-github": ["tokenInformation"], "GitHub.copilot": ["inlineCompletions", "textDocumentNotebook"], "GitHub.copilot-nightly": ["inlineCompletions", "textDocumentNotebook"], "GitHub.remotehub": ["contribRemoteHelp", "contribMenuBarHome", "contribViewsRemote", "contribViewsWelcome", "documentFiltersExclusive", "extensionRuntime", "fileSearchProvider", "quickPickSortByLabel", "workspaceTrust", "resolvers", "scmSelectedProvider", "scmValidation", "textSearchProvider", "timeline", "notebookEditor"], "GitHub.remotehub-insiders": ["contribRemoteHelp", "contribMenuBarHome", "contribViewsRemote", "contribViewsWelcome", "documentFiltersExclusive", "extensionRuntime", "fileSearchProvider", "quickPickSortByLabel", "workspaceTrust", "resolvers", "scmSelectedProvider", "scmValidation", "textSearchProvider", "timeline", "notebookEditor"], "ms-python.gather": ["notebookEditor", "notebookCellExecutionState"], "ms-toolsai.jupyter": ["notebookConcatTextDocument", "notebookControllerKind", "notebookDebugOptions", "notebookDeprecated", "notebookEditor", "notebookEditorDecorationType", "notebookEditorEdit", "notebookMessaging", "notebookMime", "notebookCellExecutionState", "portsAttributes", "textDocumentNotebook", "quickPickSortByLabel"], "dbaeumer.vscode-eslint": ["tabs", "notebookEditor", "notebookCellExecutionState"], "azure-sphere-tools-ui": ["resolvers"] },/' \
    -e '/^[[:blank:]]*"extensionSyncedKeys/d' \
    -e '/^[[:blank:]]*"extensionEnabledApiProposals/a\\t"extensionSyncedKeys": { "ritwickdey.liveserver": ["liveServer.setup.version"] }, "linkProtectionTrustedDomains": ["https:\/\/*.visualstudio.com", "https:\/\/*.microsoft.com", "https:\/\/aka.ms", "https:\/\/vscode-auth.github.com", "https:\/\/client-auth-staging-14a768b.herokuapp.com", "https:\/\/*.gallerycdn.vsassets.io", "https:\/\/github.com\/microsoft\/", "https:\/\/github.com\/MicrosoftDocs\/", "https:\/\/login.microsoftonline.com"], "auth": { "loginUrl": "https:\/\/login.microsoftonline.com\/common\/oauth2\/authorize", "tokenUrl": "https:\/\/login.microsoftonline.com\/common\/oauth2\/token", "redirectUrl": "https:\/\/vscode-redirect.azurewebsites.net\/", "clientId": "aebc6443-996d-45c2-90f0-388ff96faa56" }, "configurationSync.store": { "url": "https:\/\/vscode-sync.trafficmanager.net\/", "stableUrl": "https:\/\/vscode-sync.trafficmanager.net\/", "insidersUrl": "https:\/\/vscode-sync-insiders.trafficmanager.net\/", "canSwitch": false, "authenticationProviders": { "microsoft": { "scopes": ["openid", "profile", "email", "offline_access"] }, "github": { "scopes": ["user:email"] } } },' \
    /usr/lib/code/product.json
fi
