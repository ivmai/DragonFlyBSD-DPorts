PORTNAME=	tinyaes
PORTVERSION=	1.0.4
CATEGORIES=	security python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Tiny-AES-c wrapper in Python
WWW=		https://github.com/naufraghi/tinyaes-py

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		python:3.7+
USE_PYTHON=	autoplist concurrent cython distutils

post-install:
	${FIND} ${STAGEDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
