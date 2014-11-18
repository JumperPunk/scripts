#This script should not be execute across groups having more than 20 APs provisioned#
#Logging Levels for Client Match
#INSTRUCTION: MUST TURN ON DEBUG PRIOR TO SCRIPT EXECUTION
#config t logging level debugging arm subcat client-match
#Controller Config#
0,show clock
0,show running-config
#Client State#
5m,show ap arm client-match history | include TOR-2150AP0
5m,show ap association | include TOR-2150AP0
5m,show ap remote debug mgmt-frames ap-name ${apname}
5m,show ap remote debug association ap-name ${apname}
5m,show ap bss-table ap-name ${apname}
5m,show ap active ap-name ${apname}
5m,show ap debug client-table ap-name ${apname} 
5m,show ap debug gre-tun-stats ap-name ${apname}
#RF ARM
#skipped 10m,show ap arm state ap-name ${apname}
10m,show ap arm rf-summary ap-name ${apname}
10m,show ap arm history ap-name ${apname}
#client Match
5m,show ap arm virtual-beacon-report ap-name ${apname}
5m,show ap virtual-beacon-report client-mac #{show user-table ap-name ${apname},,MAC}
5m,show ap arm client-match probe-report ap-name ${apname}
5m,show ap arm client-match restriction-table ap-name ${apname}
10m,show ap arm client-match neighbors ap-name ${apname}
10m,show ap arm client-match unsupported | include #{show user-table ap-name ${apname},,MAC}
10m,show ap client trail-info #{show user-table ap-name ${apname},,MAC}
#skipped 10m,show ap arm client-match summary advanced
10m,show ap arm client-match summary client-mac #{show user-table ap-name ${apname},,MAC}
10m,show ap arm client-match history client-mac #{show user-table ap-name ${apname},,MAC}
#AP stats
10m,show ap debug system-status ap-name ${apname}
10m,show ap debug crash-info ap-name ${apname}
10m,show ap debug driver-log ap-name ${apname}
10m,show ap debug radio-stats ap-name ${apname} radio 0 advanced
10m,show ap debug radio-stats ap-name ${apname} radio 1 advanced
10m,show ap debug log ap-name ${apname}
#RadioBusy #
1m;2;10m,show ap radio-summary ap-name ${apname}
#Displaying Log and Capturing Output#
11m,show log arm all
#INSTRUCTION: Please return the logging level and remove debugs##
#config t no logging level debugging arm subcat client-match
#end of command file...