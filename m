Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab0900e6sm76137866b.181.2024.06.28.05.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:51:56 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E3A665FA3F;
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
Subject: [PATCH 20/23] gdbstub: Pass CPU context to command handler
Date: Fri, 28 Jun 2024 13:42:55 +0100
Message-Id: <20240628124258.832466-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240628124258.832466-1-alex.bennee@linaro.org>
References: <20240628124258.832466-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KjuIsK5Rr533

From: Gustavo Romero <gustavo.romero@linaro.org>

Allow passing the current CPU context to command handlers via user_ctx
when the handler requires it.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20240628050850.536447-9-gustavo.romero@linaro.org>
---
 include/gdbstub/commands.h | 3 +++
 gdbstub/gdbstub.c          | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/gdbstub/commands.h b/include/gdbstub/commands.h
index e51f276b40..f3058f9dda 100644
--- a/include/gdbstub/commands.h
+++ b/include/gdbstub/commands.h
@@ -54,6 +54,8 @@ typedef union GdbCmdVariant {
  * "stop reply" packet. The list of commands that accept such response is
  * defined at the GDB Remote Serial Protocol documentation. See:
  * https://sourceware.org/gdb/onlinedocs/gdb/Stop-Reply-Packets.html#Stop-Reply-Packets.
+ *
+ * @need_cpu_context: Pass current CPU context to command handler via user_ctx.
  */
 typedef struct GdbCmdParseEntry {
     GdbCmdHandler handler;
@@ -61,6 +63,7 @@ typedef struct GdbCmdParseEntry {
     bool cmd_startswith;
     const char *schema;
     bool allow_stop_reply;
+    bool need_cpu_context;
 } GdbCmdParseEntry;
 
 /**
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index b1ca253f97..5c1612ed2a 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -938,6 +938,7 @@ static bool process_string_cmd(const char *data,
 
     for (i = 0; i < num_cmds; i++) {
         const GdbCmdParseEntry *cmd = &cmds[i];
+        void *user_ctx = NULL;
         g_assert(cmd->handler && cmd->cmd);
 
         if ((cmd->cmd_startswith && !startswith(data, cmd->cmd)) ||
@@ -952,8 +953,12 @@ static bool process_string_cmd(const char *data,
             }
         }
 
+        if (cmd->need_cpu_context) {
+            user_ctx = (void *)gdbserver_state.g_cpu;
+        }
+
         gdbserver_state.allow_stop_reply = cmd->allow_stop_reply;
-        cmd->handler(params, NULL);
+        cmd->handler(params, user_ctx);
         return true;
     }
 
-- 
2.39.2
