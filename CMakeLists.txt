cmake_minimum_required(VERSION 3.2)
project(voip_patrol VERSION 1.0.0 LANGUAGES C CXX)

set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_MACOSX_BUNDLE ON)

message("CMAKE_SYSTEM_PROCESSOR:${CMAKE_SYSTEM_PROCESSOR} CMAKE_SYSTEM:${CMAKE_SYSTEM}  CMAKE_BUILD_TYPE:${CMAKE_BUILD_TYPE} OV:${OV}")

set(ROOT_DIR ".")
set(SRC_DIR "${ROOT_DIR}/src")
set(CURL_SRC_DIR "${SRC_DIR}/curl")
set(EZXML_SRC_DIR "${SRC_DIR}/ezxml")
set(VOIP_PATROL_SRC_DIR "${SRC_DIR}/voip_patrol")

set(EZXML_SRCS
	${EZXML_SRC_DIR}/ezxml.c
)
include_directories("${SRC_DIR}")

set(VOIP_PATROL_SRCS_CPP
	${VOIP_PATROL_SRC_DIR}/mod_voip_patrol.cc
	${VOIP_PATROL_SRC_DIR}/voip_patrol.cc
	${VOIP_PATROL_SRC_DIR}/action.cc
	${VOIP_PATROL_SRC_DIR}/check.cc
)

set(VOIP_PATROL_SRCS_C

)

include_directories(${ROOT_DIR}/pjproject/pjmedia/include)
include_directories(${ROOT_DIR}/pjproject/pjsip/include)
include_directories(${ROOT_DIR}/pjproject/pjlib/include)
include_directories(${ROOT_DIR}/pjproject/pjnath/include)
include_directories(${ROOT_DIR}/pjproject/pjlib-util/include)

include_directories(${ROOT_DIR}/include)

set(SOURCE_FILES ${VOIP_PATROL_SRCS_CPP} ${VOIP_PATROL_SRCS_C} ${CURL_SRCS} ${EZXML_SRCS})
message("SOURCE_FILES: ${SOURCE_FILES}")
add_executable(voip_patrol ${SOURCE_FILES})

set(CMAKE_LIBRARY_PATH
	"${ROOT_DIR}/pjproject/pjsip/lib"
	"${ROOT_DIR}/pjproject/pjnath/lib"
	"${ROOT_DIR}/pjproject/pjlib/lib"
	"${ROOT_DIR}/pjproject/pjmedia/lib"
	"${ROOT_DIR}/pjproject/pjlib-util/lib"
	"/opt/homebrew/lib"
	"/usr/local/lib"
	"/opt/homebrew/Cellar/portaudio/19.7.0/lib"
)
set(CMAKE_INCLUDE_PATH
	"${ROOT_DIR}/pjproject/pjsip/include"
	"${ROOT_DIR}/pjproject/pjnath/include"
	"${ROOT_DIR}/pjproject/pjlib/include"
	"${ROOT_DIR}/pjproject/pjmedia/include"
	"${ROOT_DIR}/pjproject/pjlib-util/include"
	"/opt/homebrew/include"
	"/usr/local/include"
	"/opt/homebrew/Cellar/portaudio/19.7.0/include"
)

if(${CMAKE_SYSTEM_NAME} STREQUAL "Darwin") 
	message(">> Darwin")
	find_library(FOUNDATION_LIBRARY Foundation)
	find_library(NETWORK_LIBRARY Network)
	find_library(SECURITY_LIBRARY Security)
	find_library(AUDIOTOOLBOX_LIBRARY AudioToolbox)
	find_library(COREFOUNDATION_LIBRARY CoreFoundation)
	find_library(COREAUDIO_LIBRARY CoreAudio)
	message("NETWORK_LIBRARY: ${NETWORK_LIBRARY} SECURITY_LIBRARY:${SECURITY_LIBRARY} AUDIOTOOLBOX_LIBRARY:${AUDIOTOOLBOX_LIBRARY} COREFOUNDATION_LIBRARY:${COREFOUNDATION_LIBRARY}")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
	set(CMAKE_LIBRARY_PATH
		"${CMAKE_LIBRARY_PATH}"
	)
endif()
message("CMAKE_LIBRARY_PATH:${CMAKE_LIBRARY_PATH}")

## amd64
if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux") 
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -g")
## arm64
elseif(${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -g")
endif()

message("CMAKE_CXX_FLAGS:${CMAKE_CXX_FLAGS}")
execute_process(COMMAND "./pjproject/config.guess" OUTPUT_VARIABLE AC_SYSTEM)
message("$CMAKE_SYSTEM:${CMAKE_SYSTEM} AC_SYSTEM:${AC_SYSTEM}")
## amd64
if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux") 
	string(STRIP "${AC_SYSTEM}" AC_SYSTEM)
	target_link_libraries(voip_patrol
		pjsua2-${AC_SYSTEM}
		stdc++
		pjsua-${AC_SYSTEM}
		pjsip-ua-${AC_SYSTEM}
		pjsip-simple-${AC_SYSTEM}
		pjsip-${AC_SYSTEM}
		pjmedia-codec-${AC_SYSTEM}
		pjmedia-${AC_SYSTEM}
		pjmedia-videodev-${AC_SYSTEM}
		pjmedia-audiodev-${AC_SYSTEM}
		pjmedia-${AC_SYSTEM}
		pjnath-${AC_SYSTEM}
		pjlib-util-${AC_SYSTEM}
		srtp-${AC_SYSTEM}
		resample-${AC_SYSTEM}
		gsmcodec-${AC_SYSTEM}
		speex-${AC_SYSTEM}
		ilbccodec-${AC_SYSTEM}
		g7221codec-${AC_SYSTEM}
		pj-${AC_SYSTEM}
		pthread
		curl
		m
		asound
		ssl
		-std=c++17
	)
## arm64
elseif(${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
  message(">> Darwin")
	string(STRIP "arm-apple-darwin" AC_SYSTEM)
	target_link_libraries(voip_patrol
	  ${FOUNDATION_LIBRARY}
		${NETWORK_LIBRARY}
		${SECURITY_LIBRARY}
		${AUDIOTOOLBOX_LIBRARY}
		${COREAUDIO_LIBRARY}
		${COREFOUNDATION_LIBRARY}
		pjsua2-${AC_SYSTEM}
		stdc++
		pjsua-${AC_SYSTEM}
		pjsip-ua-${AC_SYSTEM}
		pjsip-simple-${AC_SYSTEM}
		pjsip-${AC_SYSTEM}
		pjmedia-codec-${AC_SYSTEM}
		pjmedia-${AC_SYSTEM}
		pjmedia-videodev-${AC_SYSTEM}
		pjmedia-audiodev-${AC_SYSTEM}
		pjmedia-${AC_SYSTEM}
		pjnath-${AC_SYSTEM}
		pjlib-util-${AC_SYSTEM}
		srtp-${AC_SYSTEM}
		resample-${AC_SYSTEM}
		gsmcodec-${AC_SYSTEM}
		speex-${AC_SYSTEM}
		ilbccodec-${AC_SYSTEM}
		g7221codec-${AC_SYSTEM}
		pj-${AC_SYSTEM}
		pthread
		curl
		m
		portaudio
		ssl
		-std=c++17
	)
endif()


find_package(PkgConfig REQUIRED)
pkg_search_module(OPENSSL openssl)
if( OPENSSL_FOUND )
	message(">> openssl found")
	target_link_libraries(voip_patrol ssl crypto)
else()
	message(">> openssl not found")
endif()

pkg_search_module(OPUS opus)
if( OPUS_FOUND )
	message(">> opus found")
	target_link_libraries(voip_patrol opus)
else()
	message(">> opus not found")
endif()

pkg_search_module(UUID uuid)
if( UUID_FOUND )
	 message(">> uuid found")
	target_link_libraries(voip_patrol uuid)
else()
	message(">> uuid not found")
endif()
