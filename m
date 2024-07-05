Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf18933sm668677766b.13.2024.07.05.01.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 01:41:04 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9461162157;
	Fri,  5 Jul 2024 09:40:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Thomas Huth <thuth@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Yanan Wang <wangyanan55@huawei.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Xu <peterx@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paul Burton <paulburton@kernel.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Gustavo Romero <gustavo.romero@linaro.org>
Subject: [PATCH v2 30/40] gdbstub: Clean up process_string_cmd
Date: Fri,  5 Jul 2024 09:40:37 +0100
Message-Id: <20240705084047.857176-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705084047.857176-1-alex.bennee@linaro.org>
References: <20240705084047.857176-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2Z/vgnnuEsVe

From: Gustavo Romero <gustavo.romero@linaro.org>

Change 'process_string_cmd' to return true on success and false on
failure, instead of 0 and -1.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20240628050850.536447-2-gustavo.romero@linaro.org>
---
 gdbstub/gdbstub.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index b3574997ea..37314b92e5 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -962,14 +962,14 @@ static inline int startswith(const char *string, const char *pattern)
   return !strncmp(string, pattern, strlen(pattern));
 }
 
-static int process_string_cmd(const char *data,
-                              const GdbCmdParseEntry *cmds, int num_cmds)
+static bool process_string_cmd(const char *data,
+                               const GdbCmdParseEntry *cmds, int num_cmds)
 {
     int i;
     g_autoptr(GArray) params = g_array_new(false, true, sizeof(GdbCmdVariant));
 
     if (!cmds) {
-        return -1;
+        return false;
     }
 
     for (i = 0; i < num_cmds; i++) {
@@ -984,16 +984,16 @@ static int process_string_cmd(const char *data,
         if (cmd->schema) {
             if (cmd_parse_params(&data[strlen(cmd->cmd)],
                                  cmd->schema, params)) {
-                return -1;
+                return false;
             }
         }
 
         gdbserver_state.allow_stop_reply = cmd->allow_stop_reply;
         cmd->handler(params, NULL);
-        return 0;
+        return true;
     }
 
-    return -1;
+    return false;
 }
 
 static void run_cmd_parser(const char *data, const GdbCmdParseEntry *cmd)
@@ -1007,7 +1007,7 @@ static void run_cmd_parser(const char *data, const GdbCmdParseEntry *cmd)
 
     /* In case there was an error during the command parsing we must
     * send a NULL packet to indicate the command is not supported */
-    if (process_string_cmd(data, cmd, 1)) {
+    if (!process_string_cmd(data, cmd, 1)) {
         gdb_put_packet("");
     }
 }
@@ -1523,9 +1523,9 @@ static void handle_v_commands(GArray *params, void *user_ctx)
         return;
     }
 
-    if (process_string_cmd(get_param(params, 0)->data,
-                           gdb_v_commands_table,
-                           ARRAY_SIZE(gdb_v_commands_table))) {
+    if (!process_string_cmd(get_param(params, 0)->data,
+                            gdb_v_commands_table,
+                            ARRAY_SIZE(gdb_v_commands_table))) {
         gdb_put_packet("");
     }
 }
@@ -1889,15 +1889,15 @@ static void handle_gen_query(GArray *params, void *user_ctx)
         return;
     }
 
-    if (!process_string_cmd(get_param(params, 0)->data,
-                            gdb_gen_query_set_common_table,
-                            ARRAY_SIZE(gdb_gen_query_set_common_table))) {
+    if (process_string_cmd(get_param(params, 0)->data,
+                           gdb_gen_query_set_common_table,
+                           ARRAY_SIZE(gdb_gen_query_set_common_table))) {
         return;
     }
 
-    if (process_string_cmd(get_param(params, 0)->data,
-                           gdb_gen_query_table,
-                           ARRAY_SIZE(gdb_gen_query_table))) {
+    if (!process_string_cmd(get_param(params, 0)->data,
+                            gdb_gen_query_table,
+                            ARRAY_SIZE(gdb_gen_query_table))) {
         gdb_put_packet("");
     }
 }
@@ -1908,13 +1908,13 @@ static void handle_gen_set(GArray *params, void *user_ctx)
         return;
     }
 
-    if (!process_string_cmd(get_param(params, 0)->data,
-                            gdb_gen_query_set_common_table,
-                            ARRAY_SIZE(gdb_gen_query_set_common_table))) {
+    if (process_string_cmd(get_param(params, 0)->data,
+                           gdb_gen_query_set_common_table,
+                           ARRAY_SIZE(gdb_gen_query_set_common_table))) {
         return;
     }
 
-    if (process_string_cmd(get_param(params, 0)->data,
+    if (!process_string_cmd(get_param(params, 0)->data,
                            gdb_gen_set_table,
                            ARRAY_SIZE(gdb_gen_set_table))) {
         gdb_put_packet("");
-- 
2.39.2
