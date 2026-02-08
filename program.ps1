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