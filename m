Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id n24-20020a7bcbd8000000b003fef6881350sm3141019wmi.25.2023.08.24.09.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 09:39:15 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4DC8C1FFC4;
	Thu, 24 Aug 2023 17:39:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-s390x@nongnu.org,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Juan Quintela <quintela@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 09/12] gdbstub: remove unused user_ctx field
Date: Thu, 24 Aug 2023 17:39:07 +0100
Message-Id: <20230824163910.1737079-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824163910.1737079-1-alex.bennee@linaro.org>
References: <20230824163910.1737079-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PWDnVr8OHw2+

This was always NULL so drop it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 gdbstub/gdbstub.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index e7d48fa0d4..8e9bc17e07 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -836,7 +836,7 @@ static inline int startswith(const char *string, const char *pattern)
   return !strncmp(string, pattern, strlen(pattern));
 }
 
-static int process_string_cmd(void *user_ctx, const char *data,
+static int process_string_cmd(const char *data,
                               const GdbCmdParseEntry *cmds, int num_cmds)
 {
     int i;
@@ -863,7 +863,7 @@ static int process_string_cmd(void *user_ctx, const char *data,
         }
 
         gdbserver_state.allow_stop_reply = cmd->allow_stop_reply;
-        cmd->handler(params, user_ctx);
+        cmd->handler(params, NULL);
         return 0;
     }
 
@@ -881,7 +881,7 @@ static void run_cmd_parser(const char *data, const GdbCmdParseEntry *cmd)
 
     /* In case there was an error during the command parsing we must
     * send a NULL packet to indicate the command is not supported */
-    if (process_string_cmd(NULL, data, cmd, 1)) {
+    if (process_string_cmd(data, cmd, 1)) {
         gdb_put_packet("");
     }
 }
@@ -1394,7 +1394,7 @@ static void handle_v_commands(GArray *params, void *user_ctx)
         return;
     }
 
-    if (process_string_cmd(NULL, get_param(params, 0)->data,
+    if (process_string_cmd(get_param(params, 0)->data,
                            gdb_v_commands_table,
                            ARRAY_SIZE(gdb_v_commands_table))) {
         gdb_put_packet("");
@@ -1738,13 +1738,13 @@ static void handle_gen_query(GArray *params, void *user_ctx)
         return;
     }
 
-    if (!process_string_cmd(NULL, get_param(params, 0)->data,
+    if (!process_string_cmd(get_param(params, 0)->data,
                             gdb_gen_query_set_common_table,
                             ARRAY_SIZE(gdb_gen_query_set_common_table))) {
         return;
     }
 
-    if (process_string_cmd(NULL, get_param(params, 0)->data,
+    if (process_string_cmd(get_param(params, 0)->data,
                            gdb_gen_query_table,
                            ARRAY_SIZE(gdb_gen_query_table))) {
         gdb_put_packet("");
@@ -1757,13 +1757,13 @@ static void handle_gen_set(GArray *params, void *user_ctx)
         return;
     }
 
-    if (!process_string_cmd(NULL, get_param(params, 0)->data,
+    if (!process_string_cmd(get_param(params, 0)->data,
                             gdb_gen_query_set_common_table,
                             ARRAY_SIZE(gdb_gen_query_set_common_table))) {
         return;
     }
 
-    if (process_string_cmd(NULL, get_param(params, 0)->data,
+    if (process_string_cmd(get_param(params, 0)->data,
                            gdb_gen_set_table,
                            ARRAY_SIZE(gdb_gen_set_table))) {
         gdb_put_packet("");
-- 
2.39.2
