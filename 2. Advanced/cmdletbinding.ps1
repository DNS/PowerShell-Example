[cmdletbinding()]
Param(
    [Parameter(Mandatory=$true)] [String] $Argument1 = 'default value',
    [Int] $Argument2
)

'arg1: ' + $Argument1
'arg2: ' + $Argument2

<#
run:

.\test.ps1 -Argument1 'test 123' -Argument2 888

String 
Int Int64 Int128
UInt UInt64 UInt128
BigInt
Float Double

[Int128]::MaxValue
[UInt128]::MaxValue
[Float]::MaxValue
[Double]::MaxValue

#>
