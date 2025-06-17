Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a73845sm14651906f8f.35.2025.06.17.09.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:33:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id C30215F91D;
	Tue, 17 Jun 2025 17:33:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
	qemu-arm@nongnu.org,
	Mark Burton <mburton@qti.qualcomm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 09/11] kvm/arm: implement sysreg trap handler
Date: Tue, 17 Jun 2025 17:33:49 +0100
Message-ID: <20250617163351.2640572-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250617163351.2640572-1-alex.bennee@linaro.org>
References: <20250617163351.2640572-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: B4+Mc8bDuN/g

Fortunately all the information about which sysreg is being accessed
should be in the ISS field of the ESR. Once we process that we can
figure out what we need to do.

[AJB: the read/write stuff should probably go into a shared helper].

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/kvm.c        | 95 +++++++++++++++++++++++++++++++++++++++++
 target/arm/trace-events |  2 +
 2 files changed, 97 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index f2255cfdc8..0a852af126 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -24,6 +24,7 @@
 #include "system/runstate.h"
 #include "system/kvm.h"
 #include "system/kvm_int.h"
+#include "cpregs.h"
 #include "kvm_arm.h"
 #include "cpu.h"
 #include "trace.h"
@@ -1414,6 +1415,98 @@ static bool kvm_arm_handle_debug(ARMCPU *cpu,
     return false;
 }
 
+/*
+ * To handle system register traps we should be able to extract the
+ * encoding from the ISS encoding and go from there.
+ */
+static int kvm_arm_handle_sysreg_trap(ARMCPU *cpu,
+                                      uint64_t esr_iss,
+                                      uint64_t elr)
+{
+    int op0 = extract32(esr_iss, 20, 2);
+    int op2 = extract32(esr_iss, 17, 3);
+    int op1 = extract32(esr_iss, 14, 3);
+    int crn = extract32(esr_iss, 10, 4);
+    int rt = extract32(esr_iss, 5, 5);
+    int crm = extract32(esr_iss, 1, 4);
+    bool is_read = extract32(esr_iss, 0, 1);
+
+    uint32_t key = ENCODE_AA64_CP_REG(CP_REG_ARM64_SYSREG_CP, crn, crm, op0, op1, op2);
+    const ARMCPRegInfo *ri = get_arm_cp_reginfo(cpu->cp_regs, key);
+
+    if (ri) {
+        CPUARMState *env = &cpu->env;
+        uint64_t val = 0;
+        bool take_bql = ri->type & ARM_CP_IO;
+
+        if (ri->accessfn) {
+            if (ri->accessfn(env, ri, true) != CP_ACCESS_OK) {
+                g_assert_not_reached();
+            }
+        }
+
+        if (take_bql) {
+            bql_lock();
+        }
+
+        if (is_read) {
+            if (ri->type & ARM_CP_CONST) {
+                val = ri->resetvalue;
+            } else if (ri->readfn) {
+                val = ri->readfn(env, ri);
+            } else {
+                val = CPREG_FIELD64(env, ri);
+            }
+            trace_kvm_sysreg_read(ri->name, val);
+
+            if (rt < 31) {
+                env->xregs[rt] = val;
+            } else {
+                /* this would be deeply weird */
+                g_assert_not_reached();
+            }
+        } else {
+            /* x31 == zero reg */
+            if (rt < 31) {
+                val = env->xregs[rt];
+            }
+
+            if (ri->writefn) {
+                ri->writefn(env, ri, val);
+            } else {
+                CPREG_FIELD64(env, ri) = val;
+            }
+            trace_kvm_sysreg_write(ri->name, val);
+        }
+
+        if (take_bql) {
+            bql_unlock();
+        }
+
+        /*
+         * Set PC to return.
+         *
+         * Note we elr_el2 doesn't seem to be what we need so lets
+         * rely on env->pc being correct.
+         *
+         * TODO We currently skip to the next instruction
+         * unconditionally but that is at odds with the kernels code
+         * which only does that conditionally (see kvm_handle_sys_reg
+         * -> perform_access):
+         *
+         *    if (likely(r->access(vcpu, params, r)))
+         *        kvm_incr_pc(vcpu);
+         *
+         */
+        env->pc = env->pc + 4;
+        return 0;
+    }
+
+    fprintf(stderr, "%s: @ %" PRIx64 " failed to find sysreg crn:%d crm:%d op0:%d op1:%d op2:%d\n",
+            __func__, elr, crn, crm, op0, op1, op2);
+    return -1;
+}
+
 /**
  * kvm_arm_handle_hard_trap:
  * @cpu: ARMCPU
@@ -1443,6 +1536,8 @@ static int kvm_arm_handle_hard_trap(ARMCPU *cpu,
     kvm_cpu_synchronize_state(cs);
 
     switch (esr_ec) {
+    case EC_SYSTEMREGISTERTRAP:
+        return kvm_arm_handle_sysreg_trap(cpu, esr_iss, elr);
     default:
         qemu_log_mask(LOG_UNIMP, "%s: unhandled EC: %x/%x/%x/%d\n",
                 __func__, esr_ec, esr_iss, esr_iss2, esr_il);
diff --git a/target/arm/trace-events b/target/arm/trace-events
index 4438dce7be..69bb4d370d 100644
--- a/target/arm/trace-events
+++ b/target/arm/trace-events
@@ -13,3 +13,5 @@ arm_gt_update_irq(int timer, int irqstate) "gt_update_irq: timer %d irqstate %d"
 
 # kvm.c
 kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is translated into 0x%"PRIx64
+kvm_sysreg_read(const char *name, uint64_t val) "%s => 0x%" PRIx64
+kvm_sysreg_write(const char *name, uint64_t val) "%s <=  0x%" PRIx64
-- 
2.47.2
