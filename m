Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-605671442d3sm7315460a12.51.2025.06.03.04.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:02:13 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 62C705F839;
	Tue, 03 Jun 2025 12:02:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Dominik 'Disconnect3d' Czarnota <dominik.b.czarnota@gmail.com>,
	Patryk 'patryk4815' Sondej <patryk.sondej@gmail.com>
Subject: [PATCH v4 16/17] gdbstub: Implement qGDBServerVersion packet
Date: Tue,  3 Jun 2025 12:02:03 +0100
Message-ID: <20250603110204.838117-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250603110204.838117-1-alex.bennee@linaro.org>
References: <20250603110204.838117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QHVEIXIdOiC3

From: Dominik 'Disconnect3d' Czarnota <dominik.b.czarnota@gmail.com>

This commit adds support for the `qGDBServerVersion` packet to the qemu
gdbstub  which could be used by clients to detect the QEMU version
(and, e.g., use a workaround for known bugs).

This packet is not documented/standarized by GDB but it was implemented
by LLDB gdbstub [0] and is helpful for projects like Pwndbg [1].

This has been implemented by Patryk, who I included in Co-authored-by
and who asked me to send the patch.

[0] https://lldb.llvm.org/resources/lldbgdbremote.html#qgdbserverversion
[1] https://github.com/pwndbg/pwndbg/issues/2648

Co-authored-by: Patryk 'patryk4815' Sondej <patryk.sondej@gmail.com>
Signed-off-by: Dominik 'Disconnect3d' Czarnota <dominik.b.czarnota@gmail.com>
Message-Id: <20250403191340.53343-1-dominik.b.czarnota@gmail.com>
[AJB: fix include, checkpatch linewrap]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 6023c80d25..def0b7e877 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -28,6 +28,7 @@
 #include "qemu/cutils.h"
 #include "qemu/module.h"
 #include "qemu/error-report.h"
+#include "qemu/target-info.h"
 #include "trace.h"
 #include "exec/gdbstub.h"
 #include "gdbstub/commands.h"
@@ -1597,6 +1598,18 @@ static void handle_query_threads(GArray *params, void *user_ctx)
     gdbserver_state.query_cpu = gdb_next_attached_cpu(gdbserver_state.query_cpu);
 }
 
+static void handle_query_gdb_server_version(GArray *params, void *user_ctx)
+{
+#if defined(CONFIG_USER_ONLY)
+    g_string_printf(gdbserver_state.str_buf, "name:qemu-%s;version:%s;",
+                    target_name(), QEMU_VERSION);
+#else
+    g_string_printf(gdbserver_state.str_buf, "name:qemu-system-%s;version:%s;",
+                    target_name(), QEMU_VERSION);
+#endif
+    gdb_put_strbuf();
+}
+
 static void handle_query_first_threads(GArray *params, void *user_ctx)
 {
     gdbserver_state.query_cpu = gdb_first_attached_cpu();
@@ -1842,6 +1855,10 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
         .handler = handle_query_threads,
         .cmd = "sThreadInfo",
     },
+    {
+        .handler = handle_query_gdb_server_version,
+        .cmd = "GDBServerVersion",
+    },
     {
         .handler = handle_query_first_threads,
         .cmd = "fThreadInfo",
-- 
2.47.2
