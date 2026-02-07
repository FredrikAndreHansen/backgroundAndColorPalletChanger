$FullPath = "C:\Users\fredr\Documents\Projects\Scripts\BackgroundChanger";

. $FullPath\Set-AccentColor.ps1;

function Set-DesktopBackground ($Path) {
    $absolutePath = (Resolve-Path $Path).Path;

    $regPath = 'HKCU:\Control Panel\Desktop';

    Set-ItemProperty -Path $regPath -Name "WallPaper" -Value $absolutePath;
    #Stretched style
    Set-ItemProperty -Path $regPath -Name "WallPaperStyle" -Value 2;
    #No tiles
    Set-ItemProperty -Path $regPath -Name "TileWallpaper" -Value 0;

#Change background/apply changes
Add-Type @"
using System;
using System.Runtime.InteropServices;

public class Wallpaper {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

    $SPI_SETDESKWALLPAPER = 20
    $SPIF_UPDATEINIFILE = 0x01
    $SPIF_SENDWININICHANGE = 0x02

    [Wallpaper]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $absolutePath, $SPIF_UPDATEINIFILE -bor $SPIF_SENDWININICHANGE) | Out-Null

}


$imagePath = "C:\Users\fredr\Documents\Projects\Scripts\BackgroundChanger\";

$image1 = $imagePath + "img1.jpg";
$image2 = $imagePath + "img2.jpg";
$image3 = $imagePath + "img3.jpg";
$image4 = $imagePath + "img4.jpg";
$image5 = $imagePath + "img5.jpg";
$image6 = $imagePath + "img6.png";
$image7 = $imagePath + "img7.jpg";
$image8 = $imagePath + "img8.jpg";
$image9 = $imagePath + "img9.jpg";

$SetBackground = Get-Random -Minimum 0 -Maximum 9;


if ($SetBackground -eq 0) {
    Set-DesktopBackground -Path $image1;
    Set-AccentColor -Color 1;
} elseif ($SetBackground -eq 1) {
    Set-DesktopBackground -Path $image2;
    Set-AccentColor -Color 2;
} elseif ($SetBackground -eq 2) {
    Set-DesktopBackground -Path $image3;
    Set-AccentColor -Color 0;
} elseif ($SetBackground -eq 3) {
    Set-DesktopBackground -Path $image4;
    Set-AccentColor -Color 3;
} elseif ($SetBackground -eq 4) {
    Set-DesktopBackground -Path $image5;
    Set-AccentColor -Color 4;
} elseif ($SetBackground -eq 5) {
    Set-DesktopBackground -Path $image6;
    Set-AccentColor -Color 5;
} elseif ($SetBackground -eq 6) {
    Set-DesktopBackground -Path $image7;
    Set-AccentColor -Color 6;
} elseif ($SetBackground -eq 7) {
    Set-DesktopBackground -Path $image8;
    Set-AccentColor -Color 7;
} elseif ($SetBackground -eq 8) {
    Set-DesktopBackground -Path $image9;
    Set-AccentColor -Color 8;
}