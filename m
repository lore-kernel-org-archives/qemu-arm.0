Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4085678lff;
        Fri, 20 Dec 2019 12:27:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqzL1dKpWVNKxUYtBHb+qxJsbEl8wGV/ywCQC1BOqxCTRlPHQfmdF/6Aogbr61xMCvSjUaUy
X-Received: by 2002:a9d:7592:: with SMTP id s18mr17664047otk.130.1576873666143;
        Fri, 20 Dec 2019 12:27:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576873666; cv=none;
        d=google.com; s=arc-20160816;
        b=FI1h2uX0lJn5YEQrKM8fMVadY79MWSje4ek5bcQeFVHoaZZzU1HvCBxgeM7LqgPXza
         a/zbdq6iOzIipauMUcxo+JAgiZYsgB6bXre9j/Gr1AIVlQ4O1J9Pn2gvVD7w6bSds4pW
         gKR4zfydO1tqLF2kUjuTf/hP73rRWz1uJmfSCdvFcuZV/ND0aK9eyf4Hje0FVIkAGEJ6
         ziRfxDsRgDNX4lkf1vmClCANMCGwkwsd28ptW3s2yZqc5+i91SJXyURUjpLMPnn6ngxy
         TL5gwAMMlRT6pnLbfI4KH6CBphG54jD4unlek8A7URzaDVKJ/niAST/aCmfLqU/gE5Dz
         fWiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=cRpSiBbQozDmyYgJRa0I9YSzeC8XG/jZayq+30fJx3E=;
        b=pk04MYq2/S8nBMw52bWTpuziDhQfO7dfDnb9rHSSlDfB3+I9KJQ4/VpBb7OUnCp25A
         Z+6WA4RGUdzanxiif1x+WpPmndO7v4+T6i74hr8EIwh9l0EbV1ZHFzocqA38BXTtziTs
         0ymXFv+j39sJZ1mRn/XFVqoUPCduMcHp99M5TgrF9rK4Vpzudrwj8R//qLuq5Yg0z76g
         TO3pgPkBOkoOdnyKJLdTjqm5J5WHFSwH0BrInMQGlNfekj/Qty04ue1qLc2XOaCnvzBy
         nTaU7YIDXALRbM9Yq6iL9ExmdR1G8SfWPm1YoFPWZJ6pqG9E4pzcLA3ofHcwIlPbinCw
         Sv4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WJHVnI6L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3si2418679otf.42.2019.12.20.12.27.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Dec 2019 12:27:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WJHVnI6L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iiOsD-0005Rj-9S
	for alex.bennee@linaro.org; Fri, 20 Dec 2019 15:27:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50945)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <beata.michalska@linaro.org>) id 1iiOs4-0005Ms-Fa
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 15:27:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <beata.michalska@linaro.org>) id 1iiOs2-0001RY-J3
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 15:27:36 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:33415)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <beata.michalska@linaro.org>)
 id 1iiOs2-0001NK-7W
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 15:27:34 -0500
Received: by mail-lf1-x142.google.com with SMTP id n25so8010272lfl.0
 for <qemu-arm@nongnu.org>; Fri, 20 Dec 2019 12:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cRpSiBbQozDmyYgJRa0I9YSzeC8XG/jZayq+30fJx3E=;
 b=WJHVnI6L78/ZVkBh0jEK/DmML47DTl/cF+Sp7lG64oOvpW615FqzqSl3V5bg1d1Lu0
 wMSnkJLmd1wyrqhX1SsYXGEkr2kAxGVZUt31ORKQbx6adTNJg2t2pPaLLzmDZjs/i9kn
 OozMmQ46BBOKwCBAIuUAWqqNQpW0lv8wwCP4BxGN/vSE16El7BWr7Ku47Qmn0xOa+Cf+
 26ImWFIOJM0gyhGkNp0AG3scipjDlwv7q9Ks8wa9aQkNlwApFeUXzDft2ThAXl4Txv09
 n5RX5TkOi/8OXwgC35Aff4cIfAF6HbPhU/szAQWDXjcovVxDKoiOSBzvfy10KSCHxNj1
 UjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cRpSiBbQozDmyYgJRa0I9YSzeC8XG/jZayq+30fJx3E=;
 b=Mx0+b7c4dQsKS6JPTPp19GmgthZYS6xqOYwfX8vNDjRZTh2Q109RBMLqGrUR/iGCrI
 gqLKXn2YrvKrz/BD6rOVPvn13Ma5K1cLqgxCz8+QCbSWwcgx7/SEDjnZWx823vntYI97
 YIOkjwxNMaasq5tfggdn/kyGKQZyIXgdSXU/iNB4FITYQpoGLdQs1lxekBD1TnnLrcGo
 6/q8EwYazEfohs5OLRlFsx3zVAxfPDFk6Ifst8fzTW00z6B/Jvi8u4Y3LI7Dz6DO+bEe
 yrZZpUG56pSWppDI4kHbpjiNpKeeHyt3gxQw+b0GyzBjVBVlrfG7nbMEUL+wVEZRaNXs
 llZQ==
X-Gm-Message-State: APjAAAXqWmbfDId7lDCR5eSqdxVhdnd+fHyJbfkO79fCYSqLv4WtE7DZ
 /MfCZnPYySGUBDXsVF/UPt3Odg==
X-Received: by 2002:ac2:47ec:: with SMTP id b12mr9689410lfp.162.1576873652736; 
 Fri, 20 Dec 2019 12:27:32 -0800 (PST)
Received: from moi-limbo-9350.arm.com (user44-177.satfilm.com.pl.
 [77.91.44.177])
 by smtp.gmail.com with ESMTPSA id g27sm4482353lfj.49.2019.12.20.12.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 12:27:32 -0800 (PST)
From: Beata Michalska <beata.michalska@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/1] target/arm: kvm: Handle DABT with no valid ISS
Date: Fri, 20 Dec 2019 20:27:07 +0000
Message-Id: <20191220202707.30641-2-beata.michalska@linaro.org>
In-Reply-To: <20191220202707.30641-1-beata.michalska@linaro.org>
References: <20191220202707.30641-1-beata.michalska@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::142
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, Christoffer.Dall@arm.com,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M8tACp7RalUn

On ARMv7 & ARMv8 some load/store instructions might trigger a data abort
exception with no valid ISS info to be decoded. The lack of decode info
makes it at least tricky to emulate those instruction which is one of the
(many) reasons why KVM will not even try to do so.

Add suport for handling those by requesting KVM to inject external
dabt into the quest.

Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
---
 accel/kvm/kvm-all.c    | 15 +++++++
 accel/stubs/kvm-stub.c |  4 ++
 include/sysemu/kvm.h   |  1 +
 target/arm/cpu.h       |  3 +-
 target/arm/kvm.c       | 95 ++++++++++++++++++++++++++++++++++++++++++
 target/arm/kvm32.c     |  3 ++
 target/arm/kvm64.c     |  3 ++
 target/arm/kvm_arm.h   | 19 +++++++++
 8 files changed, 142 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index ca00daa2f5..a3ee038142 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2174,6 +2174,14 @@ static void do_kvm_cpu_synchronize_state(CPUState *cpu, run_on_cpu_data arg)
     }
 }
 
+static void do_kvm_cpu_synchronize_state_force(CPUState *cpu,
+                                               run_on_cpu_data arg)
+{
+    kvm_arch_get_registers(cpu);
+    cpu->vcpu_dirty = true;
+}
+
+
 void kvm_cpu_synchronize_state(CPUState *cpu)
 {
     if (!cpu->vcpu_dirty) {
@@ -2181,6 +2189,13 @@ void kvm_cpu_synchronize_state(CPUState *cpu)
     }
 }
 
+void kvm_cpu_synchronize_state_force(CPUState *cpu)
+{
+    /* Force the sync */
+    run_on_cpu(cpu, do_kvm_cpu_synchronize_state_force, RUN_ON_CPU_NULL);
+}
+
+
 static void do_kvm_cpu_synchronize_post_reset(CPUState *cpu, run_on_cpu_data arg)
 {
     kvm_arch_put_registers(cpu, KVM_PUT_RESET_STATE);
diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 82f118d2df..e917d1d55e 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -58,6 +58,10 @@ void kvm_cpu_synchronize_post_init(CPUState *cpu)
 {
 }
 
+void kvm_cpu_synchronize_state_force(CPUState *cpu)
+{
+}
+
 int kvm_cpu_exec(CPUState *cpu)
 {
     abort();
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 9fe233b9bf..0cacc61d8a 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -483,6 +483,7 @@ void kvm_cpu_synchronize_state(CPUState *cpu);
 void kvm_cpu_synchronize_post_reset(CPUState *cpu);
 void kvm_cpu_synchronize_post_init(CPUState *cpu);
 void kvm_cpu_synchronize_pre_loadvm(CPUState *cpu);
+void kvm_cpu_synchronize_state_force(CPUState *cpu);
 
 void kvm_init_cpu_signals(CPUState *cpu);
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5f70e9e043..e11b5e7438 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -558,7 +558,8 @@ typedef struct CPUARMState {
         uint8_t has_esr;
         uint64_t esr;
     } serror;
-
+    /* Status field for pending extarnal dabt */
+    uint8_t ext_dabt_pending;
     /* State of our input IRQ/FIQ/VIRQ/VFIQ lines */
     uint32_t irq_line_state;
 
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 5b82cefef6..10fe739c2d 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -37,6 +37,7 @@ const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
 
 static bool cap_has_mp_state;
 static bool cap_has_inject_serror_esr;
+static bool cap_has_inject_ext_dabt; /* KVM_CAP_ARM_INJECT_EXT_DABT */
 
 static ARMHostCPUFeatures arm_host_cpu_features;
 
@@ -62,6 +63,12 @@ void kvm_arm_init_serror_injection(CPUState *cs)
                                     KVM_CAP_ARM_INJECT_SERROR_ESR);
 }
 
+void kvm_arm_init_ext_dabt_injection(CPUState *cs)
+{
+    cap_has_inject_ext_dabt = kvm_check_extension(cs->kvm_state,
+                                    KVM_CAP_ARM_INJECT_EXT_DABT);
+}
+
 bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
                                       int *fdarray,
                                       struct kvm_vcpu_init *init)
@@ -218,6 +225,11 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         ret = -EINVAL;
     }
 
+    if (kvm_check_extension(s, KVM_CAP_ARM_NISV_TO_USER))
+        if (kvm_vm_enable_cap(s, KVM_CAP_ARM_NISV_TO_USER, 0)) {
+            warn_report("Failed to enable DABT NISV cap");
+        }
+
     return ret;
 }
 
@@ -600,6 +612,10 @@ int kvm_put_vcpu_events(ARMCPU *cpu)
         events.exception.serror_esr = env->serror.esr;
     }
 
+    if (cap_has_inject_ext_dabt) {
+        events.exception.ext_dabt_pending = env->ext_dabt_pending;
+    }
+
     ret = kvm_vcpu_ioctl(CPU(cpu), KVM_SET_VCPU_EVENTS, &events);
     if (ret) {
         error_report("failed to put vcpu events");
@@ -629,6 +645,8 @@ int kvm_get_vcpu_events(ARMCPU *cpu)
     env->serror.has_esr = events.exception.serror_has_esr;
     env->serror.esr = events.exception.serror_esr;
 
+    env->ext_dabt_pending = events.exception.ext_dabt_pending;
+
     return 0;
 }
 
@@ -701,6 +719,11 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
             ret = EXCP_DEBUG;
         } /* otherwise return to guest */
         break;
+    case KVM_EXIT_ARM_NISV:
+        /* External DAB with no valid iss to decode */
+        ret = kvm_arm_handle_dabt_nisv(cs, run->arm_nisv.esr_iss,
+                                 run->arm_nisv.fault_ipa);
+        break;
     default:
         qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
                       __func__, run->exit_reason);
@@ -835,3 +858,75 @@ int kvm_arch_msi_data_to_gsi(uint32_t data)
 {
     return (data - 32) & 0xffff;
 }
+
+int kvm_arm_handle_dabt_nisv(CPUState *cs, uint64_t esr_iss,
+                              uint64_t fault_ipa)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    hwaddr xlat, len;
+    AddressSpace *as = cs->as ? cs->as : &address_space_memory;
+    int store_ins = ((esr_iss >> 6) & 1); /* WnR bit */
+    int ret;
+
+    /*
+     * Note: The ioctl for SET_EVENTS will be triggered before next
+     * KVM_RUN call though the vcpu regs need to be updated before hand
+     * so to not to overwrite changes done by KVM upon injecting the abort.
+     * This sadly requires running sync twice - shame ...
+     */
+    kvm_cpu_synchronize_state(cs);
+   /*
+    * ISS [23:14] is invalid so there is a limited info
+    * on what has just happened so the only *useful* thing that can
+    * be retrieved from ISS is WnR & DFSC (though in some cases WnR
+    * might be less of a value as well)
+    */
+    /* Verify whether the memory being accessed is even recognisable */
+    if (!address_space_translate(as, fault_ipa, &xlat, &len,
+                                 store_ins, MEMTXATTRS_UNSPECIFIED)) {
+        error_report("An attemp to access memory outside of the boundries"
+                     "at 0x" TARGET_FMT_lx, (target_ulong) fault_ipa);
+    } else {
+        uint32_t ins;
+        uint8_t ins_fetched;
+
+        /*
+         * Get current PC before it will get updated to except vector entry
+         */
+        target_ulong ins_addr = is_a64(env) ? env->pc
+                                /* AArch32 mode vs T32 aka Thumb mode */
+                                : env->regs[15] - (env->thumb ? 4 : 8);
+
+        /*
+         * Get the faulting instruction
+         * Instructions have a fixed length of 32 bits
+         * and are always little-endian
+         */
+        ins_fetched = !cpu_memory_rw_debug(cs, ins_addr, (uint8_t *) &ins,
+                                           sizeof(uint32_t), store_ins) ;
+
+        error_report("Data abort exception with no valid ISS generated by "
+                     "memory access at 0x" TARGET_FMT_lx,
+                     (target_ulong)fault_ipa);
+        error_report(ins_fetched ? "%s: 0x%" PRIx32 " (encoded)" : "%s",
+                     "Unable to emulate memory instruction",
+                     (!ins_fetched ? 0 : ldl_le_p(&ins)));
+
+        error_report("Faulting instruction at 0x" TARGET_FMT_lx, ins_addr);
+    }
+    /*
+     * Set pending ext dabt amd trigger SET_EVENTS so that
+     * KVM can inject the abort
+     */
+    env->ext_dabt_pending = 1;
+
+    ret = kvm_put_vcpu_events(cpu);
+
+    /* Get the most up-tp-date state */
+    if (!ret) {
+        /* Hacky but the sync needs to be forced */
+        kvm_cpu_synchronize_state_force(cs);
+    }
+    return ret;
+}
diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index 32bf8d6757..5539c3a3f2 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -240,6 +240,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
     /* Check whether userspace can specify guest syndrome value */
     kvm_arm_init_serror_injection(cs);
 
+    /* Set status for supporting the extarnal dabt injection */
+    kvm_arm_init_ext_dabt_injection(cs);
+
     return kvm_arm_init_cpreg_list(cpu);
 }
 
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 876184b8fe..3da4e2e70e 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -792,6 +792,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
     /* Check whether user space can specify guest syndrome value */
     kvm_arm_init_serror_injection(cs);
 
+    /* Set status for supporting the extarnal dabt injection */
+    kvm_arm_init_ext_dabt_injection(cs);
+
     return kvm_arm_init_cpreg_list(cpu);
 }
 
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 8e14d400e8..fe019f2fc9 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -143,6 +143,14 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu);
  */
 void kvm_arm_init_serror_injection(CPUState *cs);
 
+/**
+ * kvm_arm_init_ext_dabt_injection
+ * @cs: CPUState
+ *
+ * Set status for KVM support for Ext DABT injection
+ */
+void kvm_arm_init_ext_dabt_injection(CPUState *cs);
+
 /**
  * kvm_get_vcpu_events:
  * @cpu: ARMCPU
@@ -371,6 +379,17 @@ static inline const char *gicv3_class_name(void)
  */
 bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit);
 
+/**
+ * kvm_arm_handle_dabt_nisv
+ * @cs: CPUState
+ * @esr_iss: ISS encoding (limited) for the exception from Data Abort
+ *           ISV bit set to '0b0' -> no valid instruction syndrome
+ * @fault_ipa: faulting address for the synch data abort
+ *
+ * Returns: 0 if the exception has been handled
+ */
+int kvm_arm_handle_dabt_nisv(CPUState *cs, uint64_t esr_iss,
+                             uint64_t fault_ipa);
 /**
  * kvm_arm_hw_debug_active:
  * @cs: CPU State
-- 
2.17.1

