cd C:\Users\$env:UserName\Desktop
$csvfile = Import-Csv .\2020_m3104_plan_lab.csv -Delimiter ';'
foreach($line in $csvfile){
    Add-DnsServerConditionalForwarderZone -Name $line.vdportgroup -MasterServers $line.ipv6_gu_routeur +","+ $line.ipv4_svr -PassThru
    echo " --------------Add-------------- " $line.vdportgroup "Server on IPV4/IPV6" $line.ipv4_svr
}
Get-DnsServerForwarder