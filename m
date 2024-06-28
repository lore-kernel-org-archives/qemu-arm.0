Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab08d138sm76428566b.158.2024.06.28.05.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:43:11 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 72EE85FA3C;
	Fri, 28 Jun 2024 13:43:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Gustavo Romero <gustavo.romero@linaro.org>
Subject: [PATCH 15/23] gdbstub: Add support for target-specific stubs
Date: Fri, 28 Jun 2024 13:42:50 +0100
Message-Id: <20240628124258.832466-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240628124258.832466-1-alex.bennee@linaro.org>
References: <20240628124258.832466-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: M+51hHmP7EDE

From: Gustavo Romero <gustavo.romero@linaro.org>

Currently, it's not possible to have stubs specific to a given target,
even though there are GDB features which are target-specific, like, for
instance, memory tagging.

This commit introduces gdb_extend_qsupported_features,
gdb_extend_query_table, and gdb_extend_set_table functions as interfaces
to extend the qSupported string, the query handler table, and the set
handler table, allowing target-specific stub implementations.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20240628050850.536447-4-gustavo.romero@linaro.org>
---
 include/gdbstub/commands.h |  22 ++++++++
 gdbstub/gdbstub.c          | 102 ++++++++++++++++++++++++++++++++++---
 2 files changed, 118 insertions(+), 6 deletions(-)

diff --git a/include/gdbstub/commands.h b/include/gdbstub/commands.h
index 639257493e..306dfdef97 100644
--- a/include/gdbstub/commands.h
+++ b/include/gdbstub/commands.h
@@ -69,4 +69,26 @@ typedef struct GdbCmdParseEntry {
  */
 int gdb_put_packet(const char *buf);
 
+/**
+ * gdb_extend_query_table() - Extend query table.
+ * @table: The table with the additional query packet handlers.
+ * @size: The number of handlers to be added.
+ */
+void gdb_extend_query_table(GdbCmdParseEntry *table, int size);
+
+/**
+ * gdb_extend_set_table() - Extend set table.
+ * @table: The table with the additional set packet handlers.
+ * @size: The number of handlers to be added.
+ */
+void gdb_extend_set_table(GdbCmdParseEntry *table, int size);
+
+/**
+ * gdb_extend_qsupported_features() - Extend the qSupported features string.
+ * @qsupported_features: The additional qSupported feature(s) string. The string
+ * should start with a semicolon and, if there are more than one feature, the
+ * features should be separate by a semiocolon.
+ */
+void gdb_extend_qsupported_features(char *qsupported_features);
+
 #endif /* GDBSTUB_COMMANDS_H */
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 9ff2f4177d..b1ca253f97 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -1609,6 +1609,20 @@ static void handle_query_thread_extra(GArray *params, void *user_ctx)
     gdb_put_strbuf();
 }
 
+static char *extended_qsupported_features;
+void gdb_extend_qsupported_features(char *qsupported_features)
+{
+    /*
+     * We don't support different sets of CPU gdb features on different CPUs yet
+     * so assert the feature strings are the same on all CPUs, or is set only
+     * once (1 CPU).
+     */
+    g_assert(extended_qsupported_features == NULL ||
+             g_strcmp0(extended_qsupported_features, qsupported_features) == 0);
+
+    extended_qsupported_features = qsupported_features;
+}
+
 static void handle_query_supported(GArray *params, void *user_ctx)
 {
     CPUClass *cc;
@@ -1648,6 +1662,11 @@ static void handle_query_supported(GArray *params, void *user_ctx)
     }
 
     g_string_append(gdbserver_state.str_buf, ";vContSupported+;multiprocess+");
+
+    if (extended_qsupported_features) {
+        g_string_append(gdbserver_state.str_buf, extended_qsupported_features);
+    }
+
     gdb_put_strbuf();
 }
 
@@ -1729,6 +1748,41 @@ static const GdbCmdParseEntry gdb_gen_query_set_common_table[] = {
     },
 };
 
+/* Compares if a set of command parsers is equal to another set of parsers. */
+static bool cmp_cmds(GdbCmdParseEntry *c, GdbCmdParseEntry *d, int size)
+{
+    for (int i = 0; i < size; i++) {
+        if (!(c[i].handler == d[i].handler &&
+            g_strcmp0(c[i].cmd, d[i].cmd) == 0 &&
+            c[i].cmd_startswith == d[i].cmd_startswith &&
+            g_strcmp0(c[i].schema, d[i].schema) == 0)) {
+
+            /* Sets are different. */
+            return false;
+        }
+    }
+
+    /* Sets are equal, i.e. contain the same command parsers. */
+    return true;
+}
+
+static GdbCmdParseEntry *extended_query_table;
+static int extended_query_table_size;
+void gdb_extend_query_table(GdbCmdParseEntry *table, int size)
+{
+    /*
+     * We don't support different sets of CPU gdb features on different CPUs yet
+     * so assert query table is the same on all CPUs, or is set only once
+     * (1 CPU).
+     */
+    g_assert(extended_query_table == NULL ||
+             (extended_query_table_size == size &&
+              cmp_cmds(extended_query_table, table, size)));
+
+    extended_query_table = table;
+    extended_query_table_size = size;
+}
+
 static const GdbCmdParseEntry gdb_gen_query_table[] = {
     {
         .handler = handle_query_curr_tid,
@@ -1821,6 +1875,22 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
 #endif
 };
 
+static GdbCmdParseEntry *extended_set_table;
+static int extended_set_table_size;
+void gdb_extend_set_table(GdbCmdParseEntry *table, int size)
+{
+    /*
+     * We don't support different sets of CPU gdb features on different CPUs yet
+     * so assert set table is the same on all CPUs, or is set only once (1 CPU).
+     */
+    g_assert(extended_set_table == NULL ||
+             (extended_set_table_size == size &&
+              cmp_cmds(extended_set_table, table, size)));
+
+    extended_set_table = table;
+    extended_set_table_size = size;
+}
+
 static const GdbCmdParseEntry gdb_gen_set_table[] = {
     /* Order is important if has same prefix */
     {
@@ -1859,11 +1929,21 @@ static void handle_gen_query(GArray *params, void *user_ctx)
         return;
     }
 
-    if (!process_string_cmd(gdb_get_cmd_param(params, 0)->data,
-                            gdb_gen_query_table,
-                            ARRAY_SIZE(gdb_gen_query_table))) {
-        gdb_put_packet("");
+    if (process_string_cmd(gdb_get_cmd_param(params, 0)->data,
+                           gdb_gen_query_table,
+                           ARRAY_SIZE(gdb_gen_query_table))) {
+        return;
+    }
+
+    if (extended_query_table &&
+        process_string_cmd(gdb_get_cmd_param(params, 0)->data,
+                           extended_query_table,
+                           extended_query_table_size)) {
+        return;
     }
+
+    /* Can't handle query, return Empty response. */
+    gdb_put_packet("");
 }
 
 static void handle_gen_set(GArray *params, void *user_ctx)
@@ -1878,11 +1958,21 @@ static void handle_gen_set(GArray *params, void *user_ctx)
         return;
     }
 
-    if (!process_string_cmd(gdb_get_cmd_param(params, 0)->data,
+    if (process_string_cmd(gdb_get_cmd_param(params, 0)->data,
                            gdb_gen_set_table,
                            ARRAY_SIZE(gdb_gen_set_table))) {
-        gdb_put_packet("");
+        return;
     }
+
+    if (extended_set_table &&
+        process_string_cmd(gdb_get_cmd_param(params, 0)->data,
+                           extended_set_table,
+                           extended_set_table_size)) {
+        return;
+    }
+
+    /* Can't handle set, return Empty response. */
+    gdb_put_packet("");
 }
 
 static void handle_target_halt(GArray *params, void *user_ctx)
-- 
2.39.2
