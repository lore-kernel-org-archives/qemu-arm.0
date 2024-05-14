Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7fcfsm738917166b.119.2024.05.14.10.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 10:42:59 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 0ABD65FA2D;
	Tue, 14 May 2024 18:42:55 +0100 (BST)
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
Subject: [PATCH 11/11] plugins: remove op from qemu_plugin_inline_cb
Date: Tue, 14 May 2024 18:42:53 +0100
Message-Id: <20240514174253.694591-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240514174253.694591-1-alex.bennee@linaro.org>
References: <20240514174253.694591-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NPBWWLxqim/T

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

This field is not needed as the callback type already holds this
information.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20240502211522.346467-10-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/plugin.h |  1 -
 plugins/plugin.h      |  4 +++-
 plugins/core.c        | 13 +++++++------
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index 98d27dded9..796fc13706 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -83,7 +83,6 @@ struct qemu_plugin_regular_cb {
 
 struct qemu_plugin_inline_cb {
     qemu_plugin_u64 entry;
-    enum qemu_plugin_op op;
     uint64_t imm;
     enum qemu_plugin_mem_rw rw;
 };
diff --git a/plugins/plugin.h b/plugins/plugin.h
index 80d5daa917..30e2299a54 100644
--- a/plugins/plugin.h
+++ b/plugins/plugin.h
@@ -108,7 +108,9 @@ void plugin_register_vcpu_mem_cb(GArray **arr,
                                  enum qemu_plugin_mem_rw rw,
                                  void *udata);
 
-void exec_inline_op(struct qemu_plugin_inline_cb *cb, int cpu_index);
+void exec_inline_op(enum plugin_dyn_cb_type type,
+                    struct qemu_plugin_inline_cb *cb,
+                    int cpu_index);
 
 int plugin_num_vcpus(void);
 
diff --git a/plugins/core.c b/plugins/core.c
index 1c85edc5e5..0726bc7f25 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -338,7 +338,6 @@ void plugin_register_inline_op_on_entry(GArray **arr,
 
     struct qemu_plugin_inline_cb inline_cb = { .rw = rw,
                                                .entry = entry,
-                                               .op = op,
                                                .imm = imm };
     dyn_cb = plugin_get_dyn_cb(arr);
     dyn_cb->type = op_to_cb_type(op);
@@ -557,7 +556,9 @@ void qemu_plugin_flush_cb(void)
     plugin_cb__simple(QEMU_PLUGIN_EV_FLUSH);
 }
 
-void exec_inline_op(struct qemu_plugin_inline_cb *cb, int cpu_index)
+void exec_inline_op(enum plugin_dyn_cb_type type,
+                    struct qemu_plugin_inline_cb *cb,
+                    int cpu_index)
 {
     char *ptr = cb->entry.score->data->data;
     size_t elem_size = g_array_get_element_size(
@@ -565,11 +566,11 @@ void exec_inline_op(struct qemu_plugin_inline_cb *cb, int cpu_index)
     size_t offset = cb->entry.offset;
     uint64_t *val = (uint64_t *)(ptr + offset + cpu_index * elem_size);
 
-    switch (cb->op) {
-    case QEMU_PLUGIN_INLINE_ADD_U64:
+    switch (type) {
+    case PLUGIN_CB_INLINE_ADD_U64:
         *val += cb->imm;
         break;
-    case QEMU_PLUGIN_INLINE_STORE_U64:
+    case PLUGIN_CB_INLINE_STORE_U64:
         *val = cb->imm;
         break;
     default:
@@ -601,7 +602,7 @@ void qemu_plugin_vcpu_mem_cb(CPUState *cpu, uint64_t vaddr,
         case PLUGIN_CB_INLINE_ADD_U64:
         case PLUGIN_CB_INLINE_STORE_U64:
             if (rw && cb->inline_insn.rw) {
-                exec_inline_op(&cb->inline_insn, cpu->cpu_index);
+                exec_inline_op(cb->type, &cb->inline_insn, cpu->cpu_index);
             }
             break;
         default:
-- 
2.39.2
