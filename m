Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b090b0sm14359958f8f.46.2025.06.17.09.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:33:58 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 01A2B5F929;
	Tue, 17 Jun 2025 17:33:53 +0100 (BST)
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
Subject: [RFC PATCH 11/11] kvm/arm: implement WFx traps for KVM
Date: Tue, 17 Jun 2025 17:33:51 +0100
Message-ID: <20250617163351.2640572-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250617163351.2640572-1-alex.bennee@linaro.org>
References: <20250617163351.2640572-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2hv/rrD59fGq

This allows the vCPU guest core to go to sleep on a WFx instruction.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/kvm.c        | 28 ++++++++++++++++++++++++++++
 target/arm/trace-events |  1 +
 2 files changed, 29 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 1280e2c1e8..63ba8573a2 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1544,6 +1544,32 @@ static int kvm_arm_handle_hypercall(ARMCPU *cpu,
     return 0;
 }
 
+/*
+ * It would be perfectly fine to immediately return from any WFE/WFI
+ * trap however that would mean we spend a lot of time bouncing
+ * between the hypervisor and QEMU when things are idle.
+ */
+
+static const char * wfx_insn[] = {
+    "WFI",
+    "WFE",
+    "WFIT",
+    "WFET"
+};
+
+static int kvm_arm_handle_wfx(CPUState *cs, int esr_iss)
+{
+    int ti = extract32(esr_iss, 0, 2);
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    trace_kvm_wfx_trap(cs->cpu_index, wfx_insn[ti], env->pc);
+
+    /* stop the CPU, return to the top of the loop */
+    cs->stop = true;
+    return EXCP_YIELD;
+}
+
 /**
  * kvm_arm_handle_hard_trap:
  * @cpu: ARMCPU
@@ -1582,6 +1608,8 @@ static int kvm_arm_handle_hard_trap(ARMCPU *cpu,
     case EC_AA64_HVC:
     case EC_AA64_SMC:
         return kvm_arm_handle_hypercall(cpu, esr_ec);
+    case EC_WFX_TRAP:
+        return kvm_arm_handle_wfx(cs, esr_iss);
     default:
         qemu_log_mask(LOG_UNIMP, "%s: unhandled EC: %x/%x/%x/%d\n",
                 __func__, esr_ec, esr_iss, esr_iss2, esr_il);
diff --git a/target/arm/trace-events b/target/arm/trace-events
index 10cdba92a3..bb02da12ab 100644
--- a/target/arm/trace-events
+++ b/target/arm/trace-events
@@ -16,3 +16,4 @@ kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is
 kvm_sysreg_read(const char *name, uint64_t val) "%s => 0x%" PRIx64
 kvm_sysreg_write(const char *name, uint64_t val) "%s <=  0x%" PRIx64
 kvm_hypercall(int ec, uint64_t arg0) "%d: %"PRIx64
+kvm_wfx_trap(int vcpu, const char *insn, uint64_t vaddr) "%d: %s @ 0x%" PRIx64
-- 
2.47.2
