Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ba16-20020a0560001c1000b0033b2799815csm3555080wrb.86.2024.02.23.08.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 08:22:11 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D12D45F928;
	Fri, 23 Feb 2024 16:22:03 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
	qemu-s390x@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Bin Meng <bin.meng@windriver.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-ppc@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Cleber Rosa <crosa@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Brian Cain <bcain@quicinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v2 13/27] plugins: remove previous n_vcpus functions from API
Date: Fri, 23 Feb 2024 16:21:48 +0000
Message-Id: <20240223162202.1936541-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240223162202.1936541-1-alex.bennee@linaro.org>
References: <20240223162202.1936541-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2jBQWkOfaEQn

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

This information is already accessible using qemu_info_t during plugin
install.

We will introduce another function (qemu_plugin_num_vcpus) which
represent how many cpus were enabled, by tracking new cpu indexes.

It's a breaking change, so we bump API version.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240213094009.150349-2-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/qemu-plugin.h   | 10 +++-------
 plugins/plugin.h             |  2 +-
 contrib/plugins/cache.c      |  2 +-
 plugins/api.c                | 30 ------------------------------
 plugins/qemu-plugins.symbols |  2 --
 5 files changed, 5 insertions(+), 41 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 4daab6efd29..e45181c793c 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -50,11 +50,13 @@ typedef uint64_t qemu_plugin_id_t;
  *
  * The plugins export the API they were built against by exposing the
  * symbol qemu_plugin_version which can be checked.
+ *
+ * version 2: removed qemu_plugin_n_vcpus and qemu_plugin_n_max_vcpus
  */
 
 extern QEMU_PLUGIN_EXPORT int qemu_plugin_version;
 
-#define QEMU_PLUGIN_VERSION 1
+#define QEMU_PLUGIN_VERSION 2
 
 /**
  * struct qemu_info_t - system information for plugins
@@ -643,12 +645,6 @@ QEMU_PLUGIN_API
 void qemu_plugin_register_atexit_cb(qemu_plugin_id_t id,
                                     qemu_plugin_udata_cb_t cb, void *userdata);
 
-/* returns -1 in user-mode */
-int qemu_plugin_n_vcpus(void);
-
-/* returns -1 in user-mode */
-int qemu_plugin_n_max_vcpus(void);
-
 /**
  * qemu_plugin_outs() - output string via QEMU's logging system
  * @string: a string
diff --git a/plugins/plugin.h b/plugins/plugin.h
index 5eb2fdbc85e..90f3f324ab6 100644
--- a/plugins/plugin.h
+++ b/plugins/plugin.h
@@ -15,7 +15,7 @@
 #include <gmodule.h>
 #include "qemu/qht.h"
 
-#define QEMU_PLUGIN_MIN_VERSION 0
+#define QEMU_PLUGIN_MIN_VERSION 2
 
 /* global state */
 struct qemu_plugin_state {
diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index 9e7ade3b374..c5c8ac75a9c 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -767,7 +767,7 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
 
     policy = LRU;
 
-    cores = sys ? qemu_plugin_n_vcpus() : 1;
+    cores = sys ? info->system.smp_vcpus : 1;
 
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
diff --git a/plugins/api.c b/plugins/api.c
index 5521b0ad36c..2926b1961a8 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -342,36 +342,6 @@ const char *qemu_plugin_hwaddr_device_name(const struct qemu_plugin_hwaddr *h)
 #endif
 }
 
-/*
- * Queries to the number and potential maximum number of vCPUs there
- * will be. This helps the plugin dimension per-vcpu arrays.
- */
-
-#ifndef CONFIG_USER_ONLY
-static MachineState * get_ms(void)
-{
-    return MACHINE(qdev_get_machine());
-}
-#endif
-
-int qemu_plugin_n_vcpus(void)
-{
-#ifdef CONFIG_USER_ONLY
-    return -1;
-#else
-    return get_ms()->smp.cpus;
-#endif
-}
-
-int qemu_plugin_n_max_vcpus(void)
-{
-#ifdef CONFIG_USER_ONLY
-    return -1;
-#else
-    return get_ms()->smp.max_cpus;
-#endif
-}
-
 /*
  * Plugin output
  */
diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index 71f6c90549d..ca806000d54 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -16,8 +16,6 @@
   qemu_plugin_mem_is_sign_extended;
   qemu_plugin_mem_is_store;
   qemu_plugin_mem_size_shift;
-  qemu_plugin_n_max_vcpus;
-  qemu_plugin_n_vcpus;
   qemu_plugin_outs;
   qemu_plugin_path_to_binary;
   qemu_plugin_register_atexit_cb;
-- 
2.39.2
