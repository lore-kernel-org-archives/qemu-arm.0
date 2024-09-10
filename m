Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d258339a2sm494195966b.19.2024.09.10.07.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 07:13:47 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 315E7634BF;
	Tue, 10 Sep 2024 15:07:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	Zhao Liu <zhao1.liu@intel.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	devel@lists.libvirt.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Rowan Hart <rowanbhart@gmail.com>
Subject: [PATCH 25/26] plugins: add option to dump write argument to syscall plugin
Date: Tue, 10 Sep 2024 15:07:32 +0100
Message-Id: <20240910140733.4007719-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910140733.4007719-1-alex.bennee@linaro.org>
References: <20240910140733.4007719-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 90UgG+N2Nr7q

From: Rowan Hart <rowanbhart@gmail.com>

Signed-off-by: Rowan Hart <rowanbhart@gmail.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Tested-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20240827215329.248434-3-rowanbhart@gmail.com>
[AJB: tweak fmt string for vaddr]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
vAJB
  - tweak fmt string for PRIu64
---
 docs/about/emulation.rst    |  14 ++++-
 tests/tcg/plugins/syscall.c | 117 ++++++++++++++++++++++++++++++++++++
 2 files changed, 130 insertions(+), 1 deletion(-)

diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
index a4470127c9..23e4949049 100644
--- a/docs/about/emulation.rst
+++ b/docs/about/emulation.rst
@@ -418,6 +418,19 @@ run::
   160          1      0
   135          1      0
 
+Behaviour can be tweaked with the following arguments:
+
+.. list-table:: Syscall plugin arguments
+  :widths: 20 80
+  :header-rows: 1
+
+  * - Option
+    - Description
+  * - print=true|false
+    - Print the number of times each syscall is called
+  * - log_writes=true|false
+    - Log the buffer of each write syscall in hexdump format
+
 Test inline operations
 ......................
 
@@ -807,4 +820,3 @@ Other emulation features
 When running system emulation you can also enable deterministic
 execution which allows for repeatable record/replay debugging. See
 :ref:`Record/Replay<replay>` for more details.
-
diff --git a/tests/tcg/plugins/syscall.c b/tests/tcg/plugins/syscall.c
index 72e1a5bf90..647f478090 100644
--- a/tests/tcg/plugins/syscall.c
+++ b/tests/tcg/plugins/syscall.c
@@ -22,8 +22,57 @@ typedef struct {
     int64_t errors;
 } SyscallStats;
 
+struct SyscallInfo {
+    const char *name;
+    int64_t write_sysno;
+};
+
+const struct SyscallInfo arch_syscall_info[] = {
+    { "aarch64", 64 },
+    { "aarch64_be", 64 },
+    { "alpha", 4 },
+    { "arm", 4 },
+    { "armeb", 4 },
+    { "avr", -1 },
+    { "cris", -1 },
+    { "hexagon", 64 },
+    { "hppa", -1 },
+    { "i386", 4 },
+    { "loongarch64", -1 },
+    { "m68k", 4 },
+    { "microblaze", 4 },
+    { "microblazeel", 4 },
+    { "mips", 1 },
+    { "mips64", 1 },
+    { "mips64el", 1 },
+    { "mipsel", 1 },
+    { "mipsn32", 1 },
+    { "mipsn32el", 1 },
+    { "or1k", -1 },
+    { "ppc", 4 },
+    { "ppc64", 4 },
+    { "ppc64le", 4 },
+    { "riscv32", 64 },
+    { "riscv64", 64 },
+    { "rx", -1 },
+    { "s390x", -1 },
+    { "sh4", -1 },
+    { "sh4eb", -1 },
+    { "sparc", 4 },
+    { "sparc32plus", 4 },
+    { "sparc64", 4 },
+    { "tricore", -1 },
+    { "x86_64", 1 },
+    { "xtensa", 13 },
+    { "xtensaeb", 13 },
+    { NULL, -1 },
+};
+
 static GMutex lock;
 static GHashTable *statistics;
+static GByteArray *memory_buffer;
+static bool do_log_writes;
+static int64_t write_sysno = -1;
 
 static SyscallStats *get_or_create_entry(int64_t num)
 {
@@ -39,6 +88,44 @@ static SyscallStats *get_or_create_entry(int64_t num)
     return entry;
 }
 
+/*
+ * Hex-dump a GByteArray to the QEMU plugin output in the format:
+ * 61 63 63 65 6c 09 09 20 20 20 66 70 75 09 09 09  | accel.....fpu...
+ * 20 6d 6f 64 75 6c 65 2d 63 6f 6d 6d 6f 6e 2e 63  | .module-common.c
+ */
+static void hexdump(const GByteArray *data)
+{
+    g_autoptr(GString) out = g_string_new("");
+
+    for (guint index = 0; index < data->len; index += 16) {
+        for (guint col = 0; col < 16; col++) {
+            if (index + col < data->len) {
+                g_string_append_printf(out, "%02x ", data->data[index + col]);
+            } else {
+                g_string_append(out, "   ");
+            }
+        }
+
+        g_string_append(out, " | ");
+
+        for (guint col = 0; col < 16; col++) {
+            if (index + col >= data->len) {
+                break;
+            }
+
+            if (g_ascii_isgraph(data->data[index + col])) {
+                g_string_append_printf(out, "%c", data->data[index + col]);
+            } else {
+                g_string_append(out, ".");
+            }
+        }
+
+        g_string_append(out, "\n");
+    }
+
+    qemu_plugin_outs(out->str);
+}
+
 static void vcpu_syscall(qemu_plugin_id_t id, unsigned int vcpu_index,
                          int64_t num, uint64_t a1, uint64_t a2,
                          uint64_t a3, uint64_t a4, uint64_t a5,
@@ -54,6 +141,14 @@ static void vcpu_syscall(qemu_plugin_id_t id, unsigned int vcpu_index,
         g_autofree gchar *out = g_strdup_printf("syscall #%" PRIi64 "\n", num);
         qemu_plugin_outs(out);
     }
+
+    if (do_log_writes && num == write_sysno) {
+        if (qemu_plugin_read_memory_vaddr(a2, memory_buffer, a3)) {
+            hexdump(memory_buffer);
+        } else {
+            fprintf(stderr, "Error reading memory from vaddr %"PRIu64"\n", a2);
+        }
+    }
 }
 
 static void vcpu_syscall_ret(qemu_plugin_id_t id, unsigned int vcpu_idx,
@@ -127,6 +222,10 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
             if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_print)) {
                 fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
             }
+        } else if (g_strcmp0(tokens[0], "log_writes") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_log_writes)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+            }
         } else {
             fprintf(stderr, "unsupported argument: %s\n", argv[i]);
             return -1;
@@ -137,6 +236,24 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
         statistics = g_hash_table_new_full(NULL, g_direct_equal, NULL, g_free);
     }
 
+    if (do_log_writes) {
+        for (const struct SyscallInfo *syscall_info = arch_syscall_info;
+            syscall_info->name != NULL; syscall_info++) {
+
+            if (g_strcmp0(syscall_info->name, info->target_name) == 0) {
+                write_sysno = syscall_info->write_sysno;
+                break;
+            }
+        }
+
+        if (write_sysno == -1) {
+            fprintf(stderr, "write syscall number not found\n");
+            return -1;
+        }
+
+        memory_buffer = g_byte_array_new();
+    }
+
     qemu_plugin_register_vcpu_syscall_cb(id, vcpu_syscall);
     qemu_plugin_register_vcpu_syscall_ret_cb(id, vcpu_syscall_ret);
     qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
-- 
2.39.2
