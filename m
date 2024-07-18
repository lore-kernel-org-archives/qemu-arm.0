Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5a3650sm552863666b.17.2024.07.18.02.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:45:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 48E5C5FA10;
	Thu, 18 Jul 2024 10:45:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Thomas Huth <thuth@redhat.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-riscv@nongnu.org,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Beraldo Leal <bleal@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Ed Maste <emaste@freebsd.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Gustavo Bueno Romero <gustavo.romero@linaro.org>
Subject: [PATCH 03/15] gdbstub: Re-factor gdb command extensions
Date: Thu, 18 Jul 2024 10:45:11 +0100
Message-Id: <20240718094523.1198645-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718094523.1198645-1-alex.bennee@linaro.org>
References: <20240718094523.1198645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: uMPCF82UOcHF

Coverity reported a memory leak (CID 1549757) in this code and its
admittedly rather clumsy handling of extending the command table.
Instead of handing over a full array of the commands lets use the
lighter weight GPtrArray and simply test for the presence of each
entry as we go. This avoids complications of transferring ownership of
arrays and keeps the final command entries as static entries in the
target code.

Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Gustavo Bueno Romero <gustavo.romero@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>

---
v2
  - don't use strrstr, instead maintain a strv array
  - process the array later when building the query response
  - shorten names to hit line length limit
---
 include/gdbstub/commands.h |  19 +++--
 target/arm/internals.h     |   4 +-
 gdbstub/gdbstub.c          | 142 +++++++++++++++++++++----------------
 target/arm/gdbstub.c       |  16 ++---
 target/arm/gdbstub64.c     |  11 ++-
 5 files changed, 106 insertions(+), 86 deletions(-)

diff --git a/include/gdbstub/commands.h b/include/gdbstub/commands.h
index f3058f9dda..40f0514fe9 100644
--- a/include/gdbstub/commands.h
+++ b/include/gdbstub/commands.h
@@ -74,23 +74,28 @@ int gdb_put_packet(const char *buf);
 
 /**
  * gdb_extend_query_table() - Extend query table.
- * @table: The table with the additional query packet handlers.
- * @size: The number of handlers to be added.
+ * @table: GPtrArray of GdbCmdParseEntry entries.
+ *
+ * The caller should free @table afterwards
  */
-void gdb_extend_query_table(GdbCmdParseEntry *table, int size);
+void gdb_extend_query_table(GPtrArray *table);
 
 /**
  * gdb_extend_set_table() - Extend set table.
- * @table: The table with the additional set packet handlers.
- * @size: The number of handlers to be added.
+ * @table: GPtrArray of GdbCmdParseEntry entries.
+ *
+ * The caller should free @table afterwards
  */
-void gdb_extend_set_table(GdbCmdParseEntry *table, int size);
+void gdb_extend_set_table(GPtrArray *table);
 
 /**
  * gdb_extend_qsupported_features() - Extend the qSupported features string.
  * @qsupported_features: The additional qSupported feature(s) string. The string
  * should start with a semicolon and, if there are more than one feature, the
- * features should be separate by a semiocolon.
+ * features should be separate by a semicolon.
+ *
+ * The caller should free @qsupported_features afterwards if
+ * dynamically allocated.
  */
 void gdb_extend_qsupported_features(char *qsupported_features);
 
diff --git a/target/arm/internals.h b/target/arm/internals.h
index da22d04121..757b1fae92 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -359,8 +359,8 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
 void arm_translate_init(void);
 
 void arm_cpu_register_gdb_commands(ARMCPU *cpu);
-void aarch64_cpu_register_gdb_commands(ARMCPU *cpu, GString *, GArray *,
-                                       GArray *);
+void aarch64_cpu_register_gdb_commands(ARMCPU *cpu, GString *,
+                                       GPtrArray *, GPtrArray *);
 
 void arm_restore_state_to_opc(CPUState *cs,
                               const TranslationBlock *tb,
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index b9ad0a063e..104398f922 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -1614,18 +1614,21 @@ static void handle_query_thread_extra(GArray *params, void *user_ctx)
     gdb_put_strbuf();
 }
 
-static char *extended_qsupported_features;
-void gdb_extend_qsupported_features(char *qsupported_features)
-{
-    /*
-     * We don't support different sets of CPU gdb features on different CPUs yet
-     * so assert the feature strings are the same on all CPUs, or is set only
-     * once (1 CPU).
-     */
-    g_assert(extended_qsupported_features == NULL ||
-             g_strcmp0(extended_qsupported_features, qsupported_features) == 0);
 
-    extended_qsupported_features = qsupported_features;
+static char **extra_query_flags;
+
+void gdb_extend_qsupported_features(char *qflags)
+{
+    if (!extra_query_flags) {
+        extra_query_flags = g_new0(char *, 2);
+        extra_query_flags[0] = g_strdup(qflags);
+    } else if (!g_strv_contains((const gchar * const *) extra_query_flags,
+                                qflags)) {
+        int len = g_strv_length(extra_query_flags);
+        extra_query_flags = g_realloc_n(extra_query_flags, len + 2,
+                                        sizeof(char *));
+        extra_query_flags[len] = g_strdup(qflags);
+    }
 }
 
 static void handle_query_supported(GArray *params, void *user_ctx)
@@ -1668,8 +1671,11 @@ static void handle_query_supported(GArray *params, void *user_ctx)
 
     g_string_append(gdbserver_state.str_buf, ";vContSupported+;multiprocess+");
 
-    if (extended_qsupported_features) {
-        g_string_append(gdbserver_state.str_buf, extended_qsupported_features);
+    if (extra_query_flags) {
+        int extras = g_strv_length(extra_query_flags);
+        for (int i = 0; i < extras; i++) {
+            g_string_append(gdbserver_state.str_buf, extra_query_flags[i]);
+        }
     }
 
     gdb_put_strbuf();
@@ -1753,39 +1759,59 @@ static const GdbCmdParseEntry gdb_gen_query_set_common_table[] = {
     },
 };
 
-/* Compares if a set of command parsers is equal to another set of parsers. */
-static bool cmp_cmds(GdbCmdParseEntry *c, GdbCmdParseEntry *d, int size)
+/**
+ * extend_table() - extend one of the command tables
+ * @table: the command table to extend (or NULL)
+ * @extensions: a list of GdbCmdParseEntry pointers
+ *
+ * The entries themselves should be pointers to static const
+ * GdbCmdParseEntry entries. If the entry is already in the table we
+ * skip adding it again.
+ *
+ * Returns (a potentially freshly allocated) GPtrArray of GdbCmdParseEntry
+ */
+static GPtrArray * extend_table(GPtrArray *table, GPtrArray *extensions)
 {
-    for (int i = 0; i < size; i++) {
-        if (!(c[i].handler == d[i].handler &&
-            g_strcmp0(c[i].cmd, d[i].cmd) == 0 &&
-            c[i].cmd_startswith == d[i].cmd_startswith &&
-            g_strcmp0(c[i].schema, d[i].schema) == 0)) {
+    if (!table) {
+        table = g_ptr_array_new();
+    }
+
 
-            /* Sets are different. */
-            return false;
+    for (int i = 0; i < extensions->len; i++) {
+        gpointer entry = g_ptr_array_index(extensions, i);
+        if (!g_ptr_array_find(table, entry, NULL)) {
+            g_ptr_array_add(table, entry);
         }
     }
 
-    /* Sets are equal, i.e. contain the same command parsers. */
-    return true;
+    return table;
 }
 
-static GdbCmdParseEntry *extended_query_table;
-static int extended_query_table_size;
-void gdb_extend_query_table(GdbCmdParseEntry *table, int size)
+/**
+ * process_extended_table() - run through an extended command table
+ * @table: the command table to check
+ * @data: parameters
+ *
+ * returns true if the command was found and executed
+ */
+static bool process_extended_table(GPtrArray *table, const char *data)
 {
-    /*
-     * We don't support different sets of CPU gdb features on different CPUs yet
-     * so assert query table is the same on all CPUs, or is set only once
-     * (1 CPU).
-     */
-    g_assert(extended_query_table == NULL ||
-             (extended_query_table_size == size &&
-              cmp_cmds(extended_query_table, table, size)));
+    for (int i = 0; i < table->len; i++) {
+        const GdbCmdParseEntry *entry = g_ptr_array_index(table, i);
+        if (process_string_cmd(data, entry, 1)) {
+            return true;
+        }
+    }
+    return false;
+}
+
 
-    extended_query_table = table;
-    extended_query_table_size = size;
+/* Ptr to GdbCmdParseEntry */
+static GPtrArray *extended_query_table;
+
+void gdb_extend_query_table(GPtrArray *new_queries)
+{
+    extended_query_table = extend_table(extended_query_table, new_queries);
 }
 
 static const GdbCmdParseEntry gdb_gen_query_table[] = {
@@ -1880,20 +1906,12 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
 #endif
 };
 
-static GdbCmdParseEntry *extended_set_table;
-static int extended_set_table_size;
-void gdb_extend_set_table(GdbCmdParseEntry *table, int size)
-{
-    /*
-     * We don't support different sets of CPU gdb features on different CPUs yet
-     * so assert set table is the same on all CPUs, or is set only once (1 CPU).
-     */
-    g_assert(extended_set_table == NULL ||
-             (extended_set_table_size == size &&
-              cmp_cmds(extended_set_table, table, size)));
+/* Ptr to GdbCmdParseEntry */
+static GPtrArray *extended_set_table;
 
-    extended_set_table = table;
-    extended_set_table_size = size;
+void gdb_extend_set_table(GPtrArray *new_set)
+{
+    extended_set_table = extend_table(extended_set_table, new_set);
 }
 
 static const GdbCmdParseEntry gdb_gen_set_table[] = {
@@ -1924,26 +1942,28 @@ static const GdbCmdParseEntry gdb_gen_set_table[] = {
 
 static void handle_gen_query(GArray *params, void *user_ctx)
 {
+    const char *data;
+
     if (!params->len) {
         return;
     }
 
-    if (process_string_cmd(gdb_get_cmd_param(params, 0)->data,
+    data = gdb_get_cmd_param(params, 0)->data;
+
+    if (process_string_cmd(data,
                            gdb_gen_query_set_common_table,
                            ARRAY_SIZE(gdb_gen_query_set_common_table))) {
         return;
     }
 
-    if (process_string_cmd(gdb_get_cmd_param(params, 0)->data,
+    if (process_string_cmd(data,
                            gdb_gen_query_table,
                            ARRAY_SIZE(gdb_gen_query_table))) {
         return;
     }
 
     if (extended_query_table &&
-        process_string_cmd(gdb_get_cmd_param(params, 0)->data,
-                           extended_query_table,
-                           extended_query_table_size)) {
+        process_extended_table(extended_query_table, data)) {
         return;
     }
 
@@ -1953,26 +1973,28 @@ static void handle_gen_query(GArray *params, void *user_ctx)
 
 static void handle_gen_set(GArray *params, void *user_ctx)
 {
+    const char *data;
+
     if (!params->len) {
         return;
     }
 
-    if (process_string_cmd(gdb_get_cmd_param(params, 0)->data,
+    data = gdb_get_cmd_param(params, 0)->data;
+
+    if (process_string_cmd(data,
                            gdb_gen_query_set_common_table,
                            ARRAY_SIZE(gdb_gen_query_set_common_table))) {
         return;
     }
 
-    if (process_string_cmd(gdb_get_cmd_param(params, 0)->data,
+    if (process_string_cmd(data,
                            gdb_gen_set_table,
                            ARRAY_SIZE(gdb_gen_set_table))) {
         return;
     }
 
     if (extended_set_table &&
-        process_string_cmd(gdb_get_cmd_param(params, 0)->data,
-                           extended_set_table,
-                           extended_set_table_size)) {
+        process_extended_table(extended_set_table, data)) {
         return;
     }
 
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index c3a9b5eb1e..554b8736bb 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -477,11 +477,9 @@ static GDBFeature *arm_gen_dynamic_m_secextreg_feature(CPUState *cs,
 
 void arm_cpu_register_gdb_commands(ARMCPU *cpu)
 {
-    GArray *query_table =
-        g_array_new(FALSE, FALSE, sizeof(GdbCmdParseEntry));
-    GArray *set_table =
-        g_array_new(FALSE, FALSE, sizeof(GdbCmdParseEntry));
-    GString *qsupported_features = g_string_new(NULL);
+    g_autoptr(GPtrArray) query_table = g_ptr_array_new();
+    g_autoptr(GPtrArray) set_table = g_ptr_array_new();
+    g_autoptr(GString) qsupported_features = g_string_new(NULL);
 
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
     #ifdef TARGET_AARCH64
@@ -492,16 +490,12 @@ void arm_cpu_register_gdb_commands(ARMCPU *cpu)
 
     /* Set arch-specific handlers for 'q' commands. */
     if (query_table->len) {
-        gdb_extend_query_table(&g_array_index(query_table,
-                                              GdbCmdParseEntry, 0),
-                                              query_table->len);
+        gdb_extend_query_table(query_table);
     }
 
     /* Set arch-specific handlers for 'Q' commands. */
     if (set_table->len) {
-        gdb_extend_set_table(&g_array_index(set_table,
-                             GdbCmdParseEntry, 0),
-                             set_table->len);
+        gdb_extend_set_table(set_table);
     }
 
     /* Set arch-specific qSupported feature. */
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 2e2bc2700b..c8cef8cbc0 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -564,7 +564,7 @@ enum Command {
     NUM_CMDS
 };
 
-static GdbCmdParseEntry cmd_handler_table[NUM_CMDS] = {
+static const GdbCmdParseEntry cmd_handler_table[NUM_CMDS] = {
     [qMemTags] = {
         .handler = handle_q_memtag,
         .cmd_startswith = true,
@@ -590,17 +590,16 @@ static GdbCmdParseEntry cmd_handler_table[NUM_CMDS] = {
 #endif /* CONFIG_USER_ONLY */
 
 void aarch64_cpu_register_gdb_commands(ARMCPU *cpu, GString *qsupported,
-                                       GArray *qtable, GArray *stable)
+                                       GPtrArray *qtable, GPtrArray *stable)
 {
 #ifdef CONFIG_USER_ONLY
     /* MTE */
     if (cpu_isar_feature(aa64_mte, cpu)) {
         g_string_append(qsupported, ";memory-tagging+");
 
-        g_array_append_val(qtable, cmd_handler_table[qMemTags]);
-        g_array_append_val(qtable, cmd_handler_table[qIsAddressTagged]);
-
-        g_array_append_val(stable, cmd_handler_table[QMemTags]);
+        g_ptr_array_add(qtable, (gpointer) &cmd_handler_table[qMemTags]);
+        g_ptr_array_add(qtable, (gpointer) &cmd_handler_table[qIsAddressTagged]);
+        g_ptr_array_add(stable, (gpointer) &cmd_handler_table[QMemTags]);
     }
 #endif
 }
-- 
2.39.2
