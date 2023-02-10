
$ClearString = 'a'

$hasher = [System.Security.Cryptography.HashAlgorithm]::Create('sha256')
$hash = $hasher.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($ClearString))

$hashString = [System.BitConverter]::ToString($hash)

$hashString.ToLower().Replace('-', '')


# 'a' | openssl sha256


