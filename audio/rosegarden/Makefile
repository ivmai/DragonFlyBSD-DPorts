PORTNAME=	rosegarden
DISTVERSION=	22.06
CATEGORIES=	audio
MASTER_SITES=	SF

MAINTAINER=	adridg@FreeBSD.org
COMMENT=	General purpose music editor and sequencer suite
WWW=		https://www.rosegardenmusic.com/

LICENSE=	GPLv2+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	dssi_osc_update:audio/dssi \
		${LOCALBASE}/include/fftw3.h:math/fftw3
LIB_DEPENDS=	libasound.so:audio/alsa-lib \
		libfftw3f.so:math/fftw3-float \
		liblrdf.so:textproc/liblrdf \
		liblo.so:audio/liblo \
		libsamplerate.so:audio/libsamplerate \
		libsndfile.so:audio/libsndfile \
		libjack.so:audio/jack
RUN_DEPENDS=	dssi_osc_update:audio/dssi \
		flac:audio/flac \
		wavpack:audio/wavpack \
		xdg-open:devel/xdg-utils \
		lilypond:print/lilypond

USES=		alias cmake compiler:c++11-lib desktop-file-utils \
		localbase:ldflags pkgconfig shared-mime-info tar:bzip2 \
		qt:5 xorg
USE_QT=		core gui network printsupport testlib widgets xml \
		buildtools:build linguisttools:build qmake:build
USE_XORG=	ice sm x11 xext

OPTIONS_DEFINE=		LIRC

LIRC_LIB_DEPENDS=	liblirc_client.so:comms/lirc
LIRC_CMAKE_ON=		-DENABLE_LIRC:BOOL=ON

.include <bsd.port.mk>
