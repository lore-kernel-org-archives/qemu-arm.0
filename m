Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id u16-20020a5d6ad0000000b0033b6e26f0f9sm8771598wrw.42.2024.02.26.09.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 09:02:45 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B4AE45F92D;
	Mon, 26 Feb 2024 16:56:48 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-riscv@nongnu.org,
	Michael Rolnik <mrolnik@gmail.com>,
	Song Gao <gaosong@loongson.cn>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Thomas Huth <thuth@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Yanan Wang <wangyanan55@huawei.com>,
	Brian Cain <bcain@quicinc.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Weiwei Li <liwei1518@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 20/27] plugins: create CPUPluginState and migrate plugin_mask
Date: Mon, 26 Feb 2024 16:56:39 +0000
Message-Id: <20240226165646.425600-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226165646.425600-1-alex.bennee@linaro.org>
References: <20240226165646.425600-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LqPF+wGOVQd/

As we expand the per-vCPU data for plugins we don't want to pollute
CPUState. For now this just moves the plugin_mask (renamed to
event_mask) as the memory callbacks are accessed directly by TCG
generated code.

Message-Id: <20240223162202.1936541-21-alex.bennee@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - checkpatch cleanups
---
 include/hw/core/cpu.h   | 11 +++++++----
 include/qemu/plugin.h   | 13 +++++++++++++
 include/qemu/typedefs.h |  1 +
 accel/tcg/plugin-gen.c  |  3 ++-
 hw/core/cpu-common.c    |  5 +++++
 plugins/core.c          | 13 ++++++++++---
 6 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 4b659799b00..af1a29526d4 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -31,7 +31,6 @@
 #include "qemu/rcu_queue.h"
 #include "qemu/queue.h"
 #include "qemu/thread.h"
-#include "qemu/plugin-event.h"
 #include "qom/object.h"
 
 typedef int (*WriteCoreDumpFunction)(const void *buf, size_t size,
@@ -434,7 +433,8 @@ struct qemu_work_item;
  * @kvm_fd: vCPU file descriptor for KVM.
  * @work_mutex: Lock to prevent multiple access to @work_list.
  * @work_list: List of pending asynchronous work.
- * @plugin_mask: Plugin event bitmap. Modified only via async work.
+ * @plugin_mem_cbs: active plugin memory callbacks
+ * @plugin_state: per-CPU plugin state
  * @ignore_memory_transaction_failures: Cached copy of the MachineState
  *    flag of the same name: allows the board to suppress calling of the
  *    CPU do_transaction_failed hook function.
@@ -526,10 +526,13 @@ struct CPUState {
     /* Use by accel-block: CPU is executing an ioctl() */
     QemuLockCnt in_ioctl_lock;
 
-    DECLARE_BITMAP(plugin_mask, QEMU_PLUGIN_EV_MAX);
-
 #ifdef CONFIG_PLUGIN
+    /*
+     * The callback pointer stays in the main CPUState as it is
+     * accessed via TCG (see gen_empty_mem_helper).
+     */
     GArray *plugin_mem_cbs;
+    CPUPluginState *plugin_state;
 #endif
 
     /* TODO Move common fields from CPUArchState here. */
diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index b0c5ac68293..b3c94a34aa4 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -186,6 +186,19 @@ struct qemu_plugin_insn *qemu_plugin_tb_insn_get(struct qemu_plugin_tb *tb,
     return insn;
 }
 
+/**
+ * struct CPUPluginState - per-CPU state for plugins
+ * @event_mask: plugin event bitmap. Modified only via async work.
+ */
+struct CPUPluginState {
+    DECLARE_BITMAP(event_mask, QEMU_PLUGIN_EV_MAX);
+};
+
+/**
+ * qemu_plugin_create_vcpu_state: allocate plugin state
+ */
+CPUPluginState *qemu_plugin_create_vcpu_state(void);
+
 void qemu_plugin_vcpu_init_hook(CPUState *cpu);
 void qemu_plugin_vcpu_exit_hook(CPUState *cpu);
 void qemu_plugin_tb_trans_cb(CPUState *cpu, struct qemu_plugin_tb *tb);
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index d7c703b4ae9..a028dba4d0b 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -42,6 +42,7 @@ typedef struct CompatProperty CompatProperty;
 typedef struct ConfidentialGuestSupport ConfidentialGuestSupport;
 typedef struct CPUAddressSpace CPUAddressSpace;
 typedef struct CPUArchState CPUArchState;
+typedef struct CPUPluginState CPUPluginState;
 typedef struct CpuInfoFast CpuInfoFast;
 typedef struct CPUJumpCache CPUJumpCache;
 typedef struct CPUState CPUState;
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index b37ce7683e6..ac6b52b9ec9 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -43,6 +43,7 @@
  * CPU's index into a TCG temp, since the first callback did it already.
  */
 #include "qemu/osdep.h"
+#include "qemu/plugin.h"
 #include "cpu.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-temp-internal.h"
@@ -831,7 +832,7 @@ bool plugin_gen_tb_start(CPUState *cpu, const DisasContextBase *db,
 {
     bool ret = false;
 
-    if (test_bit(QEMU_PLUGIN_EV_VCPU_TB_TRANS, cpu->plugin_mask)) {
+    if (test_bit(QEMU_PLUGIN_EV_VCPU_TB_TRANS, cpu->plugin_state->event_mask)) {
         struct qemu_plugin_tb *ptb = tcg_ctx->plugin_tb;
         int i;
 
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 68786360ea5..0108fb11dbc 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -194,10 +194,12 @@ static void cpu_common_parse_features(const char *typename, char *features,
     }
 }
 
+#ifdef CONFIG_PLUGIN
 static void qemu_plugin_vcpu_init__async(CPUState *cpu, run_on_cpu_data unused)
 {
     qemu_plugin_vcpu_init_hook(cpu);
 }
+#endif
 
 static void cpu_common_realizefn(DeviceState *dev, Error **errp)
 {
@@ -223,9 +225,12 @@ static void cpu_common_realizefn(DeviceState *dev, Error **errp)
     }
 
     /* Plugin initialization must wait until the cpu start executing code */
+#ifdef CONFIG_PLUGIN
     if (tcg_enabled()) {
+        cpu->plugin_state = qemu_plugin_create_vcpu_state();
         async_run_on_cpu(cpu, qemu_plugin_vcpu_init__async, RUN_ON_CPU_NULL);
     }
+#endif
 
     /* NOTE: latest generic point where the cpu is fully realized */
 }
diff --git a/plugins/core.c b/plugins/core.c
index 2392bbb8889..2db4d31354b 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -17,6 +17,7 @@
 #include "qapi/error.h"
 #include "qemu/lockable.h"
 #include "qemu/option.h"
+#include "qemu/plugin.h"
 #include "qemu/rcu_queue.h"
 #include "qemu/xxhash.h"
 #include "qemu/rcu.h"
@@ -53,7 +54,8 @@ struct qemu_plugin_ctx *plugin_id_to_ctx_locked(qemu_plugin_id_t id)
 
 static void plugin_cpu_update__async(CPUState *cpu, run_on_cpu_data data)
 {
-    bitmap_copy(cpu->plugin_mask, &data.host_ulong, QEMU_PLUGIN_EV_MAX);
+    bitmap_copy(cpu->plugin_state->event_mask,
+                &data.host_ulong, QEMU_PLUGIN_EV_MAX);
     tcg_flush_jmp_cache(cpu);
 }
 
@@ -208,6 +210,11 @@ plugin_register_cb_udata(qemu_plugin_id_t id, enum qemu_plugin_event ev,
     do_plugin_register_cb(id, ev, func, udata);
 }
 
+CPUPluginState *qemu_plugin_create_vcpu_state(void)
+{
+    return g_new0(CPUPluginState, 1);
+}
+
 void qemu_plugin_vcpu_init_hook(CPUState *cpu)
 {
     bool success;
@@ -356,7 +363,7 @@ qemu_plugin_vcpu_syscall(CPUState *cpu, int64_t num, uint64_t a1, uint64_t a2,
     struct qemu_plugin_cb *cb, *next;
     enum qemu_plugin_event ev = QEMU_PLUGIN_EV_VCPU_SYSCALL;
 
-    if (!test_bit(ev, cpu->plugin_mask)) {
+    if (!test_bit(ev, cpu->plugin_state->event_mask)) {
         return;
     }
 
@@ -378,7 +385,7 @@ void qemu_plugin_vcpu_syscall_ret(CPUState *cpu, int64_t num, int64_t ret)
     struct qemu_plugin_cb *cb, *next;
     enum qemu_plugin_event ev = QEMU_PLUGIN_EV_VCPU_SYSCALL_RET;
 
-    if (!test_bit(ev, cpu->plugin_mask)) {
+    if (!test_bit(ev, cpu->plugin_state->event_mask)) {
         return;
     }
 
-- 
2.39.2
