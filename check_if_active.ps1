$users = get-content C:\path_to\usernames.csv
foreach ($item in $users) {
$user = $null
$user =  Get-aduser -filter {samAccountName -eq $item}
if ($user)
    {
    get-ADUser $user | select samaccountname,name,enabled | Export-Csv C:\path_to\output.csv -nti -Append
    }
    else
    {
    "$item ,,N/A" | Add-Content C:\path_to\output.csv
    }
}
