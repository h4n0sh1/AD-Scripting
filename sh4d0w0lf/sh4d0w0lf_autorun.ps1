$OUTPUT_FILE = "$PSScriptRoot\rdp_sessions.txt"
$FileSize = 0
$AUDIO_FILE = "C:\Windows\media\Ring01.wav"
$prev_output = 0
$output_map = @{}
$interaction_counter = 0
$HOST_IP = ((ipconfig | findstr [0-9].\.)[0]).Split()[-1]
$POPUP_STRING = "New session detected !"

function shadow($id){
	mstsc /shadow:$id /v:$HOST_IP /noconsentprompt /control
}

while(1){
	($cmd_output = quser) | tee -filepath $OUTPUT_FILE -Append

	if($cmd_output.Length -gt $prev_output.Length){
		echo $POPUP_STRING | Out-File -FilePath $OUTPUT_FILE -Append
		$interaction_counter += 1
		$FileSize = $NewFileSize
	}

	$cmd_output | %{
			$row_array = $_.trim() -split '\s+'
			try{
				$id = [int]$row_array[2]
			}catch{
				if($row_array[1] -ne "SESSION"){
					$id = [int]$row_array[1]
				}
			}
			if($row_array[1] -ne "SESSION" -and !($output_map.ContainsKey($id))){
				$output_map.Add($id,$_)
				if($interaction_counter -gt 0){
					shadow $id
				}
			}
	}

	sleep 1
	$prev_output = $cmd_output
	clear
}