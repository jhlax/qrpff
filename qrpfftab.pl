#!/usr/athena/bin/perl

@tab=(51,115,59,38,99,35,107,118,62,126,54,43,110,46,102,123,211,147,219,6,67,
3,75,150,222,158,214,11,78,14,70,155,87,23,95,130,199,135,207,18,90,26,82,143,
202,138,194,31,217,153,209,0,73,9,65,144,216,152,208,1,72,8,64,145,61,125,53,36
,109,45,101,116,60,124,52,37,108,44,100,117,221,157,213,4,77,13,69,148,220,156,
212,5,76,12,68,149,89,25,81,128,201,137,193,16,88,24,80,129,200,136,192,17,215,
151,223,2,71,7,79,146,218,154,210,15,74,10,66,159,83,19,91,134,195,131,203,22,
94,30,86,139,206,142,198,27,179,243,187,166,227,163,235,246,190,254,182,171,238
,174,230,251,55,119,63,34,103,39,111,114,58,122,50,47,106,42,98,127,185,249,177
,160,233,169,225,240,184,248,176,161,232,168,224,241,93,29,85,132,205,141,197,
20,92,28,84,133,204,140,196,21,189,253,181,164,237,173,229,244,188,252,180,165,
236,172,228,245,57,121,49,32,105,41,97,112,56,120,48,33,104,40,96,113,183,247,
191,162,231,167,239,242,186,250,178,175,234,170,226,255);


$t[0] = 51;

$a=29;
@a=(16,0,1,16,16,0,1,0); # *12

$b=69;

$c=168;
@c=(100,100,10,106,4,100,10,10); # *1

for $_ (1..255) {
    $p = $t[$_-1];

    if ($_%4 == 1) {
	$n = $p^64;
    } elsif ($_%4 == 2) {
	$n = $p^72;
    } elsif ($_%16 == 8) {
	$n = $p^72;
    } elsif ($_%16 == 15) {
	$n = $p^$a;
	$a^=$a[($_&0x7f)>>4]*12;
    } elsif ($_%4 == 3) {
	$n = $p^$a;
    } elsif ($_%64 == 44) {
	$n = $p^$b;
	$b^=12;
    } elsif ($_%8 == 4) {
	$n = $p^$b;
    } elsif ($_%16 == 0) {
	$n = $p^$c;
	$c^=$c[($_&0x7f)>>4];
    }

    $t[$_] = $n;
}

for $_ (0..255) {
    print "$_\t$t[$_]\t$tab[$_]\t",$t[$_]-$tab[$_],"\n";
}
