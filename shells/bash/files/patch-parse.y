From Florian Weimer at RedHat for CVE-2014-7186:
http://www.openwall.com/lists/oss-security/2014/09/25/32

--- parse.y.orig	2014-09-30 12:58:08.462512373 -0400
+++ parse.y	2014-09-30 12:58:08.629018000 -0400
@@ -265,9 +265,21 @@
 
 /* Variables to manage the task of reading here documents, because we need to
    defer the reading until after a complete command has been collected. */
-static REDIRECT *redir_stack[10];
+static REDIRECT **redir_stack;
 int need_here_doc;
 
+/* Pushes REDIR onto redir_stack, resizing it as needed. */
+static void
+push_redir_stack (REDIRECT *redir)
+{
+  /* Guard against oveflow. */
+  if (need_here_doc + 1 > INT_MAX / sizeof (*redir_stack))
+    abort ();
+  redir_stack = xrealloc (redir_stack,
+			  (need_here_doc + 1) * sizeof (*redir_stack));
+  redir_stack[need_here_doc++] = redir;
+}
+
 /* Where shell input comes from.  History expansion is performed on each
    line when the shell is interactive. */
 static char *shell_input_line = (char *)NULL;
@@ -520,42 +532,42 @@
 			  source.dest = 0;
 			  redir.filename = $2;
 			  $$ = make_redirection (source, r_reading_until, redir, 0);
-			  redir_stack[need_here_doc++] = $$;
+			  push_redir_stack ($$);
 			}
 	|	NUMBER LESS_LESS WORD
 			{
 			  source.dest = $1;
 			  redir.filename = $3;
 			  $$ = make_redirection (source, r_reading_until, redir, 0);
-			  redir_stack[need_here_doc++] = $$;
+			  push_redir_stack ($$);
 			}
 	|	REDIR_WORD LESS_LESS WORD
 			{
 			  source.filename = $1;
 			  redir.filename = $3;
 			  $$ = make_redirection (source, r_reading_until, redir, REDIR_VARASSIGN);
-			  redir_stack[need_here_doc++] = $$;
+			  push_redir_stack ($$);
 			}
 	|	LESS_LESS_MINUS WORD
 			{
 			  source.dest = 0;
 			  redir.filename = $2;
 			  $$ = make_redirection (source, r_deblank_reading_until, redir, 0);
-			  redir_stack[need_here_doc++] = $$;
+			  push_redir_stack ($$);
 			}
 	|	NUMBER LESS_LESS_MINUS WORD
 			{
 			  source.dest = $1;
 			  redir.filename = $3;
 			  $$ = make_redirection (source, r_deblank_reading_until, redir, 0);
-			  redir_stack[need_here_doc++] = $$;
+			  push_redir_stack ($$);
 			}
 	|	REDIR_WORD  LESS_LESS_MINUS WORD
 			{
 			  source.filename = $1;
 			  redir.filename = $3;
 			  $$ = make_redirection (source, r_deblank_reading_until, redir, REDIR_VARASSIGN);
-			  redir_stack[need_here_doc++] = $$;
+			  push_redir_stack ($$);
 			}
 	|	LESS_LESS_LESS WORD
 			{
@@ -4905,7 +4917,7 @@
     case CASE:
     case SELECT:
     case FOR:
-      if (word_top < MAX_CASE_NEST)
+      if (word_top + 1 < MAX_CASE_NEST)
 	word_top++;
       word_lineno[word_top] = line_number;
       break;
