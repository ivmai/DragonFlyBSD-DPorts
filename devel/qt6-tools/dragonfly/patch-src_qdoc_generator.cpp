--- src/qdoc/generator.cpp.orig	2022-12-12 17:11:50 UTC
+++ src/qdoc/generator.cpp
@@ -999,11 +999,11 @@ void Generator::generateFileList(const E
         auto maybe_resolved_file{file_resolver.resolve(path)};
         if (!maybe_resolved_file) {
             // TODO: [uncentralized-admonition][failed-resolve-file]
-            QString details = std::transform_reduce(
+            QString details = transform_reduce(
                 file_resolver.get_search_directories().cbegin(),
                 file_resolver.get_search_directories().cend(),
                 u"Searched directories:"_qs,
-                std::plus(),
+                std::plus<>(),
                 [](const DirectoryPath& directory_path){ return " " + directory_path.value(); }
             );
 
