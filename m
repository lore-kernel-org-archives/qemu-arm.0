Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp464927ocs;
        Sat, 1 Oct 2022 09:38:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7f6nHlMbtXm10s/ijFUmnUGze+jCJ17Qmih7iAbsstI08y31KYMzuyGATmI3wjVU7rxfIz
X-Received: by 2002:a05:622a:1790:b0:35c:8450:d9e4 with SMTP id s16-20020a05622a179000b0035c8450d9e4mr10941969qtk.130.1664642339676;
        Sat, 01 Oct 2022 09:38:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664642339; cv=none;
        d=google.com; s=arc-20160816;
        b=rKoSi6/TcBjDvydYoH7yuo52BbSE45QXQcaEuAxVz/i20OYe25yLLDnYAStRmWLWof
         7QFOkEhS69bvwFIj6tLd56stBcS606khch0R1Tvr8YO/KitJUXW1oQTm254Oe8thYyVx
         wvTKwn8hX477jjfzfhhDAywsBnT+hLWqy2tJnB8BORLrzFxLUNkgu4j5GgfENF0w8XQi
         G/LLcp2WltLvjvb3+qU91R6xWdZdhA3P+LDJyUyHOtlPKQg9GCBNO+xZ5cD76oCTzUwz
         Rzl5f+uNO9BtycCm0ZudRe4qrOeqUerqFfPgMsbTAznXMt6PiiCedFQNStbp+dqcOJzf
         I08w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=H5wRwyD67tK/HHDlYGbPLh0Azkr3is2XWTQhRNefVK0=;
        b=Dqc1wNIWa8kW5+1bISrXiDbBphVBx3w6FHf/1djoP21xS+sy/OoyM9Uu9JgK77qlba
         4bfjkao0H9qT/Y9w2uhnLzN89nl8s0toadKJZ+qVyEd4bxOiEFdlCptMcFY9Ogovhn47
         a2zIlI2uAl9bGeS6ErDjAZl4sDki908q1G3gX91LHB2nysyaWITcz4FWemhbMUnuOKp6
         3eW2tgZgqIF64fHUjzEh5IXfDrkiNDadrBNb3YZw/6e0Q8oHbwWth5Cvdm7GU/da7OkT
         Xp/UnvcSt/STARWwDENp2td/3E2lex7d9OYXoNlfmTqpnY9h+hpi/HcZllzsG2VDYMuf
         14Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FqPMFrjX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5-20020a0562141d2500b004afa1446195si2783808qvd.243.2022.10.01.09.38.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Oct 2022 09:38:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FqPMFrjX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oefVz-0002V6-4M
	for alex.bennee@linaro.org; Sat, 01 Oct 2022 12:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHp-0007Gf-Ht
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:21 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:44922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHn-0006E9-MN
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:21 -0400
Received: by mail-qk1-x72e.google.com with SMTP id y2so4533806qkl.11
 for <qemu-arm@nongnu.org>; Sat, 01 Oct 2022 09:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=H5wRwyD67tK/HHDlYGbPLh0Azkr3is2XWTQhRNefVK0=;
 b=FqPMFrjXrK5LaLhkzo4xfkgIlt2Py9uJxb+7qq+6t7Bp3DXC6Myk8wVKbUWd053XiU
 iaLvwc0HEjspgy433K98Tv7lnISFlD5way/hj0Y13Mq/gCcEZUlafQIWVQrquGk0w5jf
 27rdJGf/bVK4AWun+GMjPVc+rF1zswg0UHRYQ0DNXrlWXKH05gfULRx6ojE/gCENPw9x
 34XSQs0mLIw4DetdE38ijPye6NvKgsD6K/aycj+fmwvhWThrXDoXjWfni5CvIEJuPIHj
 indQiJL9nEABANnCbUNyhPWTyX16jHAwW2QPxn6CHQdbvDPQEDgMDHDy7LMjxPYC4aha
 kSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=H5wRwyD67tK/HHDlYGbPLh0Azkr3is2XWTQhRNefVK0=;
 b=RrcGiVUBfw5P5Thtmfs1Xq4fG7Bdjbz+QaN3mpn42/fd/tn+3jfJmTIuJmSly0cMrq
 1fUpW3dKaVcbK+4ZMc12K7yjf/svr7PX6r4JXen/H6TVfPknA6Vg1hJImsgsLpSY5qh6
 Uf/ERxaf7gNToGCF7ihoa2h7F6NDToaKyuxaQFlGVuZyTpr1hck2MVmlSh60FjoeD1UW
 Q605ULXzEkiIybzg0kDNjzYnPA4ksUyROZX2AFF0CTKNw6JiEgl1i/LSnYATxqZRifLo
 6+xvxJ8keLp2lodMqaBlBbE4S8DnjNShe6vidRQYqZHYeIWveBqBxdTCzFk0ECgqFIle
 thYg==
X-Gm-Message-State: ACrzQf3vVbSRr7u7yWbnfcRVppFpHk1WkFqrAEcI+79kCHGv7EjvDvgI
 A/Wt+VLLe6/tqLA0S7m52NangUwslJrTcA==
X-Received: by 2002:a05:620a:318a:b0:6ce:732a:f92 with SMTP id
 bi10-20020a05620a318a00b006ce732a0f92mr9662205qkb.347.1664641458978; 
 Sat, 01 Oct 2022 09:24:18 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 23/42] target/arm: Use probe_access_full for BTI
Date: Sat,  1 Oct 2022 09:22:59 -0700
Message-Id: <20221001162318.153420-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
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
X-TUID: VjDkk6jqPIVS

Add a field to TARGET_PAGE_ENTRY_EXTRA to hold the guarded bit.
In is_guarded_page, use probe_access_full instead of just guessing
that the tlb entry is still present.  Also handles the FIXME about
executing from device memory.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h     |  8 ++++----
 target/arm/cpu.h           | 13 -------------
 target/arm/internals.h     |  1 +
 target/arm/ptw.c           |  7 ++++---
 target/arm/translate-a64.c | 22 ++++++++--------------
 5 files changed, 17 insertions(+), 34 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 118ca0e5c0..689a9645dc 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -32,12 +32,12 @@
 # define TARGET_PAGE_BITS_MIN  10
 
 /*
- * Cache the attrs and sharability fields from the page table entry.
+ * Cache the attrs, sharability, and gp fields from the page table entry.
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
index 2694a93894..c8cad2ef7c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3382,19 +3382,6 @@ static inline uint64_t *aa64_vfp_qreg(CPUARMState *env, unsigned regno)
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
index fd17aee459..a50189e2e4 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1067,6 +1067,7 @@ typedef struct ARMCacheAttrs {
     unsigned int attrs:8;
     unsigned int shareability:2; /* as in the SH field of the VMSAv8-64 PTEs */
     bool is_s2_format:1;
+    bool guarded:1;              /* guarded bit of the v8-64 PTE */
 } ARMCacheAttrs;
 
 /* Fields that are valid upon success. */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1bc194ffa1..ccfef2caca 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1319,9 +1319,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
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
index 5b67375f4e..22802d1d2f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14601,22 +14601,16 @@ static bool is_guarded_page(CPUARMState *env, DisasContext *s)
 #ifdef CONFIG_USER_ONLY
     return page_get_flags(addr) & PAGE_BTI;
 #else
+    CPUTLBEntryFull *full;
+    void *host;
     int mmu_idx = arm_to_core_mmu_idx(s->mmu_idx);
-    unsigned int index = tlb_index(env, mmu_idx, addr);
-    CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
+    int flags;
 
-    /*
-     * We test this immediately after reading an insn, which means
-     * that any normal page must be in the TLB.  The only exception
-     * would be for executing from flash or device memory, which
-     * does not retain the TLB entry.
-     *
-     * FIXME: Assume false for those, for now.  We could use
-     * arm_cpu_get_phys_page_attrs_debug to re-read the page
-     * table entry even for that case.
-     */
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

