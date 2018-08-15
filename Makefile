server :   server.o my_rest.o inotify_util.o event_handler.o file_util.o log.o
	g++ -o server server.o my_rest.o inotify_util.o event_handler.o file_util.o log.o -std=c++11 -lboost_system -lcrypto -lssl -lcpprest -lpthread

log.o : log.h log.cpp
	g++ -c log.h log.cpp

my_rest.o : my_rest.cpp my_rest.h
	g++ -c my_rest.cpp my_rest.h -std=c++11 -lboost_system -lcrypto -lssl -lcpprest -lpthread
event_handler.o : event_handler.h event_handler.cpp
	g++ -c event_handler.h event_handler.cpp -std=c++11

inotify_util.o : inotify_util.h inotify_util.cpp
	g++ -c inotify_util.h inotify_util.cpp -std=c++11

file_util.o : file_util.h file_util.cpp
	g++ -c file_util.h file_util.cpp -std=c++11

server.o : server.cpp
	g++ -c server.cpp -std=c++11 -lboost_system -lcrypto -lssl -lcpprest -lpthread

clean :
	rm -f *.o
	rm server
