Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 26-20020a05600c029a00b004128e903b2csm2803955wmk.39.2024.02.23.08.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 08:28:47 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 72A2C5F935;
	Fri, 23 Feb 2024 16:22:04 +0000 (GMT)
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
Subject: [PATCH v2 20/27] plugins: create CPUPluginState and migrate plugin_mask
Date: Fri, 23 Feb 2024 16:21:55 +0000
Message-Id: <20240223162202.1936541-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240223162202.1936541-1-alex.bennee@linaro.org>
References: <20240223162202.1936541-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0sJzCXzyzK40

We are going to want to keep track of some per-vCPU data for plugins
and the logical place to do so is in track it in CPUState. For now
this just moves the plugin_mask (renamed to event_mask) as the memory
callbacks are accessed directly by TCG generated code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/core/cpu.h   | 11 +++++++----
 include/qemu/plugin.h   | 13 +++++++++++++
 include/qemu/typedefs.h |  1 +
 accel/tcg/plugin-gen.c  |  3 ++-
 hw/core/cpu-common.c    |  1 +
 plugins/core.c          | 12 +++++++++---
 6 files changed, 33 insertions(+), 8 deletions(-)

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
index b0c5ac68293..0e7b9693d80 100644
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
+CPUPluginState * qemu_plugin_create_vcpu_state(void);
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
index 68786360ea5..6a8c290fc75 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -224,6 +224,7 @@ static void cpu_common_realizefn(DeviceState *dev, Error **errp)
 
     /* Plugin initialization must wait until the cpu start executing code */
     if (tcg_enabled()) {
+        cpu->plugin_state = qemu_plugin_create_vcpu_state();
         async_run_on_cpu(cpu, qemu_plugin_vcpu_init__async, RUN_ON_CPU_NULL);
     }
 
diff --git a/plugins/core.c b/plugins/core.c
index 2392bbb8889..83745663f32 100644
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
@@ -53,7 +54,7 @@ struct qemu_plugin_ctx *plugin_id_to_ctx_locked(qemu_plugin_id_t id)
 
 static void plugin_cpu_update__async(CPUState *cpu, run_on_cpu_data data)
 {
-    bitmap_copy(cpu->plugin_mask, &data.host_ulong, QEMU_PLUGIN_EV_MAX);
+    bitmap_copy(cpu->plugin_state->event_mask, &data.host_ulong, QEMU_PLUGIN_EV_MAX);
     tcg_flush_jmp_cache(cpu);
 }
 
@@ -208,6 +209,11 @@ plugin_register_cb_udata(qemu_plugin_id_t id, enum qemu_plugin_event ev,
     do_plugin_register_cb(id, ev, func, udata);
 }
 
+CPUPluginState * qemu_plugin_create_vcpu_state(void)
+{
+    return g_new0(CPUPluginState, 1);
+}
+
 void qemu_plugin_vcpu_init_hook(CPUState *cpu)
 {
     bool success;
@@ -356,7 +362,7 @@ qemu_plugin_vcpu_syscall(CPUState *cpu, int64_t num, uint64_t a1, uint64_t a2,
     struct qemu_plugin_cb *cb, *next;
     enum qemu_plugin_event ev = QEMU_PLUGIN_EV_VCPU_SYSCALL;
 
-    if (!test_bit(ev, cpu->plugin_mask)) {
+    if (!test_bit(ev, cpu->plugin_state->event_mask)) {
         return;
     }
 
@@ -378,7 +384,7 @@ void qemu_plugin_vcpu_syscall_ret(CPUState *cpu, int64_t num, int64_t ret)
     struct qemu_plugin_cb *cb, *next;
     enum qemu_plugin_event ev = QEMU_PLUGIN_EV_VCPU_SYSCALL_RET;
 
-    if (!test_bit(ev, cpu->plugin_mask)) {
+    if (!test_bit(ev, cpu->plugin_state->event_mask)) {
         return;
     }
 
-- 
2.39.2
