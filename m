Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id i8-20020a1c5408000000b003da065105c9sm13487wmb.40.2023.01.10.09.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 09:39:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C82001FFB8;
	Tue, 10 Jan 2023 17:39:25 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Ed Maste <emaste@freebsd.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Markus Armbruster <armbru@redhat.com>,
	Jagannathan Raman <jag.raman@oracle.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Michael Roth <michael.roth@amd.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	John G Johnson <john.g.johnson@oracle.com>,
	Emilio Cota <cota@braap.org>
Subject: [PATCH 23/26] plugins: fix optimization in plugin_gen_disable_mem_helpers
Date: Tue, 10 Jan 2023 17:39:19 +0000
Message-Id: <20230110173922.265055-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cleAXP5jbisp

From: Emilio Cota <cota@braap.org>

We were mistakenly checking tcg_ctx->plugin_insn as a canary to know
whether the TB had emitted helpers that might have accessed memory.

The problem is that tcg_ctx->plugin_insn gets updated on every
instruction in the TB, which results in us wrongly performing the
optimization (i.e. not clearing cpu->plugin_mem_cbs) way too often,
since it's not rare that the last instruction in the TB doesn't
use helpers.

Fix it by tracking a per-TB canary.

While at it, expand documentation.

Related: #1381

Signed-off-by: Emilio Cota <cota@braap.org>
Message-Id: <20230108164731.61469-2-cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/plugin.h  |  7 +++++++
 accel/tcg/plugin-gen.c | 26 ++++++++++++++++++--------
 2 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index a772e14193..e0ebedef84 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -118,7 +118,10 @@ struct qemu_plugin_insn {
     void *haddr;
     GArray *cbs[PLUGIN_N_CB_TYPES][PLUGIN_N_CB_SUBTYPES];
     bool calls_helpers;
+
+    /* if set, the instruction calls helpers that might access guest memory */
     bool mem_helper;
+
     bool mem_only;
 };
 
@@ -158,6 +161,10 @@ struct qemu_plugin_tb {
     void *haddr1;
     void *haddr2;
     bool mem_only;
+
+    /* if set, the TB calls helpers that might access guest memory */
+    bool mem_helper;
+
     GArray *cbs[PLUGIN_N_CB_SUBTYPES];
 };
 
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index c7d6514840..17a686bd9e 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -579,7 +579,8 @@ static void inject_mem_helper(TCGOp *begin_op, GArray *arr)
  * is possible that the code we generate after the instruction is
  * dead, we also add checks before generating tb_exit etc.
  */
-static void inject_mem_enable_helper(struct qemu_plugin_insn *plugin_insn,
+static void inject_mem_enable_helper(struct qemu_plugin_tb *ptb,
+                                     struct qemu_plugin_insn *plugin_insn,
                                      TCGOp *begin_op)
 {
     GArray *cbs[2];
@@ -599,6 +600,7 @@ static void inject_mem_enable_helper(struct qemu_plugin_insn *plugin_insn,
         rm_ops(begin_op);
         return;
     }
+    ptb->mem_helper = true;
 
     arr = g_array_sized_new(false, false,
                             sizeof(struct qemu_plugin_dyn_cb), n_cbs);
@@ -626,15 +628,22 @@ void plugin_gen_disable_mem_helpers(void)
 {
     TCGv_ptr ptr;
 
-    if (likely(tcg_ctx->plugin_insn == NULL ||
-               !tcg_ctx->plugin_insn->mem_helper)) {
+    /*
+     * We could emit the clearing unconditionally and be done. However, this can
+     * be wasteful if for instance plugins don't track memory accesses, or if
+     * most TBs don't use helpers. Instead, emit the clearing iff the TB calls
+     * helpers that might access guest memory.
+     *
+     * Note: we do not reset plugin_tb->mem_helper here; a TB might have several
+     * exit points, and we want to emit the clearing from all of them.
+     */
+    if (!tcg_ctx->plugin_tb->mem_helper) {
         return;
     }
     ptr = tcg_const_ptr(NULL);
     tcg_gen_st_ptr(ptr, cpu_env, offsetof(CPUState, plugin_mem_cbs) -
                                  offsetof(ArchCPU, env));
     tcg_temp_free_ptr(ptr);
-    tcg_ctx->plugin_insn->mem_helper = false;
 }
 
 static void plugin_gen_tb_udata(const struct qemu_plugin_tb *ptb,
@@ -682,14 +691,14 @@ static void plugin_gen_mem_inline(const struct qemu_plugin_tb *ptb,
     inject_inline_cb(cbs, begin_op, op_rw);
 }
 
-static void plugin_gen_enable_mem_helper(const struct qemu_plugin_tb *ptb,
+static void plugin_gen_enable_mem_helper(struct qemu_plugin_tb *ptb,
                                          TCGOp *begin_op, int insn_idx)
 {
     struct qemu_plugin_insn *insn = g_ptr_array_index(ptb->insns, insn_idx);
-    inject_mem_enable_helper(insn, begin_op);
+    inject_mem_enable_helper(ptb, insn, begin_op);
 }
 
-static void plugin_gen_disable_mem_helper(const struct qemu_plugin_tb *ptb,
+static void plugin_gen_disable_mem_helper(struct qemu_plugin_tb *ptb,
                                           TCGOp *begin_op, int insn_idx)
 {
     struct qemu_plugin_insn *insn = g_ptr_array_index(ptb->insns, insn_idx);
@@ -750,7 +759,7 @@ static void pr_ops(void)
 #endif
 }
 
-static void plugin_gen_inject(const struct qemu_plugin_tb *plugin_tb)
+static void plugin_gen_inject(struct qemu_plugin_tb *plugin_tb)
 {
     TCGOp *op;
     int insn_idx = -1;
@@ -870,6 +879,7 @@ bool plugin_gen_tb_start(CPUState *cpu, const DisasContextBase *db,
         ptb->haddr1 = db->host_addr[0];
         ptb->haddr2 = NULL;
         ptb->mem_only = mem_only;
+        ptb->mem_helper = false;
 
         plugin_gen_empty_callback(PLUGIN_GEN_FROM_TB);
     }
-- 
2.34.1
