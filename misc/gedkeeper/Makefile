PORTNAME=	gedkeeper
PORTVERSION=	2.22.0
DISTVERSIONPREFIX=	v
CATEGORIES=	misc

MAINTAINER=	danfe@FreeBSD.org
COMMENT=	Personal genealogical database editor
WWW=		http://gedkeeper.net/

LICENSE=	GPLv3+

BUILD_DEPENDS=	msbuild:devel/msbuild
LIB_DEPENDS=	libgdiplus.so:x11-toolkits/libgdiplus

USES=		desktop-file-utils mono shared-mime-info
USE_GITHUB=	yes
GH_ACCOUNT=	Serg-Norseman
GH_PROJECT=	GEDKeeper GKCommunicator:gkc
GH_TAGNAME=	4757bf3:gkc
GH_SUBDIR=	projects/GKCommunicator:gkc

_BUILD_TYPE=	Release
DATADIR=	${PREFIX}/lib/${PORTNAME}

post-patch:
	@${REINPLACE_CMD} -e '/{70BD5213-9A14-4E76-906D-8FE1633ADB3E}/d' \
		${WRKSRC}/projects/GEDKeeper2.linux.sln
	@${REINPLACE_CMD} -e '/Reference Include/s,System\.XML,System.Xml,' \
		${WRKSRC}/projects/GKCommunicator/GKNetCore/GKNetCore.csproj

do-build:
	cd ${BUILD_WRKSRC} && msbuild projects/GEDKeeper2.linux.sln \
		/p:Configuration=${_BUILD_TYPE} /p:Platform="x86" \
		/p:MonoCS=true # /p:TargetFrameworkVersion=v4.5

do-install:
	${PRINTF} '#!/bin/sh\n\nexec mono ${DATADIR}/GEDKeeper2.exe\
		"$$@"\n' > ${STAGEDIR}${PREFIX}/bin/${PORTNAME}
	${CHMOD} +x ${STAGEDIR}${PREFIX}/bin/${PORTNAME}
	@${MKDIR} ${STAGEDIR}${DATADIR}
	cd ${INSTALL_WRKSRC} && ${CP} -a bin/ \
		locales plugins samples scripts ${STAGEDIR}${DATADIR}
	@${RM} ${STAGEDIR}${DATADIR}/scripts/readme.txt
	${INSTALL_DATA} ${INSTALL_WRKSRC}/deploy/gedkeeper.desktop \
		${STAGEDIR}${PREFIX}/share/applications/
	${INSTALL_DATA} ${INSTALL_WRKSRC}/deploy/gedkeeper.png \
		${STAGEDIR}${PREFIX}/share/pixmaps
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/mime/packages
	${INSTALL_DATA} ${INSTALL_WRKSRC}/deploy/application-x-gedkeeper.xml \
		${STAGEDIR}${PREFIX}/share/mime/packages
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/metainfo
	${INSTALL_DATA} ${INSTALL_WRKSRC}/deploy/gedkeeper.appdata.xml \
		${STAGEDIR}${PREFIX}/share/metainfo

do-test:
	cd ${TEST_WRKSRC} && TEMP=/tmp nunit-console \
		projects/GKTests/bin/${_BUILD_TYPE}/GKTests.dll

.include <bsd.port.mk>
