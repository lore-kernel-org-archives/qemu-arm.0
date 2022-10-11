Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2883615ocg;
        Mon, 10 Oct 2022 20:20:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Z0Gn12YaLzO7Q//gxX8iN1lLojQRG4ol4RwARnQ8rqlxpIJ5RvnZCjYrC+A1VS3vGrAY7
X-Received: by 2002:a05:620a:100a:b0:6ed:cdf3:1954 with SMTP id z10-20020a05620a100a00b006edcdf31954mr3606735qkj.440.1665458402072;
        Mon, 10 Oct 2022 20:20:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665458402; cv=none;
        d=google.com; s=arc-20160816;
        b=wRyW/z1qREwyk8zCqB0mEQor1+WnK/MPRd9ivWV6kIQ3vE+jTbhLRogHub5pZdedaF
         jFoUsNC1WfHEEnWyabaV9ip+HKyY+PPw66Pr2lbKXnXtSMuU5hoY0hrY40XYmBwHQ3Lz
         bzMpX7N2l09cI/Je6zNGGS/RoyH/c2MCV1acjd9emZu64Gtx7jBJ+rOCXp7nBDWH9Vv1
         DBeS4IXUpKSzDz5I3XRsJtlPPK8E8scfPrC+3JI4cpvGT7qwKZXnnjbmt8QI0E+WTfA8
         52ywXMf3aGinyNRuvtrytYZP/C6H/UvqdWIOsB23nR3c8RizijaJN6JhMVxolwH2/O5l
         LJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rJhyjafjgqKk8I6LVsm5b/FzC0MtOu7IjX7/w4ZcQiI=;
        b=RUm8lKoBo6ZIEoni214Ftvih0V2PIzl/JX4+p9xlF8Vp3BR8BUuUQUrUuAmrwzvb5p
         EELWbntnWqDDWNoeti2CLNpkcu7croNKI4tM0JrVZlVPGQJiva1pnhHD1f5YMqjK9i7L
         g0WgQVIWUurQgcq8UfYqrlylzAHWj7O56ri4r+dWfmHcv/d1FKWa/WTgKIGJ2dPDUWx3
         yGu1m1enABvYi13LCxx5bpd1x8nPOYVNe0qzx395/He06g+l9Gniyue+5Vq7014Le5vH
         Tg+ia7vpgbiGoy2dygme1kZFApvRT2r10YRNSNEH7OIsC0g7NTqxaPBX5eeqwv17Wo5+
         ZMcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZOC0dIoz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iw6-20020a0562140f2600b004afa1c276a8si5669970qvb.311.2022.10.10.20.20.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 20:20:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZOC0dIoz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oi5oH-0002Ge-KW
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 23:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5ni-0002Ec-VX
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:27 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:38574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nc-0002zv-BZ
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:25 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so14737370pjq.3
 for <qemu-arm@nongnu.org>; Mon, 10 Oct 2022 20:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rJhyjafjgqKk8I6LVsm5b/FzC0MtOu7IjX7/w4ZcQiI=;
 b=ZOC0dIozl7SO6MERyNTvLIksE8337e+0QIxBWoS1YG++s/rRK/B/2cgYt6VROHhroD
 wOFG1yYsPWn2Joi4vSHHhnrV7YdTrAIq9F2zoEOZ8xDMvCce2g24XUbjDJ8YIUTwRi0z
 Www/fPKLPR4QC24m4w1IjzhGM9sZr4EszvQMU/LiDzKq+T64dZeM68EQDR5WRWz3BGp7
 +MjlAKL/YeghgHbpztV5z3Asmc56yRGAgQ/BgmeQSpIryikeJs/1VFZjf3tcA3FGloAZ
 SI96Ey9s0JJsh+oCe/LDyWC4qWfXdxVpBe5oJBMvwDNwDerXOqoPh1Z/ZrswROM0mjas
 mrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rJhyjafjgqKk8I6LVsm5b/FzC0MtOu7IjX7/w4ZcQiI=;
 b=K2vR/1QtNC70MkJYXEFkKQtgsN2Hr/rBmU1nxj8Uc48fI6rrV1noEmgQQ/xI8oK+vF
 jo1evOscd011ZuAEGbfoK6HC4B7KrvrJB+lMHn8VU1NjaK4TvaqTX2AFO3qOSBRusa+A
 oqY79mOno60aY1i7GSUTDwRC10F4ZyjHAdZfzBHBjJ7O/nNs/01YOmzzgRDPfiTs1ECA
 +SrKN++fLB41Fn21fBX5DdKXLBCB0DkEsts/gxRnLYiOp9VtyuxCiougnyIpUxjRf1Yc
 O8EBt74HJuCsgmw1qMO7F3l+s90binGkL5tnT9iHgtfDttumyod5RTN7mqYdk1bZRnUq
 C1Wg==
X-Gm-Message-State: ACrzQf3fyKYX5hZ2HrGXQol1NDh6gmg0x4jC2izLujbR10xT/o1XSBEd
 NBffTx4rpIhx0rLMi928i2YYLA==
X-Received: by 2002:a17:902:da83:b0:17a:111:ebdf with SMTP id
 j3-20020a170902da8300b0017a0111ebdfmr22206155plx.149.1665458358387; 
 Mon, 10 Oct 2022 20:19:18 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 03/24] target/arm: Use probe_access_full for BTI
Date: Mon, 10 Oct 2022 20:18:50 -0700
Message-Id: <20221011031911.2408754-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-TUID: m+6HXbD1sNuS

Add a field to TARGET_PAGE_ENTRY_EXTRA to hold the guarded bit.
In is_guarded_page, use probe_access_full instead of just guessing
that the tlb entry is still present.  Also handles the FIXME about
executing from device memory.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h     |  9 +++++----
 target/arm/cpu.h           | 13 -------------
 target/arm/internals.h     |  1 +
 target/arm/ptw.c           |  7 ++++---
 target/arm/translate-a64.c | 21 ++++++++++-----------
 5 files changed, 20 insertions(+), 31 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 38347b0d20..f4338fd10e 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -36,12 +36,13 @@
  *
  * For ARMMMUIdx_Stage2*, pte_attrs is the S2 descriptor bits [5:2].
  * Otherwise, pte_attrs is the same as the MAIR_EL1 8-bit format.
- * For shareability, as in the SH field of the VMSAv8-64 PTEs.
+ * For shareability and guarded, as in the SH and GP fields respectively
+ * of the VMSAv8-64 PTEs.
  */
 # define TARGET_PAGE_ENTRY_EXTRA  \
-     uint8_t pte_attrs;           \
-     uint8_t shareability;
-
+    uint8_t pte_attrs;            \
+    uint8_t shareability;         \
+    bool guarded;
 #endif
 
 #define NB_MMU_MODES 8
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f09ec8aa03..a34d496c5b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3388,19 +3388,6 @@ static inline uint64_t *aa64_vfp_qreg(CPUARMState *env, unsigned regno)
 /* Shared between translate-sve.c and sve_helper.c.  */
 extern const uint64_t pred_esz_masks[5];
 
-/* Helper for the macros below, validating the argument type. */
-static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
-{
-    return x;
-}
-
-/*
- * Lvalue macros for ARM TLB bits that we must cache in the TCG TLB.
- * Using these should be a bit more self-documenting than using the
- * generic target bits directly.
- */
-#define arm_tlb_bti_gp(x) (typecheck_memtxattrs(x)->target_tlb_bit0)
-
 /*
  * AArch64 usage of the PAGE_TARGET_* bits for linux-user.
  * Note that with the Linux kernel, PROT_MTE may not be cleared by mprotect
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 9566364dca..c3c3920ded 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1095,6 +1095,7 @@ typedef struct ARMCacheAttrs {
     unsigned int attrs:8;
     unsigned int shareability:2; /* as in the SH field of the VMSAv8-64 PTEs */
     bool is_s2_format:1;
+    bool guarded:1;              /* guarded bit of the v8-64 PTE */
 } ARMCacheAttrs;
 
 /* Fields that are valid upon success. */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 23f16f4ff7..2d182d62e5 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1313,9 +1313,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          */
         result->f.attrs.secure = false;
     }
-    /* When in aarch64 mode, and BTI is enabled, remember GP in the IOTLB.  */
-    if (aarch64 && guarded && cpu_isar_feature(aa64_bti, cpu)) {
-        arm_tlb_bti_gp(&result->f.attrs) = true;
+
+    /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB.  */
+    if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
+        result->f.guarded = guarded;
     }
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5b67375f4e..60ff753d81 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14601,22 +14601,21 @@ static bool is_guarded_page(CPUARMState *env, DisasContext *s)
 #ifdef CONFIG_USER_ONLY
     return page_get_flags(addr) & PAGE_BTI;
 #else
+    CPUTLBEntryFull *full;
+    void *host;
     int mmu_idx = arm_to_core_mmu_idx(s->mmu_idx);
-    unsigned int index = tlb_index(env, mmu_idx, addr);
-    CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
+    int flags;
 
     /*
      * We test this immediately after reading an insn, which means
-     * that any normal page must be in the TLB.  The only exception
-     * would be for executing from flash or device memory, which
-     * does not retain the TLB entry.
-     *
-     * FIXME: Assume false for those, for now.  We could use
-     * arm_cpu_get_phys_page_attrs_debug to re-read the page
-     * table entry even for that case.
+     * that the TLB entry must be present and valid, and thus this
+     * access will never raise an exception.
      */
-    return (tlb_hit(entry->addr_code, addr) &&
-            arm_tlb_bti_gp(&env_tlb(env)->d[mmu_idx].fulltlb[index].attrs));
+    flags = probe_access_full(env, addr, MMU_INST_FETCH, mmu_idx,
+                              false, &host, &full, 0);
+    assert(!(flags & TLB_INVALID_MASK));
+
+    return full->guarded;
 #endif
 }
 
-- 
2.34.1

