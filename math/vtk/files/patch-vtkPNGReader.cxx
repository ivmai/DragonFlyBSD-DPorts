--- IO/vtkPNGReader.cxx.orig	2012-05-06 13:44:56.000000000 +0200
+++ IO/vtkPNGReader.cxx	2012-05-06 13:46:04.000000000 +0200
@@ -101,7 +101,7 @@
   // minimum of a byte per pixel
   if (color_type == PNG_COLOR_TYPE_GRAY && bit_depth < 8) 
     {
-    png_set_gray_1_2_4_to_8(png_ptr);
+    png_set_expand_gray_1_2_4_to_8(png_ptr);
     }
 
   // add alpha if any alpha found
@@ -200,7 +200,7 @@
   // minimum of a byte per pixel
   if (color_type == PNG_COLOR_TYPE_GRAY && bit_depth < 8) 
     {
-    png_set_gray_1_2_4_to_8(png_ptr);
+    png_set_expand_gray_1_2_4_to_8(png_ptr);
     }
 
   // add alpha if any alpha found
