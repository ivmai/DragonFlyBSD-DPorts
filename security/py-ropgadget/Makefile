PORTNAME=	ropgadget
PORTVERSION=	7.2
CATEGORIES=	security python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	ROPGadget-${PORTVERSION}

MAINTAINER=	ehaupt@FreeBSD.org
COMMENT=	Tool to search gadgets to facilitate ROP exploitation
WWW=		https://pypi.org/project/ropgadget/

LICENSE=	BSD3CLAUSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}capstone>=4.0.1:devel/py-capstone@${PY_FLAVOR}

USES=		python:3.6+
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes

.include <bsd.port.mk>
