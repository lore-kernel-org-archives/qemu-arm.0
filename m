Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb4885sm8699562a12.59.2025.03.04.14.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 14:29:50 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 269E8625DB;
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
Subject: [PATCH v2 27/32] plugins/api: split out the vaddr/hwaddr helpers
Date: Tue,  4 Mar 2025 22:24:34 +0000
Message-Id: <20250304222439.2035603-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250304222439.2035603-1-alex.bennee@linaro.org>
References: <20250304222439.2035603-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: R2twZWWs1wPU

These only work for system-mode and are NOPs for user-mode.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20250226140343.3907080-23-alex.bennee@linaro.org>
---
 plugins/api-system.c | 58 ++++++++++++++++++++++++++++++++++++
 plugins/api-user.c   | 40 +++++++++++++++++++++++++
 plugins/api.c        | 70 --------------------------------------------
 plugins/meson.build  |  2 +-
 4 files changed, 99 insertions(+), 71 deletions(-)
 create mode 100644 plugins/api-user.c

diff --git a/plugins/api-system.c b/plugins/api-system.c
index cb0dd8f730..38560de342 100644
--- a/plugins/api-system.c
+++ b/plugins/api-system.c
@@ -12,6 +12,10 @@
 
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
+#include "qapi/error.h"
+#include "migration/blocker.h"
+#include "hw/boards.h"
+#include "qemu/plugin-memory.h"
 #include "qemu/plugin.h"
 
 /*
@@ -37,3 +41,57 @@ uint64_t qemu_plugin_entry_code(void)
 {
     return 0;
 }
+
+/*
+ * Virtual Memory queries
+ */
+
+static __thread struct qemu_plugin_hwaddr hwaddr_info;
+
+struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
+                                                  uint64_t vaddr)
+{
+    CPUState *cpu = current_cpu;
+    unsigned int mmu_idx = get_mmuidx(info);
+    enum qemu_plugin_mem_rw rw = get_plugin_meminfo_rw(info);
+    hwaddr_info.is_store = (rw & QEMU_PLUGIN_MEM_W) != 0;
+
+    assert(mmu_idx < NB_MMU_MODES);
+
+    if (!tlb_plugin_lookup(cpu, vaddr, mmu_idx,
+                           hwaddr_info.is_store, &hwaddr_info)) {
+        error_report("invalid use of qemu_plugin_get_hwaddr");
+        return NULL;
+    }
+
+    return &hwaddr_info;
+}
+
+bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr)
+{
+    return haddr->is_io;
+}
+
+uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr)
+{
+    if (haddr) {
+        return haddr->phys_addr;
+    }
+    return 0;
+}
+
+const char *qemu_plugin_hwaddr_device_name(const struct qemu_plugin_hwaddr *h)
+{
+    if (h && h->is_io) {
+        MemoryRegion *mr = h->mr;
+        if (!mr->name) {
+            unsigned maddr = (uintptr_t)mr;
+            g_autofree char *temp = g_strdup_printf("anon%08x", maddr);
+            return g_intern_string(temp);
+        } else {
+            return g_intern_string(mr->name);
+        }
+    } else {
+        return g_intern_static_string("RAM");
+    }
+}
diff --git a/plugins/api-user.c b/plugins/api-user.c
new file mode 100644
index 0000000000..867b420339
--- /dev/null
+++ b/plugins/api-user.c
@@ -0,0 +1,40 @@
+/*
+ * QEMU Plugin API - user-mode only implementations
+ *
+ * This provides the APIs that have a user-mode specific
+ * implementations or are only relevant to user-mode.
+ *
+ * Copyright (C) 2017, Emilio G. Cota <cota@braap.org>
+ * Copyright (C) 2019-2025, Linaro
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/plugin.h"
+
+/*
+ * Virtual Memory queries - these are all NOPs for user-mode which
+ * only ever has visibility of virtual addresses.
+ */
+
+struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
+                                                  uint64_t vaddr)
+{
+    return NULL;
+}
+
+bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr)
+{
+    return false;
+}
+
+uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr)
+{
+    return 0;
+}
+
+const char *qemu_plugin_hwaddr_device_name(const struct qemu_plugin_hwaddr *h)
+{
+    return g_intern_static_string("Invalid");
+}
diff --git a/plugins/api.c b/plugins/api.c
index ffccd71e4b..82241699a5 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -383,76 +383,6 @@ qemu_plugin_mem_value qemu_plugin_mem_get_value(qemu_plugin_meminfo_t info)
     return value;
 }
 
-/*
- * Virtual Memory queries
- */
-
-#ifdef CONFIG_SOFTMMU
-static __thread struct qemu_plugin_hwaddr hwaddr_info;
-#endif
-
-struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
-                                                  uint64_t vaddr)
-{
-#ifdef CONFIG_SOFTMMU
-    CPUState *cpu = current_cpu;
-    unsigned int mmu_idx = get_mmuidx(info);
-    enum qemu_plugin_mem_rw rw = get_plugin_meminfo_rw(info);
-    hwaddr_info.is_store = (rw & QEMU_PLUGIN_MEM_W) != 0;
-
-    assert(mmu_idx < NB_MMU_MODES);
-
-    if (!tlb_plugin_lookup(cpu, vaddr, mmu_idx,
-                           hwaddr_info.is_store, &hwaddr_info)) {
-        error_report("invalid use of qemu_plugin_get_hwaddr");
-        return NULL;
-    }
-
-    return &hwaddr_info;
-#else
-    return NULL;
-#endif
-}
-
-bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr)
-{
-#ifdef CONFIG_SOFTMMU
-    return haddr->is_io;
-#else
-    return false;
-#endif
-}
-
-uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr)
-{
-#ifdef CONFIG_SOFTMMU
-    if (haddr) {
-        return haddr->phys_addr;
-    }
-#endif
-    return 0;
-}
-
-const char *qemu_plugin_hwaddr_device_name(const struct qemu_plugin_hwaddr *h)
-{
-#ifdef CONFIG_SOFTMMU
-    if (h && h->is_io) {
-        MemoryRegion *mr = h->mr;
-        if (!mr->name) {
-            unsigned maddr = (uintptr_t)mr;
-            g_autofree char *temp = g_strdup_printf("anon%08x", maddr);
-            return g_intern_string(temp);
-        } else {
-            return g_intern_string(mr->name);
-        }
-    } else {
-        return g_intern_static_string("RAM");
-    }
-#else
-    return g_intern_static_string("Invalid");
-#endif
-}
-
 int qemu_plugin_num_vcpus(void)
 {
     return plugin_num_vcpus();
diff --git a/plugins/meson.build b/plugins/meson.build
index 9c9bc9e5bb..942b59e904 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -58,7 +58,7 @@ if host_os == 'windows'
   )
 endif
 
-user_ss.add(files('user.c'))
+user_ss.add(files('user.c', 'api-user.c'))
 system_ss.add(files('system.c', 'api-system.c'))
 
 common_ss.add(files('loader.c'))
-- 
2.39.5
