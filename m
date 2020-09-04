Received: by 2002:a0c:f381:0:0:0:0:0 with SMTP id i1csp2329617qvk;
        Fri, 4 Sep 2020 08:42:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwV2SZ47+SIm+ZD5FA+9nbXCml+RjwB4qda+7StGMwC1EqR/lvAaL10cuCnEmEmSPjMIgaP
X-Received: by 2002:a5b:30b:: with SMTP id j11mr11082958ybp.483.1599234139695;
        Fri, 04 Sep 2020 08:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599234139; cv=none;
        d=google.com; s=arc-20160816;
        b=c7sIy9dCCRb4EjMjPmQZMI2bcJW9IK1cC602R6YaQv/kMULBOFQvFZ+grcvuiWy3zA
         3ii2nmlwPxeT/N5Jk+U5NRkmuF+5F9EcEzNNc+WxGfJFoSCXOizMHO78uebE4aiY1A9w
         mtoYxZE4VtrC+mTkXavZ6+0B49ckVUH0fZmK9o28lvgLP7Q8DB8verK/4zLhvZ13ntX9
         UORXzFtI1kwX3o2eRyqnUGS+cvUpSWkm2V4kDtuvj0PQWRl+OkntylLJh0gx6GEga8D/
         vyp/EmH9LhBQ77QyE8DVpOAtOEaWOvFERX5JRwfoIvmrOStO77F9IrRxEhkB2lg1uwCL
         uHzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=z19lhYlJYs3eXeWM3NbccxsHJZHVss+dp0q20xSXXDY=;
        b=qeYQw9DU96VL7Fhju/cMZkS6e94vLI3Ko0IV7kiKmC/WtNCyQL5HDzD0MGT/DoiUGg
         x3xDfv7k052pJwp0Rz8jRMzhZJhF24Z/sBmQe4XtjB2e5F6C2hnC74dXfasQrwRKZllF
         L8GPKdJRJ+Yt92qDfTJbiqFa417Zvo9Yq9JguMPNUthYMJuAF8BCCm02kuAdVmQhhjmA
         zLVIrGJA2+foIIM6qAUSn7kdkRJu5TZUSX9ebvxTgFgSxoxi/IPGgfyCt6f/Gxk6Prv6
         sHsSIq+MTPvwMNVSqyPbOlYSGmk0Bsx8EuI80VcRaIulmaPFC2XA6GkfeM0ovg7uPTJM
         n9Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YxgOmX8Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f66si6422298ybf.369.2020.09.04.08.42.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Sep 2020 08:42:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YxgOmX8Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kEDr1-0005U7-5X
	for alex.bennee@linaro.org; Fri, 04 Sep 2020 11:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kEDqo-0005Oa-6H
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 11:42:09 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kEDql-0006xV-Cj
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 11:42:05 -0400
Received: by mail-wr1-x431.google.com with SMTP id c18so7169849wrm.9
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2020 08:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=z19lhYlJYs3eXeWM3NbccxsHJZHVss+dp0q20xSXXDY=;
 b=YxgOmX8ZVr/3DHqOeT3KNB+DUh5oLVm88qVZ6PxDi47rqFjx0oQ+YL0CMAITEPAJZm
 BOZRZEAJh9DEuxkkL3DVPxAbmdb7XQ4PW9NaGQAKiG7/iq/Xx4ix6KHxMjiTW2W2S5Rh
 VlpcbpVijUQGyNwhDrBHc0kUi0Jnz5NMNgZK23l7i4ZqbhrYLH7e7YnjF4TQJ7J1QO4p
 Am4+DY5z8xJatVrxBFGKUJJiU+BCLVeS2J4mw0KNiaI5D0BXpl33hquR5NgbUeHrDRcW
 sA5UNtYDLbnywGc/kyw0wg42Aa72YJeVOXyWXdoTOMOx6tQrJVSzkztHN0zfnUIHHsD+
 xJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z19lhYlJYs3eXeWM3NbccxsHJZHVss+dp0q20xSXXDY=;
 b=BwNY4qkrtuEl3sESXBWjMWzzSRi2WCUPfrqvoRsPYodI/toBiYE5ms++lk+OrlQIda
 R9EwbX+WXq3gKnPf2d9D+Glj1g+9kBd458xWE1EMdSu+MNbiQmyAuIQBcuaP5539FpTF
 CXU0ll7gIWQUHJ3hXF3Gr8WiT47Cqx5gcOu67WvnRSCL4HbrtYmyu7BIS74jkqjsBtlS
 bGZGS/Q7VifLmWAIdwnMJvWNfE2uZoOKa1SFARnbWLwIh1MVCg5fscgNBv4pBBUCfPLG
 5+LO20RjhLrTmn+Yl+kdJ8TSfQin3fqvHSH5bE/VkKfP5yLsckbD9C1ma1o4wKU4jjeC
 At/w==
X-Gm-Message-State: AOAM532V3WxMxivJXjwHc4/woJ9rULBUDu2yowCvrYuTdDmdZGnI7C2M
 V4BXYGWEH9ioOTmDLUWj4xILC/4XLi1zRcgK
X-Received: by 2002:a5d:634d:: with SMTP id b13mr8481271wrw.324.1599234121257; 
 Fri, 04 Sep 2020 08:42:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f14sm12723743wrv.72.2020.09.04.08.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 08:42:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/arm: Remove no-longer-reachable 32-bit KVM code
Date: Fri,  4 Sep 2020 16:41:56 +0100
Message-Id: <20200904154156.31943-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200904154156.31943-1-peter.maydell@linaro.org>
References: <20200904154156.31943-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SzptePStfqyW

Now that 32-bit KVM host support is gone, KVM can never
be enabled unless CONFIG_AARCH64 is true, and some code
paths are no longer reachable and can be deleted.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/kvm-consts.h |   7 ---
 target/arm/kvm_arm.h    |   6 ---
 target/arm/cpu.c        | 100 ++++++++++++++++++----------------------
 target/arm/kvm.c        |   7 ---
 4 files changed, 46 insertions(+), 74 deletions(-)

diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
index aad28258a36..580f1c1fee0 100644
--- a/target/arm/kvm-consts.h
+++ b/target/arm/kvm-consts.h
@@ -136,16 +136,11 @@ MISMATCH_CHECK(QEMU_PSCI_RET_DISABLED, PSCI_RET_DISABLED);
  */
 #define QEMU_KVM_ARM_TARGET_NONE UINT_MAX
 
-#ifdef TARGET_AARCH64
 MISMATCH_CHECK(QEMU_KVM_ARM_TARGET_AEM_V8, KVM_ARM_TARGET_AEM_V8);
 MISMATCH_CHECK(QEMU_KVM_ARM_TARGET_FOUNDATION_V8, KVM_ARM_TARGET_FOUNDATION_V8);
 MISMATCH_CHECK(QEMU_KVM_ARM_TARGET_CORTEX_A57, KVM_ARM_TARGET_CORTEX_A57);
 MISMATCH_CHECK(QEMU_KVM_ARM_TARGET_XGENE_POTENZA, KVM_ARM_TARGET_XGENE_POTENZA);
 MISMATCH_CHECK(QEMU_KVM_ARM_TARGET_CORTEX_A53, KVM_ARM_TARGET_CORTEX_A53);
-#else
-MISMATCH_CHECK(QEMU_KVM_ARM_TARGET_CORTEX_A15, KVM_ARM_TARGET_CORTEX_A15);
-MISMATCH_CHECK(QEMU_KVM_ARM_TARGET_CORTEX_A7, KVM_ARM_TARGET_CORTEX_A7);
-#endif
 
 #define CP_REG_ARM64                   0x6000000000000000ULL
 #define CP_REG_ARM_COPROC_MASK         0x000000000FFF0000
@@ -165,7 +160,6 @@ MISMATCH_CHECK(QEMU_KVM_ARM_TARGET_CORTEX_A7, KVM_ARM_TARGET_CORTEX_A7);
 /* No kernel define but it's useful to QEMU */
 #define CP_REG_ARM64_SYSREG_CP (CP_REG_ARM64_SYSREG >> CP_REG_ARM_COPROC_SHIFT)
 
-#ifdef TARGET_AARCH64
 MISMATCH_CHECK(CP_REG_ARM64, KVM_REG_ARM64);
 MISMATCH_CHECK(CP_REG_ARM_COPROC_MASK, KVM_REG_ARM_COPROC_MASK);
 MISMATCH_CHECK(CP_REG_ARM_COPROC_SHIFT, KVM_REG_ARM_COPROC_SHIFT);
@@ -180,7 +174,6 @@ MISMATCH_CHECK(CP_REG_ARM64_SYSREG_CRM_MASK, KVM_REG_ARM64_SYSREG_CRM_MASK);
 MISMATCH_CHECK(CP_REG_ARM64_SYSREG_CRM_SHIFT, KVM_REG_ARM64_SYSREG_CRM_SHIFT);
 MISMATCH_CHECK(CP_REG_ARM64_SYSREG_OP2_MASK, KVM_REG_ARM64_SYSREG_OP2_MASK);
 MISMATCH_CHECK(CP_REG_ARM64_SYSREG_OP2_SHIFT, KVM_REG_ARM64_SYSREG_OP2_SHIFT);
-#endif
 
 #undef MISMATCH_CHECK
 
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index adb38514bf2..bc178eeb84c 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -406,13 +406,7 @@ static inline const char *gic_class_name(void)
 static inline const char *gicv3_class_name(void)
 {
     if (kvm_irqchip_in_kernel()) {
-#ifdef TARGET_AARCH64
         return "kvm-arm-gicv3";
-#else
-        error_report("KVM GICv3 acceleration is not supported on this "
-                     "platform");
-        exit(1);
-#endif
     } else {
         if (kvm_enabled()) {
             error_report("Userspace GICv3 is not supported with KVM");
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c179e0752da..cb1fa2a35c3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2099,72 +2099,68 @@ static void cortex_a15_initfn(Object *obj)
 }
 
 #ifndef TARGET_AARCH64
-/* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
- * otherwise, a CPU with as many features enabled as our emulation supports.
+/*
+ * -cpu max: a CPU with as many features enabled as our emulation supports.
  * The version of '-cpu max' for qemu-system-aarch64 is defined in cpu64.c;
- * this only needs to handle 32 bits.
+ * this only needs to handle 32 bits, and need not care about KVM.
  */
 static void arm_max_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
-    if (kvm_enabled()) {
-        kvm_arm_set_cpu_features_from_host(cpu);
-    } else {
-        cortex_a15_initfn(obj);
+    cortex_a15_initfn(obj);
 
-        /* old-style VFP short-vector support */
-        cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
+    /* old-style VFP short-vector support */
+    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
 
 #ifdef CONFIG_USER_ONLY
-        /* We don't set these in system emulation mode for the moment,
-         * since we don't correctly set (all of) the ID registers to
-         * advertise them.
-         */
-        set_feature(&cpu->env, ARM_FEATURE_V8);
-        {
-            uint32_t t;
+    /* We don't set these in system emulation mode for the moment,
+     * since we don't correctly set (all of) the ID registers to
+     * advertise them.
+     */
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    {
+        uint32_t t;
 
-            t = cpu->isar.id_isar5;
-            t = FIELD_DP32(t, ID_ISAR5, AES, 2);
-            t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);
-            t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);
-            t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
-            t = FIELD_DP32(t, ID_ISAR5, RDM, 1);
-            t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);
-            cpu->isar.id_isar5 = t;
+        t = cpu->isar.id_isar5;
+        t = FIELD_DP32(t, ID_ISAR5, AES, 2);
+        t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);
+        t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);
+        t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
+        t = FIELD_DP32(t, ID_ISAR5, RDM, 1);
+        t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);
+        cpu->isar.id_isar5 = t;
 
-            t = cpu->isar.id_isar6;
-            t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);
-            t = FIELD_DP32(t, ID_ISAR6, DP, 1);
-            t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
-            t = FIELD_DP32(t, ID_ISAR6, SB, 1);
-            t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
-            cpu->isar.id_isar6 = t;
+        t = cpu->isar.id_isar6;
+        t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);
+        t = FIELD_DP32(t, ID_ISAR6, DP, 1);
+        t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
+        t = FIELD_DP32(t, ID_ISAR6, SB, 1);
+        t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
+        cpu->isar.id_isar6 = t;
 
-            t = cpu->isar.mvfr1;
-            t = FIELD_DP32(t, MVFR1, FPHP, 3);     /* v8.2-FP16 */
-            t = FIELD_DP32(t, MVFR1, SIMDHP, 2);   /* v8.2-FP16 */
-            cpu->isar.mvfr1 = t;
+        t = cpu->isar.mvfr1;
+        t = FIELD_DP32(t, MVFR1, FPHP, 3);     /* v8.2-FP16 */
+        t = FIELD_DP32(t, MVFR1, SIMDHP, 2);   /* v8.2-FP16 */
+        cpu->isar.mvfr1 = t;
 
-            t = cpu->isar.mvfr2;
-            t = FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
-            t = FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
-            cpu->isar.mvfr2 = t;
+        t = cpu->isar.mvfr2;
+        t = FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
+        t = FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
+        cpu->isar.mvfr2 = t;
 
-            t = cpu->isar.id_mmfr3;
-            t = FIELD_DP32(t, ID_MMFR3, PAN, 2); /* ATS1E1 */
-            cpu->isar.id_mmfr3 = t;
+        t = cpu->isar.id_mmfr3;
+        t = FIELD_DP32(t, ID_MMFR3, PAN, 2); /* ATS1E1 */
+        cpu->isar.id_mmfr3 = t;
 
-            t = cpu->isar.id_mmfr4;
-            t = FIELD_DP32(t, ID_MMFR4, HPDS, 1); /* AA32HPD */
-            t = FIELD_DP32(t, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
-            t = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
-            t = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
-            cpu->isar.id_mmfr4 = t;
-        }
-#endif
+        t = cpu->isar.id_mmfr4;
+        t = FIELD_DP32(t, ID_MMFR4, HPDS, 1); /* AA32HPD */
+        t = FIELD_DP32(t, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
+        t = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
+        t = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
+        cpu->isar.id_mmfr4 = t;
     }
+#endif
 }
 #endif
 
@@ -2269,11 +2265,7 @@ static void arm_host_initfn(Object *obj)
 
 static const TypeInfo host_arm_cpu_type_info = {
     .name = TYPE_ARM_HOST_CPU,
-#ifdef TARGET_AARCH64
     .parent = TYPE_AARCH64_CPU,
-#else
-    .parent = TYPE_ARM_CPU,
-#endif
     .instance_init = arm_host_initfn,
 };
 
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 8bb7318378b..2eae73315d6 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -918,22 +918,15 @@ int kvm_arch_process_async_events(CPUState *cs)
     return 0;
 }
 
-/* The #ifdef protections are until 32bit headers are imported and can
- * be removed once both 32 and 64 bit reach feature parity.
- */
 void kvm_arch_update_guest_debug(CPUState *cs, struct kvm_guest_debug *dbg)
 {
-#ifdef KVM_GUESTDBG_USE_SW_BP
     if (kvm_sw_breakpoints_active(cs)) {
         dbg->control |= KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_USE_SW_BP;
     }
-#endif
-#ifdef KVM_GUESTDBG_USE_HW
     if (kvm_arm_hw_debug_active(cs)) {
         dbg->control |= KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_USE_HW;
         kvm_arm_copy_hw_debug_data(&dbg->arch);
     }
-#endif
 }
 
 void kvm_arch_init_irq_routing(KVMState *s)
-- 
2.20.1

