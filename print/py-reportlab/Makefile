PORTNAME=	reportlab
PORTVERSION=	3.6.12
CATEGORIES=	print python
MASTER_SITES=	CHEESESHOP \
		https://www.reportlab.com/ftp/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		${PFBFER}
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	bofh@FreeBSD.org
COMMENT=	Library to create PDF documents using the Python language
WWW=		https://www.reportlab.com/

LICENSE=	BSD3CLAUSE

RUN_DEPENDS=	${PY_PILLOW}

USES=		cpe python:3.6+
USE_PYTHON=	distutils autoplist

CONFLICTS=	py*-reportlab[^3]-[^3].* \
		py*-reportlab-[^3].*

PFBFER_VERSION=	20180109
PFBFER=		pfbfer-${PFBFER_VERSION}.zip

MAKE_ENV=	PACKAGE_PATH="${REPORTLABDIR}"

REPORTLABDIR=	${PYTHONPREFIX_SITELIBDIR}/reportlab
DOCSDIR=	${PREFIX}/share/doc/${PKGNAMEPREFIX}${PORTNAME}
PORTDOCS=	reportlab-userguide.pdf

OPTIONS_DEFINE=	CJK FREETYPE DOCS
OPTIONS_DEFAULT=CJK FREETYPE
CJK_DESC=	Adobe CMaps
CJK_RUN_DEPENDS=	${LOCALBASE}/share/fonts/adobe-cmaps/ac15/cid2code.txt:print/adobe-cmaps
FREETYPE_LIB_DEPENDS=	libfreetype.so:print/freetype2

post-patch:
	@${REINPLACE_CMD} -e 's|%%DISTDIR%%|${DISTDIR}|' \
			  -e 's|%%PFBFER%%|${PFBFER}|' \
				${WRKSRC}/setup.py

post-patch-DOCS-on:
.for f in genAll.py userguide/genuserguide.py
	@${REINPLACE_CMD} -e 's|%%STAGEDIR%%|${STAGEDIR}|' \
			  -e 's|%%PYTHON_SITELIBDIR%%|${PYTHON_SITELIBDIR}|' \
				${WRKSRC}/docs/${f}
.endfor

post-install:
	${STRIP_CMD} ${STAGEDIR}${PYTHONPREFIX_SITELIBDIR}/reportlab/*/*.so

post-install-DOCS-on:
	@cd ${WRKSRC}/docs && ${PYTHON_CMD} genAll.py
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
.for i in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/docs/${i} ${STAGEDIR}${DOCSDIR}
.endfor

do-test:
	@(cd ${WRKSRC}/tests && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} ./runAll.py)

.include <bsd.port.mk>
