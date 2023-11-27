
# ======================================================================
# Define 
# ======================================================================
set val(chan)         Channel/WirelessChannel;	# channel type
set val(prop)         Propagation/TwoRayGround;	# radio-propagation model
set val(netif)         Phy/WirelessPhy;		# network interface type
set val(mac)          Mac/802_11;			# MAC type
set val(ifq)            Queue/DropTail/PriQueue;	# interface queue type
set val(ll)               LL;			# link layer type
set val(ant)           Antenna/OmniAntenna;		# antenna model
set val(ifqlen)       80;			# max packet in ifq
set val(nn)            10;				# number of mobilenodes
set val(rp)             AODV;			# routing protocol
set val(x)	            1000
set val(y)	            1000

# Initialize Global Variables
#creation of simulator
set ns	[new Simulator]

#Initialize colors
$ns color 1 Pink
$ns color 2 Red


#creation of TRace And namfile
set tracefile [open wireless.tr w]
$ns trace-all $tracefile

# set up topography 
set topo [new Topography]
$topo load_flatgrid $val(x) $val(y)

#
# Create God
#
create-god $val(nn)

#creating channels 
set channel1 [new $val(chan)]
set channel2 [new $val(chan)]


# configure node
$ns node-config -adhocRouting $val(rp) \
		-llType $val(ll) \
		-macType $val(mac) \
		-ifqType $val(ifq) \
		-ifqLen $val(ifqlen) \
		-antType $val(ant) \
		-propType $val(prop) \
		-phyType $val(netif) \
		-topoInstance $topo \
		-agentTrace ON \
		-routerTrace ON \
		-macTrace OFF \
		-movementTrace ON \
		-channel $channel1 


# create nodes
set n0 [$ns node]
# Initial color of the node
$n0 color pink

#Location fixing for a single node
$n0 set X_ 300
$n0 set Y_ 400
$n0 set Z_ 0

set n1 [$ns node]
$n1 color pink

$n1 set X_ 200
$n1 set Y_ 200
$n1 set Z_ 0

set n2 [$ns node]
$n2 color pink

$n2 set X_ 100
$n2 set Y_ 300
$n2 set Z_ 0


set n3 [$ns node]
# Initial color of the node
$n3 color red

#Location fixing for a single node
$n3 set X_ 100
$n3 set Y_ 400
$n3 set Z_ 0

set n4 [$ns node]
$n4 color pink

$n4 set X_ 100
$n4 set Y_ 500
$n4 set Z_ 0

set n5 [$ns node]
# color of the node
$n5 color red

#Location fixing 
$n5 set X_ 300
$n5 set Y_ 100
$n5 set Z_ 0

set n6 [$ns node]
$n6 color pink

$n6 set X_ 500
$n6 set Y_ 400
$n6 set Z_ 0

set n7 [$ns node]
$n7 color pink

$n7 set X_ 300
$n7 set Y_ 200
$n7 set Z_ 0

set n8 [$ns node]
# Initial color of the node
$n8 color red

$n8 set X_ 300
$n8 set Y_ 700
$n8 set Z_ 0

set n9 [$ns node]
$n9 color pink

$n9 set X_ 400
$n9 set Y_ 500
$n9 set Z_ 0

set n10 [$ns node]
# Initial color of the node
$n10 color pink

#Location fixing 
$n10 set X_ 400
$n10 set Y_ 400
$n10 set Z_ 0

set n11 [$ns node]
$n11 color pink

$n11 set X_ 200
$n11 set Y_ 200
$n11 set Z_ 0

set n12 [$ns node]
$n12 color pink

$n12 set X_ 100
$n12 set Y_ 300
$n12 set Z_ 0


set n13 [$ns node]
# Initial color of the node
$n13 color red

#Location fixing 
$n13 set X_ 100
$n13 set Y_ 400
$n13 set Z_ 0

set n14 [$ns node]
$n14 color pink

$n14 set X_ 100
$n14 set Y_ 500
$n14 set Z_ 0

set n15 [$ns node]
# Initial color of the node
$n15 color red

#Location fixing 
$n15 set X_ 200
$n15 set Y_ 100
$n15 set Z_ 0

set n6 [$ns node]
$n16 color pink

$n16 set X_ 500
$n16 set Y_ 400
$n16 set Z_ 0

set n17 [$ns node]
$n17 color pink

$n17 set X_ 400
$n17 set Y_ 250
$n17 set Z_ 0

set n18 [$ns node]
# Initial color of the node
$n18 color red

#Location fixing 
$n18 set X_ 300
$n18 set Y_ 700
$n18 set Z_ 0

set n19 [$ns node]
$n19 color black

$n19 set X_ 600
$n19 set Y_ 500
$n19 set Z_ 0

$n0 random-motion 0
$n1 random-motion 0
$n2 random-motion 0
$n3 random-motion 0
$n4 random-motion 0
$n5 random-motion 0
$n6 random-motion 0
$n7 random-motion 0
$n8 random-motion 0
$n9 random-motion 0
$n10 random-motion 0
$n11 random-motion 0
$n12 random-motion 0
$n13 random-motion 0
$n14 random-motion 0
$n15 random-motion 0
$n16 random-motion 0
$n17 random-motion 0
$n18 random-motion 0
$n19 random-motion 0

#size of nodes
$ns initial_node_pos $n0 80
$ns initial_node_pos $n1 80
$ns initial_node_pos $n2 80
$ns initial_node_pos $n3 80
$ns initial_node_pos $n4 80
$ns initial_node_pos $n5 80
$ns initial_node_pos $n6 80
$ns initial_node_pos $n7 80
$ns initial_node_pos $n8 80
$ns initial_node_pos $n9 80
$ns initial_node_pos $n10 80
$ns initial_node_pos $n11 80
$ns initial_node_pos $n12 80
$ns initial_node_pos $n13 80
$ns initial_node_pos $n14 80
$ns initial_node_pos $n15 80
$ns initial_node_pos $n16 80
$ns initial_node_pos $n17 80
$ns initial_node_pos $n18 80
$ns initial_node_pos $n19 80

#creation of agents
set tcp [new Agent/TCP]
set sink [new Agent/TCPSink]
$ns attach-agent $n0 $tcp
$ns attach-agent $n19 $sink
$ns connect $tcp $sink

set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start" 

set udp [new Agent/UDP]
set null [new Agent/Null]
$ns attach-agent $n1 $udp
$ns attach-agent $n1 $null
$ns connect $udp $null

set cbr [new Application/Traffic/CBR]
$cbr attach-agent $udp
$ns at 1.0 "$cbr start"

$ns at 100.0 "done"

# Finish process
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam wireless.nam &
    exec awk -f throughput.awk wireless.tr > wireless1 &
    exit 0
}

puts "Start! "
$ns run

