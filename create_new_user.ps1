
#Default username
param(
    [Parameter(Mandatory=$false)]
    [string]$name="User",                                       #Default password is the username
    [Parameter(Mandatory=$false)]
    [string]$fullname="User",                                   #Default fullname is the username
    [Parameter(Mandatory=$false)]
    [string]$description="A local user account."                #Default description
    )

#First, let's see if our default username is taken:
$regex = (Get-LocalUser).Name -contains "User"
if($regex)
{
    $iter = 0;
    #While our search for the current user to attempt returns a value
    while($regex)
    {
        #Iterate our iterator
        $iter = $iter + 1
        #Set regex equal to our pattern search of the local user base
        $regex = (Get-LocalUser).Name -eq ("User" + $iter)
    }
}
#We know that user + $iter is a valid username

$fullname = $fullname + $iter

"Enter secure password:"
$password = Read-Host -AsSecureString

$user_params = @{
    Name = ($name+$iter)
    Password = $password
    FullName = $fullname
    Description = $description
}

New-LocalUser @user_params