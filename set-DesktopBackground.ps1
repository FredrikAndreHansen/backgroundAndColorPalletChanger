function Set-DesktopBackground ($Path) {
    $absolutePath = (Resolve-Path $Path).Path;

    $regPath = 'HKCU:\Control Panel\Desktop';

    Set-ItemProperty -Path $regPath -Name "WallPaper" -Value $absolutePath;
    #Stretched style
    Set-ItemProperty -Path $regPath -Name "WallPaperStyle" -Value 2;
    #No tiles
    Set-ItemProperty -Path $regPath -Name "TileWallpaper" -Value 0;

    #Change background/apply changes
    $SPI_SETDESKWALLPAPER = 20;
    $SPIF_UPDATEINIFILE = 0x01;
    $SPIF_SENDWININICHANGE = 0x02;

    [Wallpaper]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $absolutePath, $SPIF_UPDATEINIFILE -bor $SPIF_SENDWININICHANGE) | Out-Null;
}