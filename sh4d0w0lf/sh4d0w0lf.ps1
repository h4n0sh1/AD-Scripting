$OUTPUT_FILE = "$PSScriptRoot\rdp_sessions.txt"
$FileSize = 0
$AUDIO_FILE = "C:\Windows\media\Ring01.wav"
$prev_output = 0
$output_map = @{}
$HOST_IP = ((ipconfig | findstr [0-9].\.)[0]).Split()[-1]
$POPUP_STRING = "New session detected !"


function playAudio{
    $sound = New-Object Media.SoundPlayer($AUDIO_FILE)
    $sound.PlayLooping()
    $wshell = New-Object -ComObject Wscript.shell
    $Output = $wshell.Popup($POPUP_STRING)
    if($Output -eq "1"){
        $sound.Stop()
    }
}

function shadow($id){
    mstsc /shadow:$id /v:$HOST_IP /noconsentprompt /control
} 

while(1){
($cmd_output = quser) | tee -filepath $OUTPUT_FILE -Append
$cmd_output | %{
    if($output_map.ContainsKey($_)){
        $output_map.Add($_,"")
    }
}
if($cmd_output.Length -gt $prev_output.Length){
    echo $POPUP_STRING | Out-File -FilePath $OUTPUT_FILE -Append
    playAudio
    #shadow 8
    $FileSize = $NewFileSize
}
sleep 1
$prev_output = $cmd_output
clear
}