#!/usr/bin/Perl

#CPU
my $cpu=`sysctl -n machdep.cpu.brand_string`;
#RAM
my $ram=`system_profiler SPHardwareDataType | grep "Memory:"`;
my $ram2=`top -l 1 -s 0 | grep PhysMem`;
#DISK
#my $disk=`diskutil list`;
my $disk=`diskutil list | grep -E "[ ]+[0-9]+:.*disk[0-9]+"`;
#NETWORKCARD
my $card=`networksetup -listallhardwareports`;
#APPS
#my $apps =`find / -iname *.app`;
my $apps =`ls -l /Applications`;
#MODULOS
print "<inventory>\n";
print "<inventory_module>\n";
print "<name><![CDATA[CPU]]></name>\n";
print "<datalist>\n";
print "<data><![CDATA[$cpu]]></data>\n";
print "</datalist>\n";
print "</inventory_module>\n";

print "<inventory_module>\n";
print "<name><![CDATA[RAM]]></name>\n";
print "<datalist>\n";
print "<data><![CDATA[$ram]]></data>\n";
print "<data><![CDATA[$ram2]]></data>\n";
print "</datalist>\n";
print "</inventory_module>\n";

print "<inventory_module>\n";
print "<name><![CDATA[DISK]]></name>\n";
print "<datalist>\n";
print "<data><![CDATA[$disk]]></data>\n";
print "</datalist>\n";
print "</inventory_module>\n";

print "<inventory_module>\n";
print "<name><![CDATA[CARDS]]></name>\n";
print "<datalist>\n";
print "<data><![CDATA[$card]]></data>\n";
print "</datalist>\n";
print "</inventory_module>\n";

print "<inventory_module>\n";
print "<name><![CDATA[APPS]]></name>\n";
print "<datalist>\n";
print "<data><![CDATA[$apps]]></data>\n";
print "</datalist>\n";
print "</inventory_module>\n";


print "</inventory>\n";
