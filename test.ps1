$ErrorActionPreference = "Stop"

$file = "index.html"
if (-not (Test-Path $file)) {
    Write-Error "FAIL: index.html was not found."
    exit 1
}

$html = Get-Content $file -Raw
$checks = @(
    @{ Name = "Form element"; Pattern = '<form\b' },
    @{ Name = "Name input"; Pattern = '<input[^>]+id="name"[^>]*required' },
    @{ Name = "Email input"; Pattern = '<input[^>]+type="email"[^>]+id="email"[^>]*required' },
    @{ Name = "Contact number input"; Pattern = '<input[^>]+id="contact"[^>]*required' },
    @{ Name = "Submit button"; Pattern = '<button[^>]+type="submit"' }
)

$failed = $false
foreach ($check in $checks) {
    if ($html -match $check.Pattern) {
        Write-Host ("PASS: " + $check.Name)
    } else {
        Write-Host ("FAIL: " + $check.Name)
        $failed = $true
    }
}

if ($failed) {
    exit 1
}

Write-Host "All HTML form tests passed."
exit 0
