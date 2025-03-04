Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf6166d3f7sm583129566b.57.2025.03.04.14.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 14:24:52 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 3E0AC625E2;
	Tue,  4 Mar 2025 22:24:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-arm@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Warner Losh <imp@bsdimp.com>,
	Brian Cain <brian.cain@oss.qualcomm.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Kyle Evans <kevans@freebsd.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 28/32] plugins/api: split out time control helpers
Date: Tue,  4 Mar 2025 22:24:35 +0000
Message-Id: <20250304222439.2035603-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250304222439.2035603-1-alex.bennee@linaro.org>
References: <20250304222439.2035603-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: b16Y4JSLqd8c

These are only usable in system mode where we control the timer. For
user-mode make them NOPs.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20250225110844.3296991-10-alex.bennee@linaro.org>
---
 plugins/api-system.c | 34 ++++++++++++++++++++++++++++++++++
 plugins/api-user.c   | 17 +++++++++++++++++
 plugins/api.c        | 41 -----------------------------------------
 3 files changed, 51 insertions(+), 41 deletions(-)

diff --git a/plugins/api-system.c b/plugins/api-system.c
index 38560de342..cc190b167e 100644
--- a/plugins/api-system.c
+++ b/plugins/api-system.c
@@ -95,3 +95,37 @@ const char *qemu_plugin_hwaddr_device_name(const struct qemu_plugin_hwaddr *h)
         return g_intern_static_string("RAM");
     }
 }
+
+/*
+ * Time control
+ */
+static bool has_control;
+static Error *migration_blocker;
+
+const void *qemu_plugin_request_time_control(void)
+{
+    if (!has_control) {
+        has_control = true;
+        error_setg(&migration_blocker,
+                   "TCG plugin time control does not support migration");
+        migrate_add_blocker(&migration_blocker, NULL);
+        return &has_control;
+    }
+    return NULL;
+}
+
+static void advance_virtual_time__async(CPUState *cpu, run_on_cpu_data data)
+{
+    int64_t new_time = data.host_ulong;
+    qemu_clock_advance_virtual_time(new_time);
+}
+
+void qemu_plugin_update_ns(const void *handle, int64_t new_time)
+{
+    if (handle == &has_control) {
+        /* Need to execute out of cpu_exec, so bql can be locked. */
+        async_run_on_cpu(current_cpu,
+                         advance_virtual_time__async,
+                         RUN_ON_CPU_HOST_ULONG(new_time));
+    }
+}
diff --git a/plugins/api-user.c b/plugins/api-user.c
index 867b420339..28704a89e8 100644
--- a/plugins/api-user.c
+++ b/plugins/api-user.c
@@ -12,6 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/plugin.h"
+#include "exec/log.h"
 
 /*
  * Virtual Memory queries - these are all NOPs for user-mode which
@@ -38,3 +39,19 @@ const char *qemu_plugin_hwaddr_device_name(const struct qemu_plugin_hwaddr *h)
 {
     return g_intern_static_string("Invalid");
 }
+
+/*
+ * Time control - for user mode the only real time is wall clock time
+ * so realistically all you can do in user mode is slow down execution
+ * which doesn't require the ability to mess with the clock.
+ */
+
+const void *qemu_plugin_request_time_control(void)
+{
+    return NULL;
+}
+
+void qemu_plugin_update_ns(const void *handle, int64_t new_time)
+{
+    qemu_log_mask(LOG_UNIMP, "user-mode can't control time");
+}
diff --git a/plugins/api.c b/plugins/api.c
index 82241699a5..832bf6ee5e 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -526,44 +526,3 @@ uint64_t qemu_plugin_u64_sum(qemu_plugin_u64 entry)
     return total;
 }
 
-/*
- * Time control
- */
-static bool has_control;
-#ifdef CONFIG_SOFTMMU
-static Error *migration_blocker;
-#endif
-
-const void *qemu_plugin_request_time_control(void)
-{
-    if (!has_control) {
-        has_control = true;
-#ifdef CONFIG_SOFTMMU
-        error_setg(&migration_blocker,
-                   "TCG plugin time control does not support migration");
-        migrate_add_blocker(&migration_blocker, NULL);
-#endif
-        return &has_control;
-    }
-    return NULL;
-}
-
-#ifdef CONFIG_SOFTMMU
-static void advance_virtual_time__async(CPUState *cpu, run_on_cpu_data data)
-{
-    int64_t new_time = data.host_ulong;
-    qemu_clock_advance_virtual_time(new_time);
-}
-#endif
-
-void qemu_plugin_update_ns(const void *handle, int64_t new_time)
-{
-#ifdef CONFIG_SOFTMMU
-    if (handle == &has_control) {
-        /* Need to execute out of cpu_exec, so bql can be locked. */
-        async_run_on_cpu(current_cpu,
-                         advance_virtual_time__async,
-                         RUN_ON_CPU_HOST_ULONG(new_time));
-    }
-#endif
-}
-- 
2.39.5
