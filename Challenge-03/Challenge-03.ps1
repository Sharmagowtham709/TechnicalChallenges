<#
Challenge 3: We have a nested object. We would like a function where you pass in the object and a key and get back the value. The choice of language and implementation is up to you.
Example Inputs
object = {"a":{"b":{"c":"d"}}}
key = a/b/c
object = {"x":{"y":{"z":"a"}}}
key = x/y/z
value = a
#>

#@{'a'=@{'b'=@{'c'='d'}}}

param(
    [parameter (Mandatory = $false)][PSCustomObject]$Inputobject = @{'a' = @{'b' = @{'c' = 'd' } } },
    [parameter (Mandatory = $false)][String]$InputKey = 'a'
)
function Get-Value($Inputobject, $InputKey) {   
    try {
        if ($Inputobject.Keys -eq $InputKey) {
            return $Inputobject.Values | ConvertTo-Json
        }
        if ($Inputobject.Keys.GetType() -eq "String") {
            return $false
        }
        else {
            Get-Value -Inputobject $Inputobject.Values -InputKey $InputKey
        }
    }
    catch {
        Write-Host "Invalid Key!"
    }
}
Get-Value -Inputobject $Inputobject -InputKey $InputKey
