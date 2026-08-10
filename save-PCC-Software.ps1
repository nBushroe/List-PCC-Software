param($driveletter)
$pccnum=hostname # uses the host name for the file name - NW-G328(room number)147554(pcc number)SC
$date=Get-Date -Format "yyyy_MM_dd"
$uninstallkeys=foreach ($UKey in 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*','HKLM:\SOFTWARE\Wow6432node\Microsoft\Windows\CurrentVersion\Uninstall\*','HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*','HKCU:\SOFTWARE\Wow6432node\Microsoft\Windows\CurrentVersion\Uninstall\*'){foreach ($Product in (Get-ItemProperty $UKey -ErrorAction SilentlyContinue)){if($Product.DisplayName -and $Product.SystemComponent -ne 1){$Product.DisplayName}}}
echo $uninstallkeys > $driveletter'\laptopSoftwareLists\'$date-$pccnum-software.txt
# Sanity checks
gc $driveletter'\laptopSoftwareLists\'$date-$pccnum-software.txt # show the content of the new file
dir $driveletter'\laptopSoftwareLists\' # lists files in the laptopSoftwareLists folder