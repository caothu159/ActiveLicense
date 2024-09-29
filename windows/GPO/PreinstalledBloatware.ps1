Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process

# Remove Windows Bloatware
$bloatwareLst = @(
    'Microsoft.Microsoft3DViewer';
    'Microsoft.BingSearch';
    # 'Microsoft.WindowsCalculator';
    'Microsoft.WindowsCamera';
    'Clipchamp.Clipchamp';
    'Microsoft.WindowsAlarms';
    'Microsoft.549981C3F5F10';
    'Microsoft.Windows.DevHome';
    'MicrosoftCorporationII.MicrosoftFamily';
    'Microsoft.WindowsFeedbackHub';
    'Microsoft.GetHelp';
    'microsoft.windowscommunicationsapps';
    'Microsoft.WindowsMaps';
    'Microsoft.ZuneVideo';
    'Microsoft.BingNews';
    # 'Microsoft.WindowsNotepad';
    'Microsoft.MicrosoftOfficeHub';
    'Microsoft.Office.OneNote';
    'Microsoft.OutlookForWindows';
    'Microsoft.Paint';
    # 'Microsoft.MSPaint';
    'Microsoft.People';
    # 'Microsoft.Windows.Photos';
    'Microsoft.PowerAutomateDesktop';
    'MicrosoftCorporationII.QuickAssist';
    'Microsoft.SkypeApp';
    'Microsoft.ScreenSketch';
    'Microsoft.MicrosoftSolitaireCollection';
    'Microsoft.MicrosoftStickyNotes';
    'MSTeams';
    'MicrosoftTeams';
    'Microsoft.Getstarted';
    'Microsoft.Todos';
    'Microsoft.WindowsSoundRecorder';
    'Microsoft.BingWeather';
    'Microsoft.ZuneMusic';
    # 'Microsoft.WindowsTerminal';
    'Microsoft.Xbox.TCUI';
    'Microsoft.XboxApp';
    'Microsoft.XboxGameOverlay';
    'Microsoft.XboxGamingOverlay';
    'Microsoft.XboxIdentityProvider';
    'Microsoft.XboxSpeechToTextOverlay';
    'Microsoft.GamingApp';
    'Microsoft.YourPhone';
    # 'Microsoft.MicrosoftEdge';
    # 'Microsoft.MicrosoftEdge.Stable';
    # 'Microsoft.MicrosoftEdge_8wekyb3d8bbwe';
    # 'Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe';
    # 'Microsoft.MicrosoftEdgeDevToolsClient_1000.19041.1023.0_neutral_neutral_8wekyb3d8bbwe';
    # 'Microsoft.MicrosoftEdge_44.19041.1266.0_neutral__8wekyb3d8bbwe';
    # 'Microsoft.OneDrive';
    # 'Microsoft.MicrosoftEdgeDevToolsClient';
    'Microsoft.549981C3F5F10';
    'Microsoft.MixedReality.Portal';
    'Microsoft.Windows.Ai.Copilot.Provider';
    'Microsoft.WindowsMeetNow';
    # 'Microsoft.WindowsStore';
    'MicrosoftWindows.Client.WebExperience';
)
Get-AppxProvisionedPackage -Online |
Where-Object -Property 'DisplayName' -In -Value $bloatwareLst | Remove-AppxProvisionedPackage -AllUsers -Online

Get-AppxPackage -AllUsers | 
Where-Object -Property 'Name' -In -Value $bloatwareLst | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue

# Removes Microsoft Teams
$TeamsPath = [System.IO.Path]::Combine($env:LOCALAPPDATA, 'Microsoft', 'Teams')
$TeamsUpdateExePath = [System.IO.Path]::Combine($TeamsPath, 'Update.exe')

Stop-Process -Name "*teams*" -Force -ErrorAction Continue

if ([System.IO.File]::Exists($TeamsUpdateExePath)) {
    # Uninstall app
    $proc = Start-Process $TeamsUpdateExePath "-uninstall -s" -PassThru
    $proc.WaitForExit()
}

Get-AppxPackage "*Teams*" | Remove-AppxPackage -ErrorAction Continue
Get-AppxPackage "*Teams*" -AllUsers | Remove-AppxPackage -AllUsers -ErrorAction Continue

if ([System.IO.Directory]::Exists($TeamsPath)) {
    Remove-Item $TeamsPath -Force -Recurse -ErrorAction Continue
}

# Uninstall from Uninstall registry key UninstallString
$us = (Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -like '*Teams*' }).UninstallString
if ($us.Length -gt 0) {
    $us = ($us.Replace('/I', '/uninstall ') + ' /quiet').Replace('  ', ' ')
    $FilePath = ($us.Substring(0, $us.IndexOf('.exe') + 4).Trim())
    $ProcessArgs = ($us.Substring($us.IndexOf('.exe') + 5).Trim().replace('  ', ' '))
    $proc = Start-Process -FilePath $FilePath -Args $ProcessArgs -PassThru
    $proc.WaitForExit()
}

# Prevents New Outlook for Windows Installation
reg.exe delete "HKLM\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler_Oobe\OutlookUpdate" /f

# Prevents Chat Auto Installation and Removes Chat Icon
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Communications" /v ConfigureChatAutoInstall /t REG_DWORD /d 0 /f
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Chat" /v "ChatIcon" /t REG_DWORD /d 3 /f

# Get-AppxPackage *3dbuilder* | Remove-AppxPackage
# Get-AppxPackage *windowsalarms* | Remove-AppxPackage
# Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage
# Get-AppxPackage *officehub* | Remove-AppxPackage
# Get-AppxPackage *skypeapp* | Remove-AppxPackage
# Get-AppxPackage *getstarted* | Remove-AppxPackage
# Get-AppxPackage *zunemusic* | Remove-AppxPackage
# Get-AppxPackage *windowsmaps* | Remove-AppxPackage
# Get-AppxPackage *solitairecollection* | Remove-AppxPackage
# Get-AppxPackage *bingfinance* | Remove-AppxPackage
# Get-AppxPackage *zunevideo* | Remove-AppxPackage
# Get-AppxPackage *bingnews* | Remove-AppxPackage
# Get-AppxPackage *onenote* | Remove-AppxPackage
# Get-AppxPackage *people* | Remove-AppxPackage
# Get-AppxPackage *windowsphone* | Remove-AppxPackage
# Get-AppxPackage *photos* | Remove-AppxPackage
# Get-AppxPackage *windowsstore* | Remove-AppxPackage
# Get-AppxPackage *bingsports* | Remove-AppxPackage
# Get-AppxPackage *soundrecorder* | Remove-AppxPackage
# Get-AppxPackage *bingweather* | Remove-AppxPackage
# Get-AppxPackage *xboxapp* | Remove-AppxPackage
# Get-AppxPackage *king.com.CandyCrushSodaSaga* | Remove-AppxPackage
# Get-AppxPackage *bingsports* | Remove-AppxPackage
# Get-AppxPackage *Office.sway* | Remove-AppxPackage
# Get-AppxPackage *Twitter* | Remove-AppxPackage
# Get-AppxPackage *Bing* | Remove-AppxPackage
# Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage
# Get-AppxPackage *Microsoft.BingFinance* | Remove-AppxPackage
# Get-AppxPackage *Microsoft.WindowsScan* | Remove-AppxPackage
# Get-AppxPackage *Microsoft.Reader* | Remove-AppxPackage
# Get-AppxPackage *Microsoft.CommsPhone* | Remove-AppxPackage
# Get-AppxPackage *Microsoft.ConnectivityStore* | Remove-AppxPackage
# Get-AppxPackage *Microsoft.WindowsReadingList* | Remove-AppxPackage

# Computer Config > Policies > Windows Settings > Scripts (Startup/shutdown)
# User config > Windows Settings > Scripts (Login/Logoff) (powershell run last)

# Get-AppxPackage -AllUsers | where-object {$_.name –notlike “store”} | Remove-AppxPackage Get-appxprovisionedpackage –online | where-object {$_.packagename –notlike “store”} | Remove-AppxProvisionedPack
