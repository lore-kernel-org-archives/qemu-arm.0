Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2885795ocg;
        Mon, 10 Oct 2022 20:26:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5uEGTZNGK32Hj22uhWMvfrmo/p2330S7qTiuH1fUVAKHR/y8hcMKhlOzWK9foJHtrYITMZ
X-Received: by 2002:a05:620a:2889:b0:6cf:5798:e126 with SMTP id j9-20020a05620a288900b006cf5798e126mr15353105qkp.588.1665458783044;
        Mon, 10 Oct 2022 20:26:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665458783; cv=none;
        d=google.com; s=arc-20160816;
        b=RsvWAorIvWojSJ/Qg/HQhsD60HggZUWJ8yJT8gGbBT5ujol46Ef9OFlxc2nmeHCNDl
         MO249mQbMrUAf1z0CE0jcvU6y2eJ3Ajuo/T8AUnuUxHVUqBe8fsiucbvcLGkviI3wvt0
         w9xeSrxSj5VuTCViqXz+GyjjeYmKDQ74/1wlvIKwCGjJk7n0l+vzZxiUF04o9bZqOpnG
         00YEAkbct1T+6XfCqeGD5A+7hDjwtaRQD9g8bsH9Dd31Pn7XLCxanmIVsI66/zfSCM8D
         rpXK82CPb0TadxjrOiAEwawesUFmODY9zZ80bShpYiiKvp03smrXa4Yj9DJHVamMxiZX
         VquQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=K+hPffD7L96yEm/9u0Lj/D1XcxsUpspCEItgw0se0dM=;
        b=cRPwUmC3qFYhdjYcF7waMnDggaEhoc8tf6al3ueeYpVGl4xuqX7EjMQS1UWWehuLXc
         zNSq2XoEGkUCVnLWE7c3sZkodeEtI8RfElVL1ijpm5a9/EHkkNzwg0uH3tRV4TeFsjfK
         ZVtdzYmnN+no/ebge7xW5yFO/+5EDkgMXECCV0iRpmYxDwO0lfECB4+5kYEoadRl7xJU
         peOutlyPQNy2c9cJ6/vDArkzeJ7v1N5PjJtY5eE+G0mDy/yfNlA05sLtNm+ZQKR6Bhi9
         aM5eEfcztZ4XVoVODKmb4r0ZFzBNqrqV7VvxOvsoslKw8TPaMLrCqypIbl1gkHRVGoVc
         fTLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hTKOQfTw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x16-20020a05620a14b000b006bbbdefd8a1si4759499qkj.727.2022.10.10.20.26.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 20:26:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hTKOQfTw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oi5uQ-0006BM-Jj
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 23:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5no-0002HH-BX
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:32 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:39900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5ng-00030P-P7
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:32 -0400
Received: by mail-pf1-x429.google.com with SMTP id d10so12350039pfh.6
 for <qemu-arm@nongnu.org>; Mon, 10 Oct 2022 20:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K+hPffD7L96yEm/9u0Lj/D1XcxsUpspCEItgw0se0dM=;
 b=hTKOQfTw7LV7UZGsVEdonHZEOyK6NEDjKZdEKmWpF4avl0faGO3mPEk9rZ3h3ulYqH
 l6BauhLKPXBNstYwAm+3Xx0sZRIBnI8R39KmSJe2RcSdtmAWd8LX1nKobjtrBd2xqqEb
 8klAIwthN5X9Pr1NqPpTkoLELglXvZOGWlxyoiEIyj+IVr8szLS0yjlVPYXzIVaCufXE
 bV95I/AB0WOwnHl44VjvLdlBKP6gj567X+Vayj7fcwPnQugqjqFCbm7gu/FComy3l//N
 rf/DcWfW2Fd+cPWFYM0nIHILW6S3AatlRkW0fbz5yp8i8oYKqxfTWA/27MtRsdb67uKq
 h72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K+hPffD7L96yEm/9u0Lj/D1XcxsUpspCEItgw0se0dM=;
 b=POOAGgq/NWfUGQqrfYwrbviyVHe+942mGJAPXQkOpONpQYfPVpIPpfiqsZahlhFf81
 AcbvtyqpSH46Bdv+ooZvqghgZqCRuU1hR8j1RTSxVtdx9y1cf+LkVOIXxBnZC3tWuDVx
 YWU81qlEiR2lPRp1zUOn47d2x1FbJ0PCm5WTo2IS+SgCOfS3KVbBcAFnKZ8UhJX7OyJ+
 rdQgOqNaJpm93Vpw8HwQFi6ayiOgCCOIzTl8jZYgvMe/56yX8pVTRikgRcR8lrMgctu7
 1XvBc6L205hSvV+64roJTc8LdG39Mmj3ysm02uFrPkBm8pC5RllM6jV6G+y0hqBHKSqQ
 2czA==
X-Gm-Message-State: ACrzQf0NxbjWMqfmaqQ1Orr+9z05jKxsAguhY3GSLRvuuW41aDej5ZqN
 Co6CtuPJ8M0LBM/SJdfnh2mNjzxPUcbXIA==
X-Received: by 2002:a63:4283:0:b0:457:dced:8ba3 with SMTP id
 p125-20020a634283000000b00457dced8ba3mr19207216pga.220.1665458361175; 
 Mon, 10 Oct 2022 20:19:21 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 05/24] target/arm: Move ARMMMUIdx_Stage2 to a real tlb
 mmu_idx
Date: Mon, 10 Oct 2022 20:18:52 -0700
Message-Id: <20221011031911.2408754-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: ED0WuZ8FpPsr

We had been marking this ARM_MMU_IDX_NOTLB, move it to a real tlb.
Flush the tlb when invalidating stage 1+2 translations.  Re-use
alle1_tlbmask() for other instances of EL1&0 + Stage2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Implement the IPAS2 and RIPAS2 tlb flushing insns;
    Reuse alle1_tlbmask to fix aa32 and vttbr flushing.
---
 target/arm/cpu-param.h |   2 +-
 target/arm/cpu.h       |  23 ++++---
 target/arm/helper.c    | 151 ++++++++++++++++++++++++++++++-----------
 3 files changed, 127 insertions(+), 49 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index a5b27db275..b7bde18986 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -45,6 +45,6 @@
     bool guarded;
 #endif
 
-#define NB_MMU_MODES 10
+#define NB_MMU_MODES 12
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f93060e6d6..c94e289012 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2906,8 +2906,9 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
  * EL2 (aka NS PL2)
  * EL3 (aka S PL1)
  * Physical (NS & S)
+ * Stage2 (NS & S)
  *
- * for a total of 10 different mmu_idx.
+ * for a total of 12 different mmu_idx.
  *
  * R profile CPUs have an MPU, but can use the same set of MMU indexes
  * as A profile. They only need to distinguish EL0 and EL1 (and
@@ -2976,6 +2977,15 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_Phys_NS   = 8 | ARM_MMU_IDX_A,
     ARMMMUIdx_Phys_S    = 9 | ARM_MMU_IDX_A,
 
+    /*
+     * Used for second stage of an S12 page table walk, or for descriptor
+     * loads during first stage of an S1 page table walk.  Note that both
+     * are in use simultaneously for SecureEL2: the security state for
+     * the S2 ptw is selected by the NS bit from the S1 ptw.
+     */
+    ARMMMUIdx_Stage2    = 10 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Stage2_S  = 11 | ARM_MMU_IDX_A,
+
     /*
      * These are not allocated TLBs and are used only for AT system
      * instructions or for the first stage of an S12 page table walk.
@@ -2983,15 +2993,6 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_Stage1_E0 = 0 | ARM_MMU_IDX_NOTLB,
     ARMMMUIdx_Stage1_E1 = 1 | ARM_MMU_IDX_NOTLB,
     ARMMMUIdx_Stage1_E1_PAN = 2 | ARM_MMU_IDX_NOTLB,
-    /*
-     * Not allocated a TLB: used only for second stage of an S12 page
-     * table walk, or for descriptor loads during first stage of an S1
-     * page table walk. Note that if we ever want to have a TLB for this
-     * then various TLB flush insns which currently are no-ops or flush
-     * only stage 1 MMU indexes will need to change to flush stage 2.
-     */
-    ARMMMUIdx_Stage2     = 3 | ARM_MMU_IDX_NOTLB,
-    ARMMMUIdx_Stage2_S   = 4 | ARM_MMU_IDX_NOTLB,
 
     /*
      * M-profile.
@@ -3022,6 +3023,8 @@ typedef enum ARMMMUIdxBit {
     TO_CORE_BIT(E20_2),
     TO_CORE_BIT(E20_2_PAN),
     TO_CORE_BIT(E3),
+    TO_CORE_BIT(Stage2),
+    TO_CORE_BIT(Stage2_S),
 
     TO_CORE_BIT(MUser),
     TO_CORE_BIT(MPriv),
diff --git a/target/arm/helper.c b/target/arm/helper.c
index dde64a487a..18c51bb777 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -399,6 +399,21 @@ static void contextidr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     raw_write(env, ri, value);
 }
 
+static int alle1_tlbmask(CPUARMState *env)
+{
+    /*
+     * Note that the 'ALL' scope must invalidate both stage 1 and
+     * stage 2 translations, whereas most other scopes only invalidate
+     * stage 1 translations.
+     */
+    return (ARMMMUIdxBit_E10_1 |
+            ARMMMUIdxBit_E10_1_PAN |
+            ARMMMUIdxBit_E10_0 |
+            ARMMMUIdxBit_Stage2 |
+            ARMMMUIdxBit_Stage2_S);
+}
+
+
 /* IS variants of TLB operations must affect all cores */
 static void tlbiall_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
@@ -501,10 +516,7 @@ static void tlbiall_nsnh_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     CPUState *cs = env_cpu(env);
 
-    tlb_flush_by_mmuidx(cs,
-                        ARMMMUIdxBit_E10_1 |
-                        ARMMMUIdxBit_E10_1_PAN |
-                        ARMMMUIdxBit_E10_0);
+    tlb_flush_by_mmuidx(cs, alle1_tlbmask(env));
 }
 
 static void tlbiall_nsnh_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -512,10 +524,7 @@ static void tlbiall_nsnh_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     CPUState *cs = env_cpu(env);
 
-    tlb_flush_by_mmuidx_all_cpus_synced(cs,
-                                        ARMMMUIdxBit_E10_1 |
-                                        ARMMMUIdxBit_E10_1_PAN |
-                                        ARMMMUIdxBit_E10_0);
+    tlb_flush_by_mmuidx_all_cpus_synced(cs, alle1_tlbmask(env));
 }
 
 
@@ -554,6 +563,24 @@ static void tlbimva_hyp_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                              ARMMMUIdxBit_E2);
 }
 
+static void tlbiipas2_hyp_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                uint64_t value)
+{
+    CPUState *cs = env_cpu(env);
+    uint64_t pageaddr = (value & MAKE_64BIT_MASK(0, 28)) << 12;
+
+    tlb_flush_page_by_mmuidx(cs, pageaddr, ARMMMUIdxBit_Stage2);
+}
+
+static void tlbiipas2is_hyp_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                uint64_t value)
+{
+    CPUState *cs = env_cpu(env);
+    uint64_t pageaddr = (value & MAKE_64BIT_MASK(0, 28)) << 12;
+
+    tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr, ARMMMUIdxBit_Stage2);
+}
+
 static const ARMCPRegInfo cp_reginfo[] = {
     /* Define the secure and non-secure FCSE identifier CP registers
      * separately because there is no secure bank in V8 (no _EL3).  This allows
@@ -3786,13 +3813,10 @@ static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     /*
      * A change in VMID to the stage2 page table (Stage2) invalidates
-     * the combined stage 1&2 tlbs (EL10_1 and EL10_0).
+     * the stage2 and combined stage 1&2 tlbs (EL10_1 and EL10_0).
      */
     if (raw_read(env, ri) != value) {
-        uint16_t mask = ARMMMUIdxBit_E10_1 |
-                        ARMMMUIdxBit_E10_1_PAN |
-                        ARMMMUIdxBit_E10_0;
-        tlb_flush_by_mmuidx(cs, mask);
+        tlb_flush_by_mmuidx(cs, alle1_tlbmask(env));
         raw_write(env, ri, value);
     }
 }
@@ -4313,18 +4337,6 @@ static void tlbi_aa64_vmalle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
-static int alle1_tlbmask(CPUARMState *env)
-{
-    /*
-     * Note that the 'ALL' scope must invalidate both stage 1 and
-     * stage 2 translations, whereas most other scopes only invalidate
-     * stage 1 translations.
-     */
-    return (ARMMMUIdxBit_E10_1 |
-            ARMMMUIdxBit_E10_1_PAN |
-            ARMMMUIdxBit_E10_0);
-}
-
 static int e2_tlbmask(CPUARMState *env)
 {
     return (ARMMMUIdxBit_E20_0 |
@@ -4467,6 +4479,43 @@ static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                                   ARMMMUIdxBit_E3, bits);
 }
 
+static int ipas2e1_tlbmask(CPUARMState *env, int64_t value)
+{
+    /*
+     * The MSB of value is the NS field, which only applies if SEL2
+     * is implemented and SCR_EL3.NS is not set (i.e. in secure mode).
+     */
+    return (value >= 0
+            && cpu_isar_feature(aa64_sel2, env_archcpu(env))
+            && arm_is_secure_below_el3(env)
+            ? ARMMMUIdxBit_Stage2_S
+            : ARMMMUIdxBit_Stage2);
+}
+
+static void tlbi_aa64_ipas2e1_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    uint64_t value)
+{
+    CPUState *cs = env_cpu(env);
+    int mask = ipas2e1_tlbmask(env, value);
+    uint64_t pageaddr = sextract64(value << 12, 0, 56);
+
+    if (tlb_force_broadcast(env)) {
+        tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr, mask);
+    } else {
+        tlb_flush_page_by_mmuidx(cs, pageaddr, mask);
+    }
+}
+
+static void tlbi_aa64_ipas2e1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                      uint64_t value)
+{
+    CPUState *cs = env_cpu(env);
+    int mask = ipas2e1_tlbmask(env, value);
+    uint64_t pageaddr = sextract64(value << 12, 0, 56);
+
+    tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr, mask);
+}
+
 #ifdef TARGET_AARCH64
 typedef struct {
     uint64_t base;
@@ -4652,6 +4701,20 @@ static void tlbi_aa64_rvae3is_write(CPUARMState *env,
 
     do_rvae_write(env, value, ARMMMUIdxBit_E3, true);
 }
+
+static void tlbi_aa64_ripas2e1_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                     uint64_t value)
+{
+    do_rvae_write(env, value, ipas2e1_tlbmask(env, value),
+                  tlb_force_broadcast(env));
+}
+
+static void tlbi_aa64_ripas2e1is_write(CPUARMState *env,
+                                       const ARMCPRegInfo *ri,
+                                       uint64_t value)
+{
+    do_rvae_write(env, value, ipas2e1_tlbmask(env, value), true);
+}
 #endif
 
 static CPAccessResult aa64_zva_access(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4930,10 +4993,12 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .writefn = tlbi_aa64_vae1_write },
     { .name = "TLBI_IPAS2E1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 1,
-      .access = PL2_W, .type = ARM_CP_NOP },
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_ipas2e1is_write },
     { .name = "TLBI_IPAS2LE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 5,
-      .access = PL2_W, .type = ARM_CP_NOP },
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_ipas2e1is_write },
     { .name = "TLBI_ALLE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 4,
       .access = PL2_W, .type = ARM_CP_NO_RAW,
@@ -4944,10 +5009,12 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .writefn = tlbi_aa64_alle1is_write },
     { .name = "TLBI_IPAS2E1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 1,
-      .access = PL2_W, .type = ARM_CP_NOP },
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_ipas2e1_write },
     { .name = "TLBI_IPAS2LE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 5,
-      .access = PL2_W, .type = ARM_CP_NOP },
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_ipas2e1_write },
     { .name = "TLBI_ALLE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 4,
       .access = PL2_W, .type = ARM_CP_NO_RAW,
@@ -5028,16 +5095,20 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .writefn = tlbimva_hyp_is_write },
     { .name = "TLBIIPAS2",
       .cp = 15, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 1,
-      .type = ARM_CP_NOP, .access = PL2_W },
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbiipas2_hyp_write },
     { .name = "TLBIIPAS2IS",
       .cp = 15, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 1,
-      .type = ARM_CP_NOP, .access = PL2_W },
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbiipas2is_hyp_write },
     { .name = "TLBIIPAS2L",
       .cp = 15, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 5,
-      .type = ARM_CP_NOP, .access = PL2_W },
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbiipas2_hyp_write },
     { .name = "TLBIIPAS2LIS",
       .cp = 15, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 5,
-      .type = ARM_CP_NOP, .access = PL2_W },
+      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .writefn = tlbiipas2is_hyp_write },
     /* 32 bit cache operations */
     { .name = "ICIALLUIS", .cp = 15, .opc1 = 0, .crn = 7, .crm = 1, .opc2 = 0,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_pou_access },
@@ -6694,10 +6765,12 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
       .writefn = tlbi_aa64_rvae1_write },
     { .name = "TLBI_RIPAS2E1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 2,
-      .access = PL2_W, .type = ARM_CP_NOP },
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_ripas2e1is_write },
     { .name = "TLBI_RIPAS2LE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 6,
-      .access = PL2_W, .type = ARM_CP_NOP },
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_ripas2e1is_write },
     { .name = "TLBI_RVAE2IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 2, .opc2 = 1,
       .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
@@ -6708,10 +6781,12 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
       .writefn = tlbi_aa64_rvae2is_write },
     { .name = "TLBI_RIPAS2E1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 2,
-      .access = PL2_W, .type = ARM_CP_NOP },
-   { .name = "TLBI_RIPAS2LE1", .state = ARM_CP_STATE_AA64,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_ripas2e1_write },
+    { .name = "TLBI_RIPAS2LE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 6,
-      .access = PL2_W, .type = ARM_CP_NOP },
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_ripas2e1_write },
    { .name = "TLBI_RVAE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 5, .opc2 = 1,
       .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
-- 
2.34.1

