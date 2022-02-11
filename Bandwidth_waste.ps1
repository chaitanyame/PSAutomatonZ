

$urls= 'https://speedtest.ggamaur.net.prod.hosts.ooklaserver.net:8080/download?nocache=b9dec384-f273-468d-833a-6a8b854f03bf&size=25000000&guid=af71e438-da62-49cd-b0ba-03db8e5b00ae','https://lg-zur.fdcservers.net:8080/download?nocache=789e560d-45c6-49d5-a6e4-d67c8caf7fa1&size=25000000&guid=af71e438-da62-49cd-b0ba-03db8e5b00ae',
'https://lg-zur.fdcservers.net:8080/download?nocache=789e560d-45c6-49d5-a6e4-d67c8caf7fa1&size=25000000&guid=af71e438-da62-49cd-b0ba-03db8e5b00ae','https://speedtest.wingo.ch:8080/download?nocache=f367cd2b-aa4a-4aa8-b463-14569aade7fc&size=25000000&guid=af71e438-da62-49cd-b0ba-03db8e5b00ae'


$startIteration=1

$endIteration=200


$allMbs=@()

while ($startIteration -le $endIteration)
{

foreach ( $url in $urls)

{

$allMbs+= (Invoke-WebRequest -UseBasicParsing $url).RawContentLength/1024/1024

}

write-host "Download Iteration completed : $startIteration and remaining are : $($endIteration - $startIteration)"
$startIteration++;

}

$finalGB=0

foreach ($mb in $allMbs)
{

$finalGB+=$mb

}

write-host "totalGB consumed is $([math]::round($finalGB/1024,3))"

