PORTNAME=	chart
PORTVERSION=	${PYQTCHART_VERSION}
CATEGORIES=	x11-toolkits devel python
MASTER_SITES=	${MASTER_SITES_PYQTCHART}
PKGNAMEPREFIX=	${PYQT_PY_RELNAME}-
DISTNAME=	${PYQTCHART_DISTNAME}

PYQT_DIST=	yes

MAINTAINER=	kde@FreeBSD.org
COMMENT=	Python bindings for the Qt6 toolkit, QtChart module
WWW=		https://riverbankcomputing.com/software/pyqtchart

LICENSE=	${PYQT6_LICENSE}

LIB_DEPENDS=	libqscintilla2_qt6.so:devel/qscintilla2-qt6

USES=		gl pyqt:6 python:3.8+ qt:6
USE_GL=		gl
USE_PYQT=	sip:build pyqt6 qtbuilder
USE_PYTHON=	concurrent flavors py3kplist
USE_QT=		base charts declarative

.include <bsd.port.mk>
