#!/usr/bin/Perl

## cpu used
my $cpu_used =`top -l 1 | grep -E "^CPU" | grep -Eo '[^[:space:]]+%' | head -1 | sed s/\%/\/`;

#my $full = `top -l 1 -n 0`;

## memsize
my $memsize =`sysctl hw.memsize`;
$memsize =~ s/[^0-9]//g;

## processes
my $processes =`top -l 1 -n 0| grep -E "Processes"`;
my @process = split(',', $processes);
my $totalprocess = $process[0];
$totalprocess =~ s/[^0-9]//g;
my $runningprocess = $process[1];
$runningprocess =~ s/[^0-9]//g;
my $threads=$process[3];
$threads =~ s/[^0-9]//g;

## disks
my $disks =`top -l 1 -n 0| grep -E "Disks"`;
my @disk = split(',', $disks);
my $diskread = $disk[0];
$diskread =~ s/[^\/\0-9\M]//g;
$diskread =~ s/\s//g;
my $diskwrite = $disk[1];
$diskwrite =~ s/[^\/\0-9\M]//g;
$diskwrite =~ s/\s//g;
#print $diskwrite;

print "<inventory>\n";
print "<inventory_module>\n";
print "<name><![CDATA[cpu_Used]]></name>\n";
print "<datalist>\n";
print "<data><![CDATA[$cpu_used]]></data>\n";
print "</datalist>\n";
print "</inventory_module>\n";

print "<inventory_module>\n";
print "<name><![CDATA[hw.memsize]]></name>\n";
print "<datalist>\n";
print "<data><![CDATA[$memsize]]></data>\n";
print "</datalist>\n";
print "</inventory_module>\n";

print "<inventory_module>\n";
print "<name><![CDATA[total_process]]></name>\n";
print "<datalist>\n";
print "<data><![CDATA[$totalprocess]]></data>\n";
print "</datalist>\n";
print "</inventory_module>\n";

print "<inventory_module>\n";
print "<name><![CDATA[running_process]]></name>\n";
print "<datalist>\n";
print "<data><![CDATA[$runningprocess]]></data>\n";
print "</datalist>\n";
print "</inventory_module>\n";

print "<inventory_module>\n";
print "<name><![CDATA[threads]]></name>\n";
print "<datalist>\n";
print "<data><![CDATA[$threads]]></data>\n";
print "</datalist>\n";
print "</inventory_module>\n";

print "<inventory_module>\n";
print "<name><![CDATA[disks_read]]></name>\n";
print "<datalist>\n";
print "<data><![CDATA[$diskread]]></data>\n";
print "</datalist>\n";
print "</inventory_module>\n";

print "<inventory_module>\n";
print "<name><![CDATA[disks_write]]></name>\n";
print "<datalist>\n";
print "<data><![CDATA[$diskwrite]]></data>\n";
print "</datalist>\n";
print "</inventory_module>\n";

print "</inventory>\n";


