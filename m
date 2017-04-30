Received: by 10.25.0.144 with SMTP id 138csp829239lfa;
        Sat, 29 Apr 2017 22:28:21 -0700 (PDT)
X-Received: by 10.55.54.204 with SMTP id d195mr15588220qka.255.1493530101107;
        Sat, 29 Apr 2017 22:28:21 -0700 (PDT)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id 15si1403988qkh.134.2017.04.29.22.28.20;
        Sat, 29 Apr 2017 22:28:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 5E6B149B89;
	Sun, 30 Apr 2017 01:25:22 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.799
X-Spam-Level: 
X-Spam-Status: No, score=0.799 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id POF5YebpVUmz; Sun, 30 Apr 2017 01:25:21 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 48B4E49C09;
	Sun, 30 Apr 2017 01:25:21 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 6475D40F8A
 for <kvmarm@lists.cs.columbia.edu>; Sun, 30 Apr 2017 01:25:20 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JBOFrUTNGfUw for <kvmarm@lists.cs.columbia.edu>;
 Sun, 30 Apr 2017 01:25:19 -0400 (EDT)
Received: from dggrg01-dlp.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 0A16843C70
 for <kvmarm@lists.cs.columbia.edu>; Sun, 30 Apr 2017 01:25:17 -0400 (EDT)
Received: from 172.30.72.53 (EHLO DGGEML404-HUB.china.huawei.com)
 ([172.30.72.53])
 by dggrg01-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
 with ESMTP id ANP74834; Sun, 30 Apr 2017 13:24:42 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
 DGGEML404-HUB.china.huawei.com (10.3.17.39) with Microsoft SMTP Server id
 14.3.301.0; Sun, 30 Apr 2017 13:24:31 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <james.morse@arm.com>, <marc.zyngier@arm.com>,
 <christoffer.dall@linaro.org>, <rkrcmar@redhat.com>,
 <linux@armlinux.org.uk>, <tbaicar@codeaurora.org>,
 <imammedo@redhat.com>, <zhaoshenglong@huawei.com>,
 <peter.maydell@linaro.org>, <pbonzini@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <lersek@redhat.com>,
 <ard.biesheuvel@linaro.org>, <mtsirkin@redhat.com>,
 <drjones@redhat.com>, <ben@skyportsystems.com>, <kvm@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.cs.columbia.edu>
Subject: [PATCH v3 4/4] target-arm: kvm64: handle SError interrupt for RAS
 extension
Date: Sun, 30 Apr 2017 13:35:06 +0800
Message-ID: <1493530506-26833-4-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1493530506-26833-1-git-send-email-gengdongjiu@huawei.com>
References: <1493530506-26833-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.187.203]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
 refid=str=0001.0A020201.5905751C.000A, ss=1, re=0.000, recu=0.000, reip=0.000,
 cl=1, cld=1, fgs=0, ip=0.0.0.0,
 so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 141757fc9b97170d187fcf259ce60cd9
Cc: songwenjun@huawei.com, wuquanming@huawei.com, gengdongjiu@huawei.com,
 huangshaoyu@huawei.com, wangxiongfeng2@huawei.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: 4IWwA+/1Wyo9

Record this CPER to GHES, and raise a virtual SError interrupt
with specified syndrome information, the virtual syndrome
is delivered by vsesr_el2. the reason that record the error to HEST
table and inject the SError to guest is due to guest can
handle some errores to avoid directly panic, such as the
application error defered by ESB.

The steps are shown below:
1. syndrome_info and host error VA is delivered by KVM, qemu parse it.
2. translate the host VA to PA and record this error to HEST table.
3. Raise a virtual SError interrupt by set the hcr_el2.vse and pass
   the virtual syndrome

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 linux-headers/linux/kvm.h |  5 +++++
 target/arm/cpu.h          |  5 +++++
 target/arm/helper.c       | 20 ++++++++++++++++++++
 target/arm/internals.h    |  1 +
 target/arm/kvm.c          |  3 +++
 target/arm/kvm64.c        | 31 +++++++++++++++++++++++++++++++
 target/arm/kvm_arm.h      | 14 ++++++++++++++
 7 files changed, 79 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index c985e10..7951b91 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -360,6 +360,11 @@ struct kvm_run {
 		struct {
 			__u8 vector;
 		} eoi;
+		/* KVM_EXIT_INTR */
+		struct {
+			__u32 syndrome_info;
+			__u64 address;
+		} intr;
 		/* KVM_EXIT_HYPERV */
 		struct kvm_hyperv_exit hyperv;
 		/* Fix the size of the union. */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1cf4a5b..a2e6348 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -58,6 +58,8 @@
 #define EXCP_SEMIHOST       16   /* semihosting call */
 #define EXCP_NOCP           17   /* v7M NOCP UsageFault */
 #define EXCP_INVSTATE       18   /* v7M INVSTATE UsageFault */
+#define EXCP_SERROR         19   /* v8 System Error or Asynchronous Abort */
+
 
 #define ARMV7M_EXCP_RESET   1
 #define ARMV7M_EXCP_NMI     2
@@ -273,6 +275,7 @@ typedef struct CPUARMState {
             };
             uint64_t esr_el[4];
         };
+        uint64_t vsesr_el2;
         uint32_t c6_region[8]; /* MPU base/size registers.  */
         union { /* Fault address registers. */
             struct {
@@ -922,6 +925,8 @@ void pmccntr_sync(CPUARMState *env);
 #define PSTATE_MODE_EL1t 4
 #define PSTATE_MODE_EL0t 0
 
+#define VSESR_ELx_IDS_ISS_MASK    ((1UL << 25) - 1)
+
 /* Map EL and handler into a PSTATE_MODE.  */
 static inline unsigned int aarch64_pstate_mode(unsigned int el, bool handler)
 {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8cb7a94..bdfaba2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4852,6 +4852,15 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         }
         define_arm_cp_regs(cpu, v8_idregs);
         define_arm_cp_regs(cpu, v8_cp_reginfo);
+        if (arm_feature(env, ARM_FEATURE_RAS_EXTENSION)) {
+            ARMCPRegInfo ras_cp_reginfo = {
+                .name = "VSESR_EL2", .state = ARM_CP_STATE_AA64,
+                .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 3,
+                .access = PL2_RW,
+                .fieldoffset = offsetof(CPUARMState, cp15.vsesr_el2)
+            };
+            define_one_arm_cp_reg(cpu, &ras_cp_reginfo);
+        }
     }
     if (arm_feature(env, ARM_FEATURE_EL2)) {
         uint64_t vmpidr_def = mpidr_read_val(env);
@@ -6930,6 +6939,17 @@ void arm_cpu_do_interrupt(CPUState *cs)
         qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
         return;
     }
+    if (cs->exception_index == EXCP_SERROR
+        && arm_feature(env, ARM_FEATURE_RAS_EXTENSION)) {
+        /* Raise virtual System Error or Asynchronous Abort and
+         * set virtual syndrome information
+         */
+        env->cp15.esr_el[2] = env->exception.syndrome;
+        env->cp15.vsesr_el2 = env->exception.syndrome & VSESR_ELx_IDS_ISS_MASK;
+        env->cp15.hcr_el2 = env->cp15.hcr_el2 | HCR_VSE;
+        qemu_log_mask(CPU_LOG_INT, "...handled as async SError\n");
+        return;
+    }
 
     /* Semihosting semantics depend on the register width of the
      * code that caused the exception, not the target exception level,
diff --git a/target/arm/internals.h b/target/arm/internals.h
index f742a41..29aabad 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -70,6 +70,7 @@ static const char * const excnames[] = {
     [EXCP_VIRQ] = "Virtual IRQ",
     [EXCP_VFIQ] = "Virtual FIQ",
     [EXCP_SEMIHOST] = "Semihosting call",
+    [EXCP_SERROR] = "async SError"
 };
 
 /* Scale factor for generic timers, ie number of ns per tick.
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index bf6ee4c..000e7c3 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -570,12 +570,15 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
 {
     int ret = 0;
 
+    struct kvm_async_abort *async_abort = (struct kvm_async_abort *)&run->intr;
     switch (run->exit_reason) {
     case KVM_EXIT_DEBUG:
         if (kvm_arm_handle_debug(cs, &run->debug.arch)) {
             ret = EXCP_DEBUG;
         } /* otherwise return to guest */
         break;
+    case KVM_EXIT_INTR:
+        kvm_arm_inject_serror(cs, async_abort);
     default:
         qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
                       __func__, run->exit_reason);
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 5eee6f4..7d4c32f 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1048,3 +1048,34 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
 
     return false;
 }
+
+bool kvm_arm_inject_serror(CPUState *cs,
+                struct kvm_async_abort *async_abort_exit)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUClass *cc = CPU_GET_CLASS(cs);
+    CPUARMState *env = &cpu->env;
+    hwaddr paddr;
+    ram_addr_t ram_addr;
+
+    /* Ensure PC is synchronised */
+    kvm_cpu_synchronize_state(cs);
+
+    /* record the CPER to GHES */
+    if (arm_feature(env, ARM_FEATURE_RAS_EXTENSION)
+                && async_abort_exit->address) {
+        ram_addr = qemu_ram_addr_from_host((void *)async_abort_exit->address);
+        if (ram_addr != RAM_ADDR_INVALID &&
+            kvm_physical_memory_addr_from_host(cs->kvm_state,
+                        (void *)async_abort_exit->address, &paddr)) {
+            ghes_update_guest(ACPI_HEST_NOTIFY_SEI, paddr);
+        }
+    }
+    cs->exception_index = EXCP_SERROR;
+    env->exception.syndrome = async_abort_exit->hsr;
+
+    /* inject SError to guest */
+    cc->do_interrupt(cs);
+
+    return true;
+}
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 7cdde97..ed73e2b 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -120,6 +120,11 @@ bool write_kvmstate_to_list(ARMCPU *cpu);
  */
 void kvm_arm_reset_vcpu(ARMCPU *cpu);
 
+struct kvm_async_abort {
+    unsigned int hsr;
+    unsigned long address;  /* used for async SError */
+};
+
 #ifdef CONFIG_KVM
 /**
  * kvm_arm_create_scratch_host_vcpu:
@@ -249,6 +254,15 @@ static inline const char *gicv3_class_name(void)
 bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit);
 
 /**
+ * kvm_arm_inject_serror:
+ * @cs: CPUState
+ * @async_abort_exit: the async abort exception infomation
+ *
+ * Returns: TRUE if the async SError was injected.
+ */
+bool kvm_arm_inject_serror(CPUState *cs,
+        struct kvm_async_abort *async_abort_exit);
+/**
  * kvm_arm_hw_debug_active:
  * @cs: CPU State
  *
-- 
1.8.3.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
