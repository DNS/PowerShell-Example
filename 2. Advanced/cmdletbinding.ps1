[cmdletbinding()]
Param(
    [Parameter(Mandatory=$true)] [string] $Argument1 = 'default value',
    [string] $Argument2
)

'arg1: ' + $Argument1
'arg2: ' + $Argument2

<#
run:

.\test.ps1 -Argument1 'test 123' -Argument2 888

#>
