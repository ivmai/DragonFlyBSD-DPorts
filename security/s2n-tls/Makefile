PORTNAME=	s2n-tls
DISTVERSIONPREFIX=	v
DISTVERSION=	1.3.31
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	security

MAINTAINER=	eduardo@FreeBSD.org
COMMENT=	C99 implementation of the TLS/SSL protocols
WWW=		https://github.com/aws/s2n-tls

LICENSE=	APACHE20
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake:testing ssl

USE_GITHUB=	yes
GH_ACCOUNT=	aws

USE_LDCONFIG=	yes
CMAKE_OFF=	BUILD_TESTING
CMAKE_ON=	BUILD_SHARED_LIBS

# Fix llvm15 build, PR 268413
CFLAGS+=	-Wno-strict-prototypes

SUB_FILES=	pkg-message

OPTIONS_DEFINE=	DOCS EXAMPLES LTO
OPTIONS_DEFINE_x86_64=	ASM
OPTIONS_DEFAULT=	LTO

ASM_DESC=	Enable PQ crypto assembly (reqs AVX2 and BMI2 support)

ASM_CMAKE_OFF=	-DS2N_NO_PQ_ASM=1
LTO_CMAKE_BOOL=	S2N_LTO

.include <bsd.port.options.mk>

.if ${ARCH} != aarch64 && ${ARCH} != x86_64 && ${ARCH} != arm && ${ARCH} != armv6 && ${ARCH} != armv7 && ${ARCH} != i386
CMAKE_ON+=	S2N_NO_PQ
.endif

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${CP} -r ${WRKSRC}/docs/* ${STAGEDIR}${DOCSDIR}
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/bin/*.c ${STAGEDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
