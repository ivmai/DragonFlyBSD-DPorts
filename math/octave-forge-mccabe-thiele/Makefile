PORTNAME=	octave-forge-mccabe-thiele
DISTVERSIONPREFIX=	v
DISTVERSION=	0.1.5
CATEGORIES=	math

MAINTAINER=	stephen@FreeBSD.org
COMMENT=	Octave-forge package ${OCTAVE_PKGNAME}
WWW=		https://packages.octave.org/

LICENSE=	GPLv3
LICENSE_FILE=	${WRKDIR}/${OCTAVE_SRC}/COPYING

RUN_DEPENDS=	${OCTAVE_TARBALLS_DIR}/sockets.tar.gz:math/octave-forge-sockets

USES=		octave
USE_GITHUB=	yes
GH_ACCOUNT=	aumpierre-unb
GH_PROJECT=	McCabe-Thiele-for-GNU-Octave

OCTAVE_SRC=		${GH_PROJECT}-${DISTVERSION}

NO_ARCH=	yes
NO_BUILD=	yes

.include <bsd.port.mk>
