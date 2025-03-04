Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a66b1sm8643141a12.71.2025.03.04.14.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 14:29:53 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id DC3E1625C3;
	Tue,  4 Mar 2025 22:24:41 +0000 (GMT)
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
Subject: [PATCH v2 25/32] plugins/loader: compile loader only once
Date: Tue,  4 Mar 2025 22:24:32 +0000
Message-Id: <20250304222439.2035603-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250304222439.2035603-1-alex.bennee@linaro.org>
References: <20250304222439.2035603-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2i+7PhTmz5zp

There is very little in loader that is different between builds save
for a tiny user/system mode difference in the plugin_info structure.
Create two new files, user and system to hold mode specific helpers
and move loader into common_ss.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20250225110844.3296991-7-alex.bennee@linaro.org>
---
 plugins/plugin.h    |  6 ++++++
 plugins/loader.c    | 13 ++-----------
 plugins/system.c    | 24 ++++++++++++++++++++++++
 plugins/user.c      | 19 +++++++++++++++++++
 plugins/meson.build |  7 ++++++-
 5 files changed, 57 insertions(+), 12 deletions(-)
 create mode 100644 plugins/system.c
 create mode 100644 plugins/user.c

diff --git a/plugins/plugin.h b/plugins/plugin.h
index 9ed20b5c41..6fbc443b96 100644
--- a/plugins/plugin.h
+++ b/plugins/plugin.h
@@ -119,4 +119,10 @@ struct qemu_plugin_scoreboard *plugin_scoreboard_new(size_t element_size);
 
 void plugin_scoreboard_free(struct qemu_plugin_scoreboard *score);
 
+/**
+ * qemu_plugin_fillin_mode_info() - populate mode specific info
+ * info: pointer to qemu_info_t structure
+ */
+void qemu_plugin_fillin_mode_info(qemu_info_t *info);
+
 #endif /* PLUGIN_H */
diff --git a/plugins/loader.c b/plugins/loader.c
index 827473c8b6..7523d554f0 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -31,9 +31,6 @@
 #include "qemu/memalign.h"
 #include "hw/core/cpu.h"
 #include "exec/tb-flush.h"
-#ifndef CONFIG_USER_ONLY
-#include "hw/boards.h"
-#endif
 
 #include "plugin.h"
 
@@ -300,14 +297,8 @@ int qemu_plugin_load_list(QemuPluginList *head, Error **errp)
     info->target_name = target_name();
     info->version.min = QEMU_PLUGIN_MIN_VERSION;
     info->version.cur = QEMU_PLUGIN_VERSION;
-#ifndef CONFIG_USER_ONLY
-    MachineState *ms = MACHINE(qdev_get_machine());
-    info->system_emulation = true;
-    info->system.smp_vcpus = ms->smp.cpus;
-    info->system.max_vcpus = ms->smp.max_cpus;
-#else
-    info->system_emulation = false;
-#endif
+
+    qemu_plugin_fillin_mode_info(info);
 
     QTAILQ_FOREACH_SAFE(desc, head, entry, next) {
         int err;
diff --git a/plugins/system.c b/plugins/system.c
new file mode 100644
index 0000000000..b3ecc33ba5
--- /dev/null
+++ b/plugins/system.c
@@ -0,0 +1,24 @@
+/*
+ * QEMU Plugin system-emulation helpers
+ *
+ * Helpers that are specific to system emulation.
+ *
+ * Copyright (C) 2017, Emilio G. Cota <cota@braap.org>
+ * Copyright (C) 2019-2025, Linaro
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/plugin.h"
+#include "hw/boards.h"
+
+#include "plugin.h"
+
+void qemu_plugin_fillin_mode_info(qemu_info_t *info)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    info->system_emulation = true;
+    info->system.smp_vcpus = ms->smp.cpus;
+    info->system.max_vcpus = ms->smp.max_cpus;
+}
diff --git a/plugins/user.c b/plugins/user.c
new file mode 100644
index 0000000000..250d542502
--- /dev/null
+++ b/plugins/user.c
@@ -0,0 +1,19 @@
+/*
+ * QEMU Plugin user-mode helpers
+ *
+ * Helpers that are specific to user-mode.
+ *
+ * Copyright (C) 2017, Emilio G. Cota <cota@braap.org>
+ * Copyright (C) 2019-2025, Linaro
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/plugin.h"
+#include "plugin.h"
+
+void qemu_plugin_fillin_mode_info(qemu_info_t *info)
+{
+    info->system_emulation = false;
+}
diff --git a/plugins/meson.build b/plugins/meson.build
index d60be2a4d6..f7820806d3 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -57,8 +57,13 @@ if host_os == 'windows'
     command: dlltool_cmd
   )
 endif
+
+user_ss.add(files('user.c'))
+system_ss.add(files('system.c'))
+
+common_ss.add(files('loader.c'))
+
 specific_ss.add(files(
-  'loader.c',
   'core.c',
   'api.c',
 ))
-- 
2.39.5
