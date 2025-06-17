Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a68b0esm14233217f8f.29.2025.06.17.09.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:33:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A920F5F914;
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
Subject: [RFC PATCH 08/11] kvm/arm: plumb in a basic trap harder handler
Date: Tue, 17 Jun 2025 17:33:48 +0100
Message-ID: <20250617163351.2640572-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250617163351.2640572-1-alex.bennee@linaro.org>
References: <20250617163351.2640572-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZSoflYdtYHDG

Currently we do nothing but report we don't handle anything and let
KVM come to a halt.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h |  4 ++++
 target/arm/kvm-stub.c |  5 +++++
 target/arm/kvm.c      | 44 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 3244e0740d..29b95bdd36 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -88,6 +88,10 @@ typedef enum {
 #define ARM_EL_ISV_SHIFT 24
 #define ARM_EL_IL (1 << ARM_EL_IL_SHIFT)
 #define ARM_EL_ISV (1 << ARM_EL_ISV_SHIFT)
+#define ARM_EL_ISS_SHIFT 0
+#define ARM_EL_ISS_LENGTH 25
+#define ARM_EL_ISS2_SHIFT 32
+#define ARM_EL_ISS2_LENGTH 24
 
 /* In the Data Abort syndrome */
 #define ARM_EL_VNCR (1 << 13)
diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index 34e57fab01..765efb1848 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -60,6 +60,11 @@ void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
     g_assert_not_reached();
 }
 
+int kvm_arm_get_type(MachineState *ms)
+{
+    g_assert_not_reached();
+}
+
 int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa)
 {
     g_assert_not_reached();
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index c5374d12cf..f2255cfdc8 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1414,6 +1414,43 @@ static bool kvm_arm_handle_debug(ARMCPU *cpu,
     return false;
 }
 
+/**
+ * kvm_arm_handle_hard_trap:
+ * @cpu: ARMCPU
+ * @esr: full exception state register
+ * @elr: exception link return address
+ * @far: fault address (if used)
+ *
+ * Returns: 0 if the exception has been handled, < 0 otherwise
+ */
+static int kvm_arm_handle_hard_trap(ARMCPU *cpu,
+                                    uint64_t esr,
+                                    uint64_t elr,
+                                    uint64_t far)
+{
+    CPUState *cs = CPU(cpu);
+    int esr_ec = extract64(esr, ARM_EL_EC_SHIFT, ARM_EL_EC_LENGTH);
+    int esr_iss = extract64(esr, ARM_EL_ISS_SHIFT, ARM_EL_ISS_LENGTH);
+    int esr_iss2 = extract64(esr, ARM_EL_ISS2_SHIFT, ARM_EL_ISS2_LENGTH);
+    int esr_il = extract64(esr, ARM_EL_IL_SHIFT, 1);
+
+    /*
+     * Ensure register state is synchronised
+     *
+     * This sets vcpu->vcpu_dirty which should ensure the registers
+     * are synced back to KVM before we restart.
+     */
+    kvm_cpu_synchronize_state(cs);
+
+    switch (esr_ec) {
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: unhandled EC: %x/%x/%x/%d\n",
+                __func__, esr_ec, esr_iss, esr_iss2, esr_il);
+        return -1;
+    }
+}
+
+
 int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -1430,9 +1467,16 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
         ret = kvm_arm_handle_dabt_nisv(cpu, run->arm_nisv.esr_iss,
                                        run->arm_nisv.fault_ipa);
         break;
+    case KVM_EXIT_ARM_TRAP_HARDER:
+        ret = kvm_arm_handle_hard_trap(cpu,
+                                       run->arm_trap_harder.esr,
+                                       run->arm_trap_harder.elr,
+                                       run->arm_trap_harder.far);
+        break;
     default:
         qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
                       __func__, run->exit_reason);
+        ret = -1;
         break;
     }
     return ret;
-- 
2.47.2
