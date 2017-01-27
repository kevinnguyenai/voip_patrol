# VoIP Patrol

## VoIP signaling and media test automaton

### debian dependencies
```
 apt-get install build-essential
 apt-get install libcurl4-openssl-dev
 apt-get install cmake
```
### build pjsua
```
 git submodule update --init
 cd pjsua && ./configure
 make dep && make
 cd ..
```

### buil voip_patrol
```
 cmake CMakeLists.txt 
 make
```

### run
```
 ./voip_patrol
 -c,--conf <conf.xml> 
 -l,--log <test.log>
```
### sources
```
src/
├── curl
│   ├── email.c
│   └── email.h
├── ezxml
│   ├── changelog.txt
│   ├── ezxml.c
│   ├── ezxml.h
│   ├── ezxml.html
│   ├── ezxml.txt
│   └── license.txt
├── PESQ
│   ├── dsp.c
│   ├── dsp.h
│   ├── dsp.o
│   ├── Makefile
│   ├── pesqdsp.c
│   ├── pesqdsp.o
│   ├── pesq.h
│   ├── pesqio.c
│   ├── pesqio.o
│   ├── pesqmain.c
│   ├── pesqmain.o
│   ├── pesqmod.c
│   ├── pesqmod.o
│   ├── pesqpar.h
│   ├── pesq_results.txt
│   └── run_pesq
└── voip_patrol
    ├── patrol_pesq.c
    ├── patrol_pesq.h
    ├── voip_patrol.cpp
    └── voip_patrol.hh
```

#### xml parser integration
```
 pjsip-apps/src/samples/voip_patrol/ezxml
```

#### congfig test plan example
```xml
<?xml version="1.0"?>
<config>
	<actions>
		<action type="register" expected_cause_code="200" username="666" password="DNV9J1xUU" registrar="sip.server.net"/>
		<action type="register" expected_cause_code="200" username="777" password="SMOF0qFRA" registrar="sip.server.net"/>
		<action type="register" expected_cause_code="403" username="555" password="SMOF0qFRA" registrar="sip.server.net"/>
		<action type="register" expected_cause_code="204" username="555" password="SMOF0qFRA" registrar="sip.server.net"/>
		<action type="wait"/>
		<action type="call" expected_cause_code="404" caller="666@sip.server.net" callee="555@sip.server.net" duration=10/>
		<action type="call" expected_cause_code="200" caller="666@sip.server.net" callee="777@sip.server.net" duration=10/>
	</actions>
</config>
```

#### PESQ
```
./run_pesq +16000 voice_files/reference.wav voice_files/recording.wav
```
