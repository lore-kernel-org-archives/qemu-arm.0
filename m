Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781cf7bsm741293766b.40.2024.05.14.10.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 10:42:56 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7E0885FA28;
	Tue, 14 May 2024 18:42:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PATCH 06/11] tests/plugin/inline: add test for STORE_U64 inline op
Date: Tue, 14 May 2024 18:42:48 +0100
Message-Id: <20240514174253.694591-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240514174253.694591-1-alex.bennee@linaro.org>
References: <20240514174253.694591-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kGjdfk8UvmMT

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20240502211522.346467-5-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/plugin/inline.c | 41 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/tests/plugin/inline.c b/tests/plugin/inline.c
index 0163e9b51c..103c3a22f6 100644
--- a/tests/plugin/inline.c
+++ b/tests/plugin/inline.c
@@ -22,6 +22,12 @@ typedef struct {
     uint64_t count_mem_inline;
 } CPUCount;
 
+typedef struct {
+    uint64_t data_insn;
+    uint64_t data_tb;
+    uint64_t data_mem;
+} CPUData;
+
 static struct qemu_plugin_scoreboard *counts;
 static qemu_plugin_u64 count_tb;
 static qemu_plugin_u64 count_tb_inline;
@@ -29,6 +35,10 @@ static qemu_plugin_u64 count_insn;
 static qemu_plugin_u64 count_insn_inline;
 static qemu_plugin_u64 count_mem;
 static qemu_plugin_u64 count_mem_inline;
+static struct qemu_plugin_scoreboard *data;
+static qemu_plugin_u64 data_insn;
+static qemu_plugin_u64 data_tb;
+static qemu_plugin_u64 data_mem;
 
 static uint64_t global_count_tb;
 static uint64_t global_count_insn;
@@ -109,11 +119,13 @@ static void plugin_exit(qemu_plugin_id_t id, void *udata)
     stats_mem();
 
     qemu_plugin_scoreboard_free(counts);
+    qemu_plugin_scoreboard_free(data);
 }
 
 static void vcpu_tb_exec(unsigned int cpu_index, void *udata)
 {
     qemu_plugin_u64_add(count_tb, cpu_index, 1);
+    g_assert(qemu_plugin_u64_get(data_tb, cpu_index) == (uintptr_t) udata);
     g_mutex_lock(&tb_lock);
     max_cpu_index = MAX(max_cpu_index, cpu_index);
     global_count_tb++;
@@ -123,6 +135,7 @@ static void vcpu_tb_exec(unsigned int cpu_index, void *udata)
 static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
 {
     qemu_plugin_u64_add(count_insn, cpu_index, 1);
+    g_assert(qemu_plugin_u64_get(data_insn, cpu_index) == (uintptr_t) udata);
     g_mutex_lock(&insn_lock);
     global_count_insn++;
     g_mutex_unlock(&insn_lock);
@@ -131,9 +144,10 @@ static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
 static void vcpu_mem_access(unsigned int cpu_index,
                             qemu_plugin_meminfo_t info,
                             uint64_t vaddr,
-                            void *userdata)
+                            void *udata)
 {
     qemu_plugin_u64_add(count_mem, cpu_index, 1);
+    g_assert(qemu_plugin_u64_get(data_mem, cpu_index) == (uintptr_t) udata);
     g_mutex_lock(&mem_lock);
     global_count_mem++;
     g_mutex_unlock(&mem_lock);
@@ -141,20 +155,34 @@ static void vcpu_mem_access(unsigned int cpu_index,
 
 static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
 {
+    void *tb_store = tb;
+    qemu_plugin_register_vcpu_tb_exec_inline_per_vcpu(
+        tb, QEMU_PLUGIN_INLINE_STORE_U64, data_tb, (uintptr_t) tb_store);
     qemu_plugin_register_vcpu_tb_exec_cb(
-        tb, vcpu_tb_exec, QEMU_PLUGIN_CB_NO_REGS, 0);
+        tb, vcpu_tb_exec, QEMU_PLUGIN_CB_NO_REGS, tb_store);
     qemu_plugin_register_vcpu_tb_exec_inline_per_vcpu(
         tb, QEMU_PLUGIN_INLINE_ADD_U64, count_tb_inline, 1);
 
     for (int idx = 0; idx < qemu_plugin_tb_n_insns(tb); ++idx) {
         struct qemu_plugin_insn *insn = qemu_plugin_tb_get_insn(tb, idx);
+        void *insn_store = insn;
+        void *mem_store = (char *)insn_store + 0xff;
+
+        qemu_plugin_register_vcpu_insn_exec_inline_per_vcpu(
+            insn, QEMU_PLUGIN_INLINE_STORE_U64, data_insn,
+            (uintptr_t) insn_store);
         qemu_plugin_register_vcpu_insn_exec_cb(
-            insn, vcpu_insn_exec, QEMU_PLUGIN_CB_NO_REGS, 0);
+            insn, vcpu_insn_exec, QEMU_PLUGIN_CB_NO_REGS, insn_store);
         qemu_plugin_register_vcpu_insn_exec_inline_per_vcpu(
             insn, QEMU_PLUGIN_INLINE_ADD_U64, count_insn_inline, 1);
+
+        qemu_plugin_register_vcpu_mem_inline_per_vcpu(
+            insn, QEMU_PLUGIN_MEM_RW,
+            QEMU_PLUGIN_INLINE_STORE_U64,
+            data_mem, (uintptr_t) mem_store);
         qemu_plugin_register_vcpu_mem_cb(insn, &vcpu_mem_access,
                                          QEMU_PLUGIN_CB_NO_REGS,
-                                         QEMU_PLUGIN_MEM_RW, 0);
+                                         QEMU_PLUGIN_MEM_RW, mem_store);
         qemu_plugin_register_vcpu_mem_inline_per_vcpu(
             insn, QEMU_PLUGIN_MEM_RW,
             QEMU_PLUGIN_INLINE_ADD_U64,
@@ -179,6 +207,11 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
         counts, CPUCount, count_insn_inline);
     count_mem_inline = qemu_plugin_scoreboard_u64_in_struct(
         counts, CPUCount, count_mem_inline);
+    data = qemu_plugin_scoreboard_new(sizeof(CPUData));
+    data_insn = qemu_plugin_scoreboard_u64_in_struct(data, CPUData, data_insn);
+    data_tb = qemu_plugin_scoreboard_u64_in_struct(data, CPUData, data_tb);
+    data_mem = qemu_plugin_scoreboard_u64_in_struct(data, CPUData, data_mem);
+
     qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
     qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
 
-- 
2.39.2
