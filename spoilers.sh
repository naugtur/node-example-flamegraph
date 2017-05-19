
##
 # Try it for yourself first :)
 #
 #
 #
 #      ####   #####    ####      #    #       ######  #####    ####
 #     #       #    #  #    #     #    #       #       #    #  #
 #      ####   #    #  #    #     #    #       #####   #    #   ####
 #          #  #####   #    #     #    #       #       #####        #
 #     #    #  #       #    #     #    #       #       #   #   #    #
 #      ####   #        ####      #    ######  ######  #    #   ####
 #
 #                                              ###
 #       ##    #    #  ######    ##    #####    ###
 #      #  #   #    #  #        #  #   #    #   ###
 #     #    #  ######  #####   #    #  #    #    #
 #     ######  #    #  #       ######  #    #
 #     #    #  #    #  #       #    #  #    #   ###
 #     #    #  #    #  ######  #    #  #####    ###
 #



# Flame graph of a server boot + single request run
# This part can be executed step by step by running:
# bash spoilers.sh
perf record -e cycles:u -g -- node --perf-basic-prof app.js &
sleep 1
curl http://localhost:8080/api/tick
curl http://localhost:8080/api/end
sleep 1
perf script | egrep -v "( __libc_start| LazyCompile | v8::internal::| Builtin:| Stub:| LoadIC:|\[unknown\]| LoadPolymorphicIC:)" | sed 's/ LazyCompile:[*~]\?/ /' > perfs.out
stackvis perf < perfs.out > flamegraph.htm

rm isolate*
rm perf*

echo "open flamegraph.htm"

# End of the executable part
exit 0
## But here's the more interesting part
# Try this manually:

npm start #in one terminal
# open it in the browser
# then in the other terminal
perf record -F99 -p `pgrep -n node` -g -- sleep 3
# perf will collect samples for 3 seconds
perf script | egrep -v "( __libc_start| LazyCompile | v8::internal::| Builtin:| Stub:| LoadIC:|\[unknown\]| LoadPolymorphicIC:)" | sed 's/ LazyCompile:[*~]\?/ /' > perfs.out
stackvis perf < perfs.out > flamegraph.htm
