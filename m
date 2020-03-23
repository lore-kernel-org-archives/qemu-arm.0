Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1334363lfi;
        Mon, 23 Mar 2020 04:32:53 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vseZVLjwHaJ15OXNKw8YfnOtx50SfCgwZ8ZKuWeL6lSrz3gIi6frgDIXEX3SvJicd7El7mH
X-Received: by 2002:ad4:41c7:: with SMTP id a7mr4946102qvq.39.1584963173219;
        Mon, 23 Mar 2020 04:32:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584963173; cv=none;
        d=google.com; s=arc-20160816;
        b=nF6DQmAfHNPSQvqM0OlATzATx4y4OaGS2xmPsc/aOwLpH2fVdE3+4ZRZlo2RO7WQYk
         Rn6zJkuCjqSViOZqN0GC3B8Ok7UZp42GnfrlxlG0/aEg6T685NQFAxeoiN9GFL7qWXpP
         YKsxeL4bowFelcra18reya5u8IFv/NcMqS8vQKVkS6rJRFpkj5F609MNPjRkYj/6SXUo
         izGZL7tVjw8+fED4BuMZQ7GSL/22TFahmDLdhs6MCHsXdlXQE4Pz5ksNJMl+IIrdCZuW
         8Zm8ME+5mO0lP9SPZfBtKuyiAJVdxTvq+CrHSQxkfcy9NRnqxfxq3MbDkkDogzI/tErx
         LPjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:cc:references:in-reply-to:message-id:date
         :subject:to:from:dkim-signature;
        bh=SXTZMRyRFGNd1pGWp/wNDn7uSzAro1n1a3GUSvWiRBI=;
        b=qFgW0V3il2rMuIoRFqF0QL4ygDXhyyGTZBNko3Npfn0XvspFd9jETjDpJsbltEexXl
         XJYObgdpYKlbzbZ3sDuDYpA4N61GTqbe8zguxxtituk8AavnpLmKSdI7TjUqbgta/kaG
         YSDLDFcuj4WSPEq1mZPj/yEZbf8UJiqhSNk0hjTDZJcZjNDDWGg4reTzIqn1iYEQ9quV
         cOkt1nG8WpM74Dqsb8G5crzfYn+kSVQZFsh8KJGhhx2qgahkwGxOa+rm/m95MhzzpJyN
         3E6WrZty/AayjVay0FP2BhSFiJ4E4wUTs1tLuJLfkAy1U9nE9iIG+QCek100rXI17w2T
         OuJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=pp5Wxvr4;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id h15si8412220qkh.372.2020.03.23.04.32.52;
        Mon, 23 Mar 2020 04:32:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=pp5Wxvr4;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id C5E3D4B08C;
	Mon, 23 Mar 2020 07:32:52 -0400 (EDT)
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
	with ESMTP id 1K4eT+mwXBew; Mon, 23 Mar 2020 07:32:51 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 84EA64B0B4;
	Mon, 23 Mar 2020 07:32:51 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 412FA4A4CD
 for <kvmarm@lists.cs.columbia.edu>; Mon, 23 Mar 2020 07:32:50 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3XlVwWguPBS6 for <kvmarm@lists.cs.columbia.edu>;
 Mon, 23 Mar 2020 07:32:49 -0400 (EDT)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id ECAB24A4C0
 for <kvmarm@lists.cs.columbia.edu>; Mon, 23 Mar 2020 07:32:48 -0400 (EDT)
Received: by mail-wr1-f65.google.com with SMTP id w10so16613153wrm.4
 for <kvmarm@lists.cs.columbia.edu>; Mon, 23 Mar 2020 04:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GaQ4g7QDEtdpn1PcCIastdRRg2zyGK27S8LR99mMZas=;
 b=pp5Wxvr4Du/WTB/gu8fud7xlb9//dvkQWp56p0gUIaU5tZLc8OcBvoOQZW2tT618lJ
 VYTZUsBnWGv2YeqaOBHyh7+diBDCDd/DrDaRXWZu+XRDRpY/ALv9XhMzxY8DFwmwNyRj
 3Dx0FxRVGn3K6aGDjGViEaeAge2/JyCvMyZ2uPpXiVn9RysWkSSvtescOI38GR+1sFnm
 BgSotaIfWdIuFSd5YRdKr1LcB1VKVzAoBwGYhvv7ucGwZEliPojAKD/coHiEEHyqIzB9
 XYTjxg2VMK0cr/JObPhajaaP9R+HlR9eXbllhI+wrVb8kC953+FPM4LNxwLNzOQmUwq7
 /Wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=GaQ4g7QDEtdpn1PcCIastdRRg2zyGK27S8LR99mMZas=;
 b=K7ShhkuipJCdkqThE+qunifQidNyABzxieY/FJ1PYMygfKiu4q/9SEyDyZrE6IG8Ml
 MEUOnQgI3d55vVz6PvaBg56DIkO55TwZml+WOKMiAUBoecZHJ8XQ59PkCzMNmfxZkIXa
 qmY95Y5OML+CLzpBlgcmImNmFwzprvV2PkJDVmoBmtAZ/yPwOun3hju1Kjmd6B1n31aD
 D6CjhILHWc9RC2vAm/vAE2CQVziYsMquh72ZpaPrKTkzCVzJj0jr4yCYBoUJM9Y/E91C
 km0Kd4GAxs/KTwJunYb0Z+UeHlTsJmNdOWJl4lc1VS0Mcx4O5IURTeau9zmOfGda3Ecw
 UwPA==
X-Gm-Message-State: ANhLgQ1UT6PMUOPwScupzdTS0YungSqSh085VO4b1mmKIDDhE+hDKZMC
 TFXqucebu7QRFIyzFYkDAyrH4w==
X-Received: by 2002:adf:b60d:: with SMTP id f13mr1183897wre.12.1584963168016; 
 Mon, 23 Mar 2020 04:32:48 -0700 (PDT)
Received: from moi-limbo-9350.home
 (host86-177-220-180.range86-177.btcentralplus.com. [86.177.220.180])
 by smtp.gmail.com with ESMTPSA id 98sm23288473wrk.52.2020.03.23.04.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 04:32:47 -0700 (PDT)
From: Beata Michalska <beata.michalska@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/2] target/arm: kvm: Handle potential issue with dabt
 injection
Date: Mon, 23 Mar 2020 11:32:27 +0000
Message-Id: <20200323113227.3169-3-beata.michalska@linaro.org>
In-Reply-To: <20200323113227.3169-1-beata.michalska@linaro.org>
References: <20200323113227.3169-1-beata.michalska@linaro.org>
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
X-TUID: O2hnlTmZd8W4

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
---
 target/arm/cpu.h     |  1 +
 target/arm/kvm.c     | 30 +++++++++++++++++++++++++++++-
 target/arm/kvm32.c   | 25 +++++++++++++++++++++++++
 target/arm/kvm64.c   | 34 ++++++++++++++++++++++++++++++++++
 target/arm/kvm_arm.h | 10 ++++++++++
 5 files changed, 99 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4f834c1..868afc6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -561,6 +561,7 @@ typedef struct CPUARMState {
     } serror;
 
     uint8_t ext_dabt_pending; /* Request for injecting ext DABT */
+    uint8_t ext_dabt_raised; /* Tracking/verifying injection of ext DABT */
 
     /* State of our input IRQ/FIQ/VIRQ/VFIQ lines */
     uint32_t irq_line_state;
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index c088589..58ad734 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -721,7 +721,12 @@ int kvm_put_vcpu_events(ARMCPU *cpu)
     ret = kvm_vcpu_ioctl(CPU(cpu), KVM_SET_VCPU_EVENTS, &events);
     if (ret) {
         error_report("failed to put vcpu events");
-    } else {
+    } else if (env->ext_dabt_pending) {
+        /*
+         * Mark that the external DABT has been injected,
+         * if one has been requested
+         */
+        env->ext_dabt_raised = env->ext_dabt_pending;
         /* Clear instantly if the call was successful */
         env->ext_dabt_pending = 0;
     }
@@ -755,6 +760,29 @@ int kvm_get_vcpu_events(ARMCPU *cpu)
 
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
diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index f271181..86c4fe7 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -564,3 +564,28 @@ void kvm_arm_pmu_init(CPUState *cs)
 {
     qemu_log_mask(LOG_UNIMP, "%s: not implemented\n", __func__);
 }
+
+#define ARM_REG_DFSR  ARM_CP15_REG32(0, 5, 0, 0)
+#define ARM_REG_TTBCR ARM_CP15_REG32(0, 2, 0, 2)
+
+#define DFSR_FSC(v)   (((v) >> 6 | (v)) & 0x1F)
+#define DFSC_EXTABT(lpae) (lpae) ? 0x10 : 0x08
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
+        return !(DFSR_FSC(dfsr_val) != DFSC_EXTABT(lpae));
+    }
+    return false;
+}
+
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index be5b31c..18594e9 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1430,3 +1430,37 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
 
     return false;
 }
+
+#define ARM64_REG_ESR_EL1 ARM64_SYS_REG(3, 0, 5, 2, 0)
+#define ARM64_REG_TCR_EL1 ARM64_SYS_REG(3, 0, 2, 0, 2)
+
+#define ESR_DFSC(aarch64, v)    \
+    ((aarch64) ? ((v) & 0x3F)   \
+               : (((v) >> 6 | (v)) & 0x1F))
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
+        return !(ESR_DFSC(aarch64_mode, dfsr_val) !=
+                ESR_DFSC_EXTABT(aarch64_mode, lpae));
+    }
+    return false;
+}
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 39472d5..f2dc6a2 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -461,6 +461,16 @@ void kvm_arm_copy_hw_debug_data(struct kvm_guest_debug_arch *ptr);
 int kvm_arm_handle_dabt_nisv(CPUState *cs, uint64_t esr_iss,
                              uint64_t fault_ipa);
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
