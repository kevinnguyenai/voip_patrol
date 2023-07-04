// #define PJ_IOQUEUE_MAX_HANDLES 1024
// #define FD_SETSIZE PJ_IOQUEUE_MAX_HANDLES
//
//
//#define PJ_AUTOCONF 1
#define PJ_IOQUEUE_MAX_HANDLES      1024
#define FD_SETSIZE_SETABLE      1
#define __FD_SETSIZE            1024

#define PJSIP_MAX_TRANSPORTS        32
#define PJSIP_MAX_RESOLVED_ADDRESSES    32

#define PJSUA_MAX_ACC       512
#define PJSUA_MAX_CALLS     512
#define PJSUA_MAX_PLAYERS   512

// SRTP
#define PJMEDIA_SRTP_HAS_DTLS           1
// Make send of "100 - Trying" explicit
#define PJSUA_DISABLE_AUTO_SEND_100 1
// ARM
#define PJ_HAS_PENTIUM	0
#define PJ_IS_LITTLE_ENDIAN	1
#define PJ_IS_BIG_ENDIAN	0

/// MACOS_X ARM
//#define PJ_DARWINOS 1
