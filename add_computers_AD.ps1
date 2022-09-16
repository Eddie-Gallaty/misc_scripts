<#
    .Description
    Add computer objects to Active directory then add those objects to an AD group.
    ***You must have Active Directory Module for PowerShell installed for this to work***
#>

#Assign variable to list of object to be created
$computers = Get-Content "C:\Scripts\fun_stuff\helloAD.txt"

#Add each object in computers to Active Directory
foreach ($pc in $computers){
    New-ADComputer -Name $pc -SAMAccountName $pc  -path "OU=MyOU,OU=Test,OU=Servers,OU=MyOrg,DC=eg,DC=helloworld,DC=org"   
}

#add each object to a group
foreach ($pc in $computers){
    Add-ADGroupMember -Identity "Hello_Group!" -Members "$pc$"
}