
$FreeBSD: head/graphics/xmorph/files/patch-libmorph_my__malloc.c 340725 2014-01-22 17:40:44Z mat $

--- libmorph/my_malloc.c.orig	Sat Jun  7 16:35:29 2003
+++ libmorph/my_malloc.c	Sat Jun  7 16:35:43 2003
@@ -34,7 +34,7 @@
 
 #if defined(apollo) || defined(__CYGWIN32__)
 #else
-#include <malloc.h>
+#include <stdlib.h>
 #endif
 
 
