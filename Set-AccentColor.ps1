Add-Type @"
using System;
using System.Runtime.InteropServices;

public class WinAPI {
    [DllImport("user32.dll")]
    public static extern bool SetForegroundWindow(IntPtr hWnd);

    [DllImport("user32.dll")]
    public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
}
"@


function Set-AccentColor {
    param(
        [int]$Color
    )

    # Open Settings → Colors
    Start-Process "ms-settings:colors"
    Start-Sleep -Seconds 1.5

    $settingsWindow = Get-Process ApplicationFrameHost -ErrorAction SilentlyContinue |
    Where-Object { $_.MainWindowTitle -ne "" } |
    Select-Object -First 1

if ($settingsWindow) {
#Full screen window
[WinAPI]::ShowWindowAsync($settingsWindow.MainWindowHandle, 3) | Out-Null
#Select to foreground
[WinAPI]::SetForegroundWindow($settingsWindow.MainWindowHandle) | Out-Null
}

    # Load SendKeys
    Add-Type -AssemblyName System.Windows.Forms

    # Move focus out of the search box
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
    Start-Sleep -Milliseconds 150

    # Move into the scrollable content
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
    Start-Sleep -Milliseconds 150

    # Scroll down to the accent color grid
    for ($i = 0; $i -lt 8; $i++) {
        [System.Windows.Forms.SendKeys]::SendWait("{PGDN}")
        Start-Sleep -Milliseconds 120
    }

    # Now TAB until we reach the accent color grid
    for ($i = 0; $i -lt 7; $i++) {
        [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
        Start-Sleep -Milliseconds 80
    }

    if ($Color -eq 0) {
        Select-Blue;
    } elseif ($Color -eq 1) {
        Select-Red
    } elseif ($Color -eq 2) {
        Select-DarkBlue
    } elseif ($Color -eq 3) {
        Select-Desert
    } elseif ($Color -eq 4) {
        Select-Seafoam
    } elseif ($Color -eq 5) {
        Select-Palered
    } elseif ($Color -eq 6) {
        Select-Metalblue
    } elseif ($Color -eq 7) {
        Select-Green
    } elseif ($Color -eq 8) {
        Select-Storm
    }
    
    # Change the color
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    Start-Sleep -Milliseconds 200

    # Close Settings
    [System.Windows.Forms.SendKeys]::SendWait("%{F4}")
}

function Select-Blue {
    for ($i = 0; $i -lt 1; $i++) {
        [System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
        Start-Sleep -Milliseconds 80
    }

    for ($i = 0; $i -lt 7; $i++) {
        [System.Windows.Forms.SendKeys]::SendWait("{RIGHT}")
        Start-Sleep -Milliseconds 80
    }

    [System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
    [System.Windows.Forms.SendKeys]::SendWait("{RIGHT}")
}

function Select-Red {

    for ($i = 0; $i -lt 4; $i++) {
        [System.Windows.Forms.SendKeys]::SendWait("{RIGHT}")
        Start-Sleep -Milliseconds 80
    }
}

function Select-DarkBlue {
    for ($i = 0; $i -lt 1; $i++) {
        [System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
        Start-Sleep -Milliseconds 80
    }

    for ($i = 0; $i -lt 6; $i++) {
        [System.Windows.Forms.SendKeys]::SendWait("{RIGHT}")
        Start-Sleep -Milliseconds 80
    }

    [System.Windows.Forms.SendKeys]::SendWait("{RIGHT}")
}

function Select-Desert {

    [System.Windows.Forms.SendKeys]::SendWait("{RIGHT}")
    Start-Sleep -Milliseconds 80

    for ($i = 0; $i -lt 5; $i++) {
        [System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
        Start-Sleep -Milliseconds 80
    }
}

function Select-Seafoam {
    for ($i = 0; $i -lt 3; $i++) {
        [System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
        Start-Sleep -Milliseconds 80
    }
}

function Select-Palered {
    for ($i = 0; $i -lt 8; $i++) {
        [System.Windows.Forms.SendKeys]::SendWait("{RIGHT}")
        Start-Sleep -Milliseconds 80
    }
}

function Select-Metalblue {
    for ($i = 0; $i -lt 8; $i++) {
        [System.Windows.Forms.SendKeys]::SendWait("{RIGHT}")
        Start-Sleep -Milliseconds 80
    }

    for ($i = 0; $i -lt 3; $i++) {
        [System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
        Start-Sleep -Milliseconds 80
    }
}

function Select-Green {
    for ($i = 0; $i -lt 4; $i++) {
        [System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
        Start-Sleep -Milliseconds 80
    }

    for ($i = 0; $i -lt 3; $i++) {
        [System.Windows.Forms.SendKeys]::SendWait("{RIGHT}")
        Start-Sleep -Milliseconds 80
    }
}

function Select-Storm {
    for ($i = 0; $i -lt 5; $i++) {
        [System.Windows.Forms.SendKeys]::SendWait("{RIGHT}")
        Start-Sleep -Milliseconds 80
    }

    for ($i = 0; $i -lt 4; $i++) {
        [System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
        Start-Sleep -Milliseconds 80
    }
}