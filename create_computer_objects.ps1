#need the Active Directory Module installed for this to run

#get list of object to create
$computers = Get-Content "C:\Scripts\fun_stuff\helloAD.txt"

#loop through list of computer objects
foreach ($pc in $computers){
    New-ADComputer -Name $pc -SAMAccountName $pc  -path "OU=MyOU,OU=Test,OU=Servers,OU=MyOrg,DC=eg,DC=helloworld,DC=org"
    
}

#add the objects to a group
foreach ($pc in $computers){
    Add-ADGroupMember -Identity "Hello_Group!" -Members "$pc$"
}