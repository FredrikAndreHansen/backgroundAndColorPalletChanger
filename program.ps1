Add-Type @"
using System;
using System.Runtime.InteropServices;

public class Wallpaper {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}

public class WinAPI {
    [DllImport("user32.dll")]
    public static extern bool SetForegroundWindow(IntPtr hWnd);

    [DllImport("user32.dll")]
    public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
}
"@;

$FullPath = "C:\Users\fredr\Documents\Projects\Scripts\BackgroundChanger\";

. $FullPath\Set-AccentColor.ps1;
. $FullPath\Set-DesktopBackground.ps1;

$allImages = @(
    ($FullPath + "img1.jpg"),
    ($FullPath + "img2.jpg"),
    ($FullPath + "img3.jpg"),
    ($FullPath + "img4.jpg"),
    ($FullPath + "img5.jpg"),
    ($FullPath + "img6.png"),
    ($FullPath + "img7.jpg"),
    ($FullPath + "img8.jpg"),
    ($FullPath + "img9.jpg")
);

$SetRandomBackground = Get-Random -Minimum 0 -Maximum $allImages.Length;

Set-DesktopBackground -Path $allImages[$SetRandomBackground];
Set-AccentColor -Color $SetRandomBackground;