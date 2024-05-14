Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b0125bsm755843566b.143.2024.05.14.10.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 10:42:56 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 66CF15FA1C;
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
Subject: [PATCH 05/11] plugins: add new inline op STORE_U64
Date: Tue, 14 May 2024 18:42:47 +0100
Message-Id: <20240514174253.694591-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240514174253.694591-1-alex.bennee@linaro.org>
References: <20240514174253.694591-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: eOW8/vWbaJkN

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

This new operation can store an immediate u64 value to a given
scoreboard.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20240502211522.346467-4-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/plugin.h      |  1 +
 include/qemu/qemu-plugin.h |  4 ++--
 accel/tcg/plugin-gen.c     | 13 +++++++++++++
 plugins/core.c             |  6 ++++++
 4 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index 93da98b76c..6c21a30105 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -70,6 +70,7 @@ enum plugin_dyn_cb_type {
     PLUGIN_CB_REGULAR,
     PLUGIN_CB_MEM_REGULAR,
     PLUGIN_CB_INLINE_ADD_U64,
+    PLUGIN_CB_INLINE_STORE_U64,
 };
 
 /*
diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 4fc6c3739b..c5cac897a0 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -305,12 +305,12 @@ void qemu_plugin_register_vcpu_tb_exec_cb(struct qemu_plugin_tb *tb,
  * enum qemu_plugin_op - describes an inline op
  *
  * @QEMU_PLUGIN_INLINE_ADD_U64: add an immediate value uint64_t
- *
- * Note: currently only a single inline op is supported.
+ * @QEMU_PLUGIN_INLINE_STORE_U64: store an immediate value uint64_t
  */
 
 enum qemu_plugin_op {
     QEMU_PLUGIN_INLINE_ADD_U64,
+    QEMU_PLUGIN_INLINE_STORE_U64,
 };
 
 /**
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 97868781fe..88976289eb 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -145,6 +145,16 @@ static void gen_inline_add_u64_cb(struct qemu_plugin_dyn_cb *cb)
     tcg_temp_free_ptr(ptr);
 }
 
+static void gen_inline_store_u64_cb(struct qemu_plugin_dyn_cb *cb)
+{
+    TCGv_ptr ptr = gen_plugin_u64_ptr(cb->inline_insn.entry);
+    TCGv_i64 val = tcg_constant_i64(cb->inline_insn.imm);
+
+    tcg_gen_st_i64(val, ptr, 0);
+
+    tcg_temp_free_ptr(ptr);
+}
+
 static void gen_mem_cb(struct qemu_plugin_dyn_cb *cb,
                        qemu_plugin_meminfo_t meminfo, TCGv_i64 addr)
 {
@@ -170,6 +180,9 @@ static void inject_cb(struct qemu_plugin_dyn_cb *cb)
     case PLUGIN_CB_INLINE_ADD_U64:
         gen_inline_add_u64_cb(cb);
         break;
+    case PLUGIN_CB_INLINE_STORE_U64:
+        gen_inline_store_u64_cb(cb);
+        break;
     default:
         g_assert_not_reached();
     }
diff --git a/plugins/core.c b/plugins/core.c
index 59771eda8f..848d482fc4 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -321,6 +321,8 @@ static enum plugin_dyn_cb_type op_to_cb_type(enum qemu_plugin_op op)
     switch (op) {
     case QEMU_PLUGIN_INLINE_ADD_U64:
         return PLUGIN_CB_INLINE_ADD_U64;
+    case QEMU_PLUGIN_INLINE_STORE_U64:
+        return PLUGIN_CB_INLINE_STORE_U64;
     default:
         g_assert_not_reached();
     }
@@ -535,6 +537,9 @@ void exec_inline_op(struct qemu_plugin_dyn_cb *cb, int cpu_index)
     case QEMU_PLUGIN_INLINE_ADD_U64:
         *val += cb->inline_insn.imm;
         break;
+    case QEMU_PLUGIN_INLINE_STORE_U64:
+        *val = cb->inline_insn.imm;
+        break;
     default:
         g_assert_not_reached();
     }
@@ -562,6 +567,7 @@ void qemu_plugin_vcpu_mem_cb(CPUState *cpu, uint64_t vaddr,
                                    vaddr, cb->userp);
             break;
         case PLUGIN_CB_INLINE_ADD_U64:
+        case PLUGIN_CB_INLINE_STORE_U64:
             exec_inline_op(cb, cpu->cpu_index);
             break;
         default:
-- 
2.39.2
