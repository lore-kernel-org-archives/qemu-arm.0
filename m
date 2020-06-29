Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2904193lfm;
        Mon, 29 Jun 2020 04:42:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZgKyqc+KmRY/CwEGaj5c8YksgazGrbBi0U2mkXsMQVZpNcQ/yRZXB8YaHC08IfK85B5Vq
X-Received: by 2002:a37:a94f:: with SMTP id s76mr14830878qke.297.1593430920082;
        Mon, 29 Jun 2020 04:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593430920; cv=none;
        d=google.com; s=arc-20160816;
        b=EmruYPTzcfc0qtMfkzB752evSW+yq7Rj1KeXHywVQvvzU1SwM8l0M9WTn+wg7N5qTL
         srVI4ovTGtrEoCvZBSiR5+1ULTx3YULuLAWsfJa4VkQuZEe4zXXbC488WkbJWAT1ta/F
         8eHs27OXFQrKj1x34LYmxgFh12UvGgwNhFfU+BO2U/FZWUG++KgUD/Fe580pOV6qIrk0
         lWGJp2dNGwGojMje97X0Mfwdt5pBVQRmH7iaX+kHY9pEhJjzivUr7Nry83byo3FbFiaw
         Kb+/gUm9ssFaVR65ovJwb+DZZm2yuSlaEb6e8STFKsm5wIgFrwtYNnhe9sNDrPz0nsyz
         FBog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:cc:references:in-reply-to:message-id:date
         :subject:to:from:dkim-signature;
        bh=dakVYhsCtcI3S3TrcLE5ihriov/MOgMIEeN+zKPOty4=;
        b=xchSHrLgOZWaX1YijKrGsUB9UYiCASOY/8J0fovDhdkUHAQFGsDXppaWV3VhwI6CmM
         ofwM/181zs85bME65LJ/x/8NBM77Lv4yQwNw6slDrn6dy7cQ/HR5DnZt7dKPV6fKw3x2
         iRYa9fiJruWtxceFKxn4hh9ns4r7Il7dXDuLeLUsjcEHf39x1ebVskd3b8IYugSbtbE2
         4vJ3N8dq4MXvF3hYBD0zRx5FdsymVvpJ7ZhlkH+18QDtKO6qemScB2E35OfUyV0oYWN0
         /OLAVpONfphMEHQCkTGPESwo5x6eGS8JEBaxZZ6FII9C7oEaSknr5jfxSGjzwwt24M73
         EWbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=SZnZJRa0;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id l39si15343350qta.305.2020.06.29.04.41.59;
        Mon, 29 Jun 2020 04:42:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=SZnZJRa0;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id C5A974B385;
	Mon, 29 Jun 2020 07:41:59 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NYRcIw76-TiB; Mon, 29 Jun 2020 07:41:58 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 72AAD4B3EC;
	Mon, 29 Jun 2020 07:41:58 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 0D8BC4B37D
 for <kvmarm@lists.cs.columbia.edu>; Mon, 29 Jun 2020 07:41:57 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5v0Rh+c1j56l for <kvmarm@lists.cs.columbia.edu>;
 Mon, 29 Jun 2020 07:41:55 -0400 (EDT)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id BD7214B3B7
 for <kvmarm@lists.cs.columbia.edu>; Mon, 29 Jun 2020 07:41:55 -0400 (EDT)
Received: by mail-wm1-f65.google.com with SMTP id j18so15061779wmi.3
 for <kvmarm@lists.cs.columbia.edu>; Mon, 29 Jun 2020 04:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CpJVMKujpf1bwPJQRhxOFxuwnII8DRhX/r1WrrvSY3Q=;
 b=SZnZJRa0+YD59ZxkC60+VuLLZBnmDiISn5LpCBs+C3QHLPMwLxjooBlw6/OrTJ0n3h
 YrRRObHCKiSbnTTszzB/DuGnNAnQpDacs+RTZSXCOImbFDQ7UZTqO6xTlhB3OrPofCRq
 sVsZKthZfrGkrCCCWnAfLK3iX2D8MkkNHtMY1esky+40zL7/czfwQaHuW61ziheCvPF6
 cGQPAtv4q0+mWmC5feVaoVyf2JoHp+0PC6fSwfnwOqUeArOx6lUrG8/FJGds8ZKO3/6G
 5P7UWneIZBxiDl+LRKtcWbawcu9bf8zgMyElaRUqbUGXBQEHoxY8qtv0ie1f3uMUig9m
 UeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CpJVMKujpf1bwPJQRhxOFxuwnII8DRhX/r1WrrvSY3Q=;
 b=Cq0rNXU4Ss0NVMmTI24U+VHKN/6I6ihdfDU9p8z4hXFtLSxS5FQkrN0vX9uzLA2Fy3
 AC9xrtY8GK5wiTVxOHfoo5oqGxwAsSlw2UJ2iRTxhW0WNTVwPsh7CXAhi5YlnpQc8XIh
 nQxP2KqGo8bUD7cdozKOHwWhUQnVKhRS5m+oiUNtaQZr2lfSb7+dG4Cu6KgIViHsWg57
 Hvrn1V6f9EwVg9gMS7N2+VrCz2m/SKmUxz0C5bEjsAssPyXqWTkJMPtO4bebAld7NIJY
 GFOLeqIGXj5dhCWm0Sp0yAFnAS0r80VcZKh3bnzrKv4bXgLvEepOpcv5Zmr3UJ8ZFy3k
 LUXA==
X-Gm-Message-State: AOAM531S+3U/3pmm22RGgodOigpmkwBVb840YgSWUyozMv6ameqQde1g
 Rarn9VR4E3mV8+FTzM9+Dybptw==
X-Received: by 2002:a7b:c18f:: with SMTP id y15mr16620956wmi.85.1593430914844; 
 Mon, 29 Jun 2020 04:41:54 -0700 (PDT)
Received: from moi-limbo-9350.home
 (host86-139-146-71.range86-139.btcentralplus.com. [86.139.146.71])
 by smtp.gmail.com with ESMTPSA id c2sm49486357wrv.47.2020.06.29.04.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 04:41:54 -0700 (PDT)
From: Beata Michalska <beata.michalska@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 2/2] target/arm: kvm: Handle misconfigured dabt injection
Date: Mon, 29 Jun 2020 12:41:10 +0100
Message-Id: <20200629114110.30723-3-beata.michalska@linaro.org>
In-Reply-To: <20200629114110.30723-1-beata.michalska@linaro.org>
References: <20200629114110.30723-1-beata.michalska@linaro.org>
Cc: qemu-arm@nongnu.org, pbonzini@redhat.com, kvmarm@lists.cs.columbia.edu
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: 6tnyy0EtWFYi

Injecting external data abort through KVM might trigger
an issue on kernels that do not get updated to include the KVM fix.
For those and aarch32 guests, the injected abort gets misconfigured
to be an implementation defined exception. This leads to the guest
repeatedly re-running the faulting instruction.

Add support for handling that case.

[
  Fixed-by: 018f22f95e8a
	('KVM: arm: Fix DFSR setting for non-LPAE aarch32 guests')
  Fixed-by: 21aecdbd7f3a
	('KVM: arm: Make inject_abt32() inject an external abort instead')
]

Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
Acked-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/cpu.h     |  2 ++
 target/arm/kvm.c     | 30 +++++++++++++++++++++++++++++-
 target/arm/kvm32.c   | 34 ++++++++++++++++++++++++++++++++++
 target/arm/kvm64.c   | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/kvm_arm.h | 10 ++++++++++
 5 files changed, 124 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 677584e..ed0ff09 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -570,6 +570,8 @@ typedef struct CPUARMState {
         uint64_t esr;
     } serror;
 
+    uint8_t ext_dabt_raised; /* Tracking/verifying injection of ext DABT */
+
     /* State of our input IRQ/FIQ/VIRQ/VFIQ lines */
     uint32_t irq_line_state;
 
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 545d2ba..603d431 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -749,6 +749,29 @@ int kvm_get_vcpu_events(ARMCPU *cpu)
 
 void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
 {
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    if (unlikely(env->ext_dabt_raised)) {
+        /*
+         * Verifying that the ext DABT has been properly injected,
+         * otherwise risking indefinitely re-running the faulting instruction
+         * Covering a very narrow case for kernels 5.5..5.5.4
+         * when injected abort was misconfigured to be
+         * an IMPLEMENTATION DEFINED exception (for 32-bit EL1)
+         */
+        if (!arm_feature(env, ARM_FEATURE_AARCH64) &&
+            unlikely(!kvm_arm_verify_ext_dabt_pending(cs))) {
+
+            error_report("Data abort exception with no valid ISS generated by "
+                   "guest memory access. KVM unable to emulate faulting "
+                   "instruction. Failed to inject an external data abort "
+                   "into the guest.");
+            abort();
+       }
+       /* Clear the status */
+       env->ext_dabt_raised = 0;
+    }
 }
 
 MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
@@ -833,6 +856,8 @@ void kvm_arm_vm_state_change(void *opaque, int running, RunState state)
 static int kvm_arm_handle_dabt_nisv(CPUState *cs, uint64_t esr_iss,
                                     uint64_t fault_ipa)
 {
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
     /*
      * Request KVM to inject the external data abort into the guest
      */
@@ -847,7 +872,10 @@ static int kvm_arm_handle_dabt_nisv(CPUState *cs, uint64_t esr_iss,
          */
         events.exception.ext_dabt_pending = 1;
         /* KVM_CAP_ARM_INJECT_EXT_DABT implies KVM_CAP_VCPU_EVENTS */
-        return kvm_vcpu_ioctl(cs, KVM_SET_VCPU_EVENTS, &events);
+        if (!kvm_vcpu_ioctl(cs, KVM_SET_VCPU_EVENTS, &events)) {
+            env->ext_dabt_raised = 1;
+            return 0;
+        }
     } else {
         error_report("Data abort exception triggered by guest memory access "
                      "at physical address: 0x"  TARGET_FMT_lx,
diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index 7b3a19e..0af46b4 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -559,3 +559,37 @@ void kvm_arm_pmu_init(CPUState *cs)
 {
     qemu_log_mask(LOG_UNIMP, "%s: not implemented\n", __func__);
 }
+
+#define ARM_REG_DFSR  ARM_CP15_REG32(0, 5, 0, 0)
+#define ARM_REG_TTBCR ARM_CP15_REG32(0, 2, 0, 2)
+/*
+ *DFSR:
+ *      TTBCR.EAE == 0
+ *          FS[4]   - DFSR[10]
+ *          FS[3:0] - DFSR[3:0]
+ *      TTBCR.EAE == 1
+ *          FS, bits [5:0]
+ */
+#define DFSR_FSC(lpae, v) \
+    ((lpae) ? ((v) & 0x3F) : (((v) >> 6) | ((v) & 0x1F)))
+
+#define DFSC_EXTABT(lpae) ((lpae) ? 0x10 : 0x08)
+
+bool kvm_arm_verify_ext_dabt_pending(CPUState *cs)
+{
+    uint32_t dfsr_val;
+
+    if (!kvm_get_one_reg(cs, ARM_REG_DFSR, &dfsr_val)) {
+        ARMCPU *cpu = ARM_CPU(cs);
+        CPUARMState *env = &cpu->env;
+        uint32_t ttbcr;
+        int lpae = 0;
+
+        if (!kvm_get_one_reg(cs, ARM_REG_TTBCR, &ttbcr)) {
+            lpae = arm_feature(env, ARM_FEATURE_LPAE) && (ttbcr & TTBCR_EAE);
+        }
+        /* The verification is based on FS filed of the DFSR reg only*/
+        return (DFSR_FSC(lpae, dfsr_val) == DFSC_EXTABT(lpae));
+    }
+    return false;
+}
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index f09ed9f..88cf10c 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1497,3 +1497,52 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
 
     return false;
 }
+
+#define ARM64_REG_ESR_EL1 ARM64_SYS_REG(3, 0, 5, 2, 0)
+#define ARM64_REG_TCR_EL1 ARM64_SYS_REG(3, 0, 2, 0, 2)
+
+/*
+ * ESR_EL1
+ * ISS encoding
+ * AARCH64: DFSC,   bits [5:0]
+ * AARCH32:
+ *      TTBCR.EAE == 0
+ *          FS[4]   - DFSR[10]
+ *          FS[3:0] - DFSR[3:0]
+ *      TTBCR.EAE == 1
+ *          FS, bits [5:0]
+ */
+#define ESR_DFSC(aarch64, lpae, v)        \
+    ((aarch64 || (lpae)) ? ((v) & 0x3F)   \
+               : (((v) >> 6) | ((v) & 0x1F)))
+
+#define ESR_DFSC_EXTABT(aarch64, lpae) \
+    ((aarch64) ? 0x10 : (lpae) ? 0x10 : 0x8)
+
+bool kvm_arm_verify_ext_dabt_pending(CPUState *cs)
+{
+    uint64_t dfsr_val;
+
+    if (!kvm_get_one_reg(cs, ARM64_REG_ESR_EL1, &dfsr_val)) {
+        ARMCPU *cpu = ARM_CPU(cs);
+        CPUARMState *env = &cpu->env;
+        int aarch64_mode = arm_feature(env, ARM_FEATURE_AARCH64);
+        int lpae = 0;
+
+        if (!aarch64_mode) {
+            uint64_t ttbcr;
+
+            if (!kvm_get_one_reg(cs, ARM64_REG_TCR_EL1, &ttbcr)) {
+                lpae = arm_feature(env, ARM_FEATURE_LPAE)
+                        && (ttbcr & TTBCR_EAE);
+            }
+        }
+        /*
+         * The verification here is based on the DFSC bits
+         * of the ESR_EL1 reg only
+         */
+         return (ESR_DFSC(aarch64_mode, lpae, dfsr_val) ==
+                ESR_DFSC_EXTABT(aarch64_mode, lpae));
+    }
+    return false;
+}
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 48bf5e1..471ddd1 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -453,6 +453,16 @@ struct kvm_guest_debug_arch;
 void kvm_arm_copy_hw_debug_data(struct kvm_guest_debug_arch *ptr);
 
 /**
+ * kvm_arm_verify_ext_dabt_pending:
+ * @cs: CPUState
+ *
+ * Verify the fault status code wrt the Ext DABT injection
+ *
+ * Returns: true if the fault status code is as expected, false otherwise
+ */
+bool kvm_arm_verify_ext_dabt_pending(CPUState *cs);
+
+/**
  * its_class_name:
  *
  * Return the ITS class name to use depending on whether KVM acceleration
-- 
2.7.4

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
