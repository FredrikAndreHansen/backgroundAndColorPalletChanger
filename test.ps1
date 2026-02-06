<#
.SYNOPSIS
  Set Windows 11 accent color via registry.

.USAGE
  .\Set-AccentColor.ps1 -Red 30 -Green 144 -Blue 255
#>

param(
    [int]$Red,
    [int]$Green,
    [int]$Blue
);

$alpha = 0xFF;
$accentDwm =
    ($alpha -shl 24) -bor
    (($Blue  -band 0xFF) -shl 16) -bor
    (($Green -band 0xFF) -shl 8)  -bor
    (($Red   -band 0xFF));

$dwmPath      = "HKCU:\Software\Microsoft\Windows\DWM";
$accentPath   = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent";
$personalPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize";

# Ensure keys exist
New-Item -Path $dwmPath      -Force | Out-Null;
New-Item -Path $accentPath   -Force | Out-Null;
New-Item -Path $personalPath -Force | Out-Null;

# Write accent values
Set-ItemProperty -Path $dwmPath    -Name AccentColor        -Type DWord -Value $accentDwm;
Set-ItemProperty -Path $dwmPath    -Name ColorizationColor  -Type DWord -Value $accentDwm;
Set-ItemProperty -Path $accentPath -Name AccentColorMenu    -Type DWord -Value $accentMenu;

# Make sure accent color is used
Set-ItemProperty -Path $personalPath -Name ColorPrevalence -Type DWord -Value 1;

# Refresh shell
Get-Process explorer -ErrorAction SilentlyContinue | Stop-Process -Force;

Start-Sleep -Seconds 2;