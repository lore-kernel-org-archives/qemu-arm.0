Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7ff89esm539861466b.158.2024.07.18.02.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:45:25 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 62C205FA12;
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
	Simon Hamelin <simon.hamelin@grenoble-inp.org>
Subject: [PATCH 04/15] plugins/stoptrigger: TCG plugin to stop execution under conditions
Date: Thu, 18 Jul 2024 10:45:12 +0100
Message-Id: <20240718094523.1198645-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718094523.1198645-1-alex.bennee@linaro.org>
References: <20240718094523.1198645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: AMlGUB3pZD5M

From: Simon Hamelin <simon.hamelin@grenoble-inp.org>

This new plugin allows to stop emulation using conditions on the
emulation state. By setting this plugin arguments, it is possible
to set an instruction count limit and/or trigger address(es) to stop at.
The code returned at emulation exit can be customized.

This plugin demonstrates how someone could stop QEMU execution.
It could be used for research purposes to launch some code and
deterministically stop it and understand where its execution flow went.

Co-authored-by: Alexandre Iooss <erdnaxe@crans.org>
Signed-off-by: Simon Hamelin <simon.hamelin@grenoble-inp.org>
Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20240715081521.19122-2-simon.hamelin@grenoble-inp.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/tcg-plugins.rst    |  22 +++++
 contrib/plugins/stoptrigger.c | 151 ++++++++++++++++++++++++++++++++++
 contrib/plugins/Makefile      |   1 +
 3 files changed, 174 insertions(+)
 create mode 100644 contrib/plugins/stoptrigger.c

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index f7d7b9e3a4..954623f9bf 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -642,6 +642,28 @@ The plugin has a number of arguments, all of them are optional:
   configuration arguments implies ``l2=on``.
   (default: N = 2097152 (2MB), B = 64, A = 16)
 
+- contrib/plugins/stoptrigger.c
+
+The stoptrigger plugin allows to setup triggers to stop emulation.
+It can be used for research purposes to launch some code and precisely stop it
+and understand where its execution flow went.
+
+Two types of triggers can be configured: a count of instructions to stop at,
+or an address to stop at. Multiple triggers can be set at once.
+
+By default, QEMU will exit with return code 0. A custom return code can be
+configured for each trigger using ``:CODE`` syntax.
+
+For example, to stop at the 20-th instruction with return code 41, at address
+0xd4 with return code 0 or at address 0xd8 with return code 42::
+
+  $ qemu-system-aarch64 $(QEMU_ARGS) \
+    -plugin ./contrib/plugins/libstoptrigger.so,icount=20:41,addr=0xd4,addr=0xd8:42 -d plugin
+
+The plugin will log the reason of exit, for example::
+
+  0xd4 reached, exiting
+
 Plugin API
 ==========
 
diff --git a/contrib/plugins/stoptrigger.c b/contrib/plugins/stoptrigger.c
new file mode 100644
index 0000000000..03ee22f4c6
--- /dev/null
+++ b/contrib/plugins/stoptrigger.c
@@ -0,0 +1,151 @@
+/*
+ * Copyright (C) 2024, Simon Hamelin <simon.hamelin@grenoble-inp.org>
+ *
+ * Stop execution once a given address is reached or if the
+ * count of executed instructions reached a specified limit
+ *
+ * License: GNU GPL, version 2 or later.
+ *   See the COPYING file in the top-level directory.
+ */
+
+#include <assert.h>
+#include <glib.h>
+#include <inttypes.h>
+#include <stdio.h>
+#include <stdlib.h>
+
+#include <qemu-plugin.h>
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+
+/* Scoreboard to track executed instructions count */
+typedef struct {
+    uint64_t insn_count;
+} InstructionsCount;
+static struct qemu_plugin_scoreboard *insn_count_sb;
+static qemu_plugin_u64 insn_count;
+
+static uint64_t icount;
+static int icount_exit_code;
+
+static bool exit_on_icount;
+static bool exit_on_address;
+
+/* Map trigger addresses to exit code */
+static GHashTable *addrs_ht;
+
+static void exit_emulation(int return_code, char *message)
+{
+    qemu_plugin_outs(message);
+    g_free(message);
+    exit(return_code);
+}
+
+static void exit_icount_reached(unsigned int cpu_index, void *udata)
+{
+    uint64_t insn_vaddr = GPOINTER_TO_UINT(udata);
+    char *msg = g_strdup_printf("icount reached at 0x%" PRIx64 ", exiting\n",
+                                insn_vaddr);
+
+    exit_emulation(icount_exit_code, msg);
+}
+
+static void exit_address_reached(unsigned int cpu_index, void *udata)
+{
+    uint64_t insn_vaddr = GPOINTER_TO_UINT(udata);
+    char *msg = g_strdup_printf("0x%" PRIx64 " reached, exiting\n", insn_vaddr);
+    int exit_code;
+
+    exit_code = GPOINTER_TO_INT(
+        g_hash_table_lookup(addrs_ht, GUINT_TO_POINTER(insn_vaddr)));
+
+    exit_emulation(exit_code, msg);
+}
+
+static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
+{
+    size_t tb_n = qemu_plugin_tb_n_insns(tb);
+    for (size_t i = 0; i < tb_n; i++) {
+        struct qemu_plugin_insn *insn = qemu_plugin_tb_get_insn(tb, i);
+        gpointer insn_vaddr = GUINT_TO_POINTER(qemu_plugin_insn_vaddr(insn));
+
+        if (exit_on_icount) {
+            /* Increment and check scoreboard for each instruction */
+            qemu_plugin_register_vcpu_insn_exec_inline_per_vcpu(
+                insn, QEMU_PLUGIN_INLINE_ADD_U64, insn_count, 1);
+            qemu_plugin_register_vcpu_insn_exec_cond_cb(
+                insn, exit_icount_reached, QEMU_PLUGIN_CB_NO_REGS,
+                QEMU_PLUGIN_COND_EQ, insn_count, icount + 1, insn_vaddr);
+        }
+
+        if (exit_on_address) {
+            if (g_hash_table_contains(addrs_ht, insn_vaddr)) {
+                /* Exit triggered by address */
+                qemu_plugin_register_vcpu_insn_exec_cb(
+                    insn, exit_address_reached, QEMU_PLUGIN_CB_NO_REGS,
+                    insn_vaddr);
+            }
+        }
+    }
+}
+
+static void plugin_exit(qemu_plugin_id_t id, void *p)
+{
+    g_hash_table_destroy(addrs_ht);
+    qemu_plugin_scoreboard_free(insn_count_sb);
+}
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
+                                           const qemu_info_t *info, int argc,
+                                           char **argv)
+{
+    addrs_ht = g_hash_table_new(NULL, g_direct_equal);
+
+    insn_count_sb = qemu_plugin_scoreboard_new(sizeof(InstructionsCount));
+    insn_count = qemu_plugin_scoreboard_u64_in_struct(
+        insn_count_sb, InstructionsCount, insn_count);
+
+    for (int i = 0; i < argc; i++) {
+        char *opt = argv[i];
+        g_auto(GStrv) tokens = g_strsplit(opt, "=", 2);
+        if (g_strcmp0(tokens[0], "icount") == 0) {
+            g_auto(GStrv) icount_tokens = g_strsplit(tokens[1], ":", 2);
+            icount = g_ascii_strtoull(icount_tokens[0], NULL, 0);
+            if (icount < 1 || g_strrstr(icount_tokens[0], "-") != NULL) {
+                fprintf(stderr,
+                        "icount parsing failed: '%s' must be a positive "
+                        "integer\n",
+                        icount_tokens[0]);
+                return -1;
+            }
+            if (icount_tokens[1]) {
+                icount_exit_code = g_ascii_strtoull(icount_tokens[1], NULL, 0);
+            }
+            exit_on_icount = true;
+        } else if (g_strcmp0(tokens[0], "addr") == 0) {
+            g_auto(GStrv) addr_tokens = g_strsplit(tokens[1], ":", 2);
+            uint64_t exit_addr = g_ascii_strtoull(addr_tokens[0], NULL, 0);
+            int exit_code = 0;
+            if (addr_tokens[1]) {
+                exit_code = g_ascii_strtoull(addr_tokens[1], NULL, 0);
+            }
+            g_hash_table_insert(addrs_ht, GUINT_TO_POINTER(exit_addr),
+                                GINT_TO_POINTER(exit_code));
+            exit_on_address = true;
+        } else {
+            fprintf(stderr, "option parsing failed: %s\n", opt);
+            return -1;
+        }
+    }
+
+    if (!exit_on_icount && !exit_on_address) {
+        fprintf(stderr, "'icount' or 'addr' argument missing\n");
+        return -1;
+    }
+
+    /* Register translation block and exit callbacks */
+    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
+    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
+
+    return 0;
+}
diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index 449ead1130..98a89d5c40 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -28,6 +28,7 @@ NAMES += hwprofile
 NAMES += cache
 NAMES += drcov
 NAMES += ips
+NAMES += stoptrigger
 
 ifeq ($(CONFIG_WIN32),y)
 SO_SUFFIX := .dll
-- 
2.39.2
