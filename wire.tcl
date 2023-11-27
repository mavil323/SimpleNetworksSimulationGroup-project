#Create a simulator object
set ns [new Simulator]

#Set the number of nodes and the simulation time
set num_node 5 set sim_time 10

#Open the trace file and the nam file
set trace_file [open out.tr w] 
$ns trace-all $trace_file 
set nam_file [open out.nam w] 
$ns namtrace-all $nam_file

#Define a procedure to end the simulation
proc finish {} { 
global ns trace_file nam_file 
$ns flush-trace close $trace_file 
close $nam_file 
exec nam out.nam
exit 0 }

#Create the nodes
for {set i 0} {$i < $num_node} {incr i} { set node($i) [$ns node] }

#Create random links between the nodes
for {set i 0} {$i < $num_node} {incr i} { set src [expr int(rand()$num_node)] set dst $src while {$dst == $src} { set dst [expr int(rand()$num_node)] } $ns duplex-link $node($src) $node($dst) 1.5Mb 10ms DropTail }

#Assign random positions to the nodes
for {set i 0} {$i < $numnode} {incr i} { set x [expr int(rand()500)] set y [expr int(rand()500)] $node($i) set X $x $node($i) set Y $y $node($i) set Z 0.0 }

#Create a UDP agent and attach it to node 0
set udp [new Agent/UDP] 
$ns attach-agent 
$node(0) $udp

#Create a CBR traffic source and attach it to the UDP agent
set cbr [new Application/Traffic/CBR] 
$cbr attach-agent $udp 
$cbr set packetSize 500 
$cbr set interval 0.005

#Create a Null agent and attach it to node 5
set null [new Agent/Null] 
$ns attach-agent $node(5) $null

#Connect the UDP agent to the Null agent
$ns connect $udp $null

#Start the CBR traffic at time 1.0
$ns at 1.0 “$cbr start”

#Stop the CBR traffic at time 9.0
$ns at 9.0 “$cbr stop”

#Call the finish procedure at time 10.0
$ns at 10.0 “finish”

$ns run
