PORTNAME=	glmark2
PORTVERSION=	2021.12
CATEGORIES=	benchmarks

MAINTAINER=	danfe@FreeBSD.org
COMMENT=	Benchmark for OpenGL (ES) 2.0
WWW=		https://launchpad.net/glmark2

LICENSE=	GPLv3

LIB_DEPENDS=	libpng.so:graphics/png

USES=		compiler:c++14-lang gl jpeg localbase:ldflags pkgconfig waf
USE_GL=		egl gl glesv2
USE_GITHUB=	yes
CONFIGURE_ARGS=	--with-flavors=${PLATFORMS:ts,} --no-opt --no-debug

PORTDOCS=	NEWS

OPTIONS_DEFINE=	DOCS
OPTIONS_MULTI=	PLATFORM
OPTIONS_MULTI_PLATFORM=	DRM WAYLAND X11
OPTIONS_DEFAULT=DRM WAYLAND X11
OPTIONS_SUB=	yes

PLATFORM_DESC=		Window systems

DRM_DESC=		KMS console support
DRM_LIB_DEPENDS=	libudev.so:devel/libudev-devd \
			libdrm.so:graphics/libdrm
DRM_USE=		GL=gbm
DRM_VARS=		PLATFORMS+="drm-gl drm-glesv2"

WAYLAND_CATEGORIES=	wayland
WAYLAND_BUILD_DEPENDS=	${LOCALBASE}/include/linux/input.h:devel/evdev-proto \
			wayland-protocols>=1.12:graphics/wayland-protocols
WAYLAND_LIB_DEPENDS=	libwayland-egl.so:graphics/wayland
WAYLAND_VARS=		PLATFORMS+="wayland-gl wayland-glesv2"

X11_USES=		xorg
X11_USE=		XORG=x11
X11_VARS=		PLATFORMS+="x11-gl x11-glesv2"

post-patch:
	@${REINPLACE_CMD} -e "/lib/s/, 'dl'//" ${WRKSRC}/src/wscript_build

post-install-DOCS-on:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
