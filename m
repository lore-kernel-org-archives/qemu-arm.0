Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2064124ejx;
        Tue, 12 Sep 2023 07:06:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF89OQa8oDK/ujuq2N4czYc1yDCekMk48SJjNC0zYr2BnpDVIMkORXgAkqVQe6n+toJFCHt
X-Received: by 2002:a05:622a:1187:b0:410:3461:a81d with SMTP id m7-20020a05622a118700b004103461a81dmr14631316qtk.21.1694527599013;
        Tue, 12 Sep 2023 07:06:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694527599; cv=none;
        d=google.com; s=arc-20160816;
        b=F5b7SNNaZ5WBygu4fMSwBBxgbBaKxgz3CaPVqkGWqcV+rvfpBtJJsGOQ4fM15fVpfE
         OrUgGmuK3+FPC8jKUka9KBeFdZPgYM+aSo0SZpGCcMW7OX2nqGZvSod+LvDiYKEgNNND
         9qS4l62IQ2HiOcfLJLrxs1anYc0vzIJNiq0NLESaOHExq3iZ/ksoIsv8QLrqMpT1Wdls
         6z9BwNAYuyG+adgLQ+pfMOrr6mYvgWd330zTr1lvLdZzFXErYuwK7VuEw9oGVDlZyXQp
         V1KgClfPG6LQPFuHgjWQk5c3mI+TKn8YrzEWaBXufVpWRkbWYVaJcZVjvcYrxXMtIZ+Z
         +J+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xWeyt5EAvAefsdum7L+OXTH/QqXTlR2KtCZ49pT3dfQ=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=xU5x9fCQ91RDkNOzn+6t/p0X5ACemUZ6d0z1Ly+4NJYhOtu6jbvLdE54qWTM56aUWO
         Qz/CLcIImf52WCclLFJ/Z71nvz2GUUeVarBpLYDVxGYfso0yn76ElDO3qIYO8xAxBLqC
         1+vZU1AD4EMNjForDEv91hBbW8N5wF1gz1J8uWXdaBEUM+5oQWwuf71+g4ZDqB5ec3eB
         iqtNW4bCZ8L63G0xR4bVtJWnghze5RWDo3ZTsW298bgqCHPmFpupBDQxfnNuM6JVw56n
         kSCzOIwtCTr5lrOP6V0+GMQJKJ/wGx9XqBQbYnFmXYjgbvY8M+aDzPr3RNRfRo4Jbgam
         /XiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=COOtc1xr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bw14-20020a05622a098e00b0041516f82881si4635470qtb.451.2023.09.12.07.06.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Sep 2023 07:06:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=COOtc1xr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qg415-000071-W2; Tue, 12 Sep 2023 10:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qg40j-00089U-46
 for qemu-devel@nongnu.org; Tue, 12 Sep 2023 10:05:01 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qg40T-0003qN-Hn
 for qemu-devel@nongnu.org; Tue, 12 Sep 2023 10:04:53 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-31adc5c899fso6021433f8f.2
 for <qemu-devel@nongnu.org>; Tue, 12 Sep 2023 07:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694527481; x=1695132281; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xWeyt5EAvAefsdum7L+OXTH/QqXTlR2KtCZ49pT3dfQ=;
 b=COOtc1xrzDh9kb9L2kACv89d0fQXeWU3OL0jYvA8B8v9ikB2oNTX7pGkSiBSHjSiKZ
 pjDup06YdEuzqG48nxpfREGzaEcKBYzRoM6Moatr/FDxiVOdoAZSosjRADCqABCbSzUH
 Z/33u5vYgurYDPBuv5vRoKTHIDlCUTLC+IRGD2IL54qZz4+8D5VZxqkl2yBFu11Y+HbG
 xWrPycE45y++TLTMWob73AtfwlPQCzfxokFcQK6nSA3Cd5kB+YK7UWnIiyJUBBUbUNlP
 rkcuPsvZ53++ieC8l/SG/OPtWPiEXBHeGYgV7BdZfHcrHYZJgC+nIFPpQDF7vkPSzp5c
 NJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694527481; x=1695132281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xWeyt5EAvAefsdum7L+OXTH/QqXTlR2KtCZ49pT3dfQ=;
 b=dX6CJN7kkSpA+8SHu4xCu2X7aPi65ie0CjMf7i9qCKcmsU/GaZkj4JbgLJ7YbJatuO
 0lRUJmzbbkxNF6tKccr2cEq/HfcRwhISycNMwdr4gdGm2yGAZIMVxw15UYXSm84LD126
 GEEg6MNXu4aoFiDatCZMPXSb7aVEG/py47tgjHMVgz0eUxFaTRpw4A3OWzmGKadwaAOW
 4ySqEYgXWsSszKZivQratHvIAN4ejPwhkHL95jSuheGUw+0JitkphhrARYOZEBojAZxi
 GZDm4HF3IbwkJIx7AbBRA+lkMKv+vvcbrfEUsg3GMbMbfPa9NzvxE0Jmre9HMeuSIdPN
 JRaA==
X-Gm-Message-State: AOJu0YwW4+n4Mvou7bXrV9+8u2A2rpy8BPD428QweFTaLat1O0MhPS5z
 f8KtJ4aGKNq+niugECLuCBVqzCwnTYpGVWVku8k=
X-Received: by 2002:adf:ea85:0:b0:314:3b1f:8ea2 with SMTP id
 s5-20020adfea85000000b003143b1f8ea2mr10796405wrm.6.1694527480996; 
 Tue, 12 Sep 2023 07:04:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a5d4983000000b00317ab75748bsm12892672wrq.49.2023.09.12.07.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 07:04:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 06/12] target/arm: Implement MTE tag-checking functions for
 FEAT_MOPS
Date: Tue, 12 Sep 2023 15:04:28 +0100
Message-Id: <20230912140434.1333369-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912140434.1333369-1-peter.maydell@linaro.org>
References: <20230912140434.1333369-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OSXy8y0Xw5qp

The FEAT_MOPS instructions need a couple of helper routines that
check for MTE tag failures:
 * mte_mops_probe() checks whether there is going to be a tag
   error in the next up-to-a-page worth of data
 * mte_check_fail() is an existing function to record the fact
   of a tag failure, which we need to make global so we can
   call it from helper-a64.c

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h      | 28 +++++++++++++++++++
 target/arm/tcg/mte_helper.c | 54 +++++++++++++++++++++++++++++++++++--
 2 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 5f5393b25c4..a70a7fd50f6 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1272,6 +1272,34 @@ FIELD(MTEDESC, SIZEM1, 12, SIMD_DATA_BITS - 12)  /* size - 1 */
 bool mte_probe(CPUARMState *env, uint32_t desc, uint64_t ptr);
 uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
 
+/**
+ * mte_mops_probe: Check where the next MTE failure is for a FEAT_MOPS operation
+ * @env: CPU env
+ * @ptr: start address of memory region (dirty pointer)
+ * @size: length of region (guaranteed not to cross a page boundary)
+ * @desc: MTEDESC descriptor word (0 means no MTE checks)
+ * Returns: the size of the region that can be copied without hitting
+ *          an MTE tag failure
+ *
+ * Note that we assume that the caller has already checked the TBI
+ * and TCMA bits with mte_checks_needed() and an MTE check is definitely
+ * required.
+ */
+uint64_t mte_mops_probe(CPUARMState *env, uint64_t ptr, uint64_t size,
+                        uint32_t desc);
+
+/**
+ * mte_check_fail: Record an MTE tag check failure
+ * @env: CPU env
+ * @desc: MTEDESC descriptor word
+ * @dirty_ptr: Failing dirty address
+ * @ra: TCG retaddr
+ *
+ * This may never return (if the MTE tag checks are configured to fault).
+ */
+void mte_check_fail(CPUARMState *env, uint32_t desc,
+                    uint64_t dirty_ptr, uintptr_t ra);
+
 static inline int allocation_tag_from_addr(uint64_t ptr)
 {
     return extract64(ptr, 56, 4);
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index 303bcc7fd84..1cb61cea7af 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -617,8 +617,8 @@ static void mte_async_check_fail(CPUARMState *env, uint64_t dirty_ptr,
 }
 
 /* Record a tag check failure.  */
-static void mte_check_fail(CPUARMState *env, uint32_t desc,
-                           uint64_t dirty_ptr, uintptr_t ra)
+void mte_check_fail(CPUARMState *env, uint32_t desc,
+                    uint64_t dirty_ptr, uintptr_t ra)
 {
     int mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
     ARMMMUIdx arm_mmu_idx = core_to_aa64_mmu_idx(mmu_idx);
@@ -991,3 +991,53 @@ uint64_t HELPER(mte_check_zva)(CPUARMState *env, uint32_t desc, uint64_t ptr)
  done:
     return useronly_clean_ptr(ptr);
 }
+
+uint64_t mte_mops_probe(CPUARMState *env, uint64_t ptr, uint64_t size,
+                        uint32_t desc)
+{
+    int mmu_idx, tag_count;
+    uint64_t ptr_tag, tag_first, tag_last;
+    void *mem;
+    bool w = FIELD_EX32(desc, MTEDESC, WRITE);
+    uint32_t n;
+
+    mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
+    /* True probe; this will never fault */
+    mem = allocation_tag_mem_probe(env, mmu_idx, ptr,
+                                   w ? MMU_DATA_STORE : MMU_DATA_LOAD,
+                                   size, MMU_DATA_LOAD, true, 0);
+    if (!mem) {
+        return size;
+    }
+
+    /*
+     * TODO: checkN() is not designed for checks of the size we expect
+     * for FEAT_MOPS operations, so we should implement this differently.
+     * Maybe we should do something like
+     *   if (region start and size are aligned nicely) {
+     *      do direct loads of 64 tag bits at a time;
+     *   } else {
+     *      call checkN()
+     *   }
+     */
+    /* Round the bounds to the tag granule, and compute the number of tags. */
+    ptr_tag = allocation_tag_from_addr(ptr);
+    tag_first = QEMU_ALIGN_DOWN(ptr, TAG_GRANULE);
+    tag_last = QEMU_ALIGN_DOWN(ptr + size - 1, TAG_GRANULE);
+    tag_count = ((tag_last - tag_first) / TAG_GRANULE) + 1;
+    n = checkN(mem, ptr & TAG_GRANULE, ptr_tag, tag_count);
+    if (likely(n == tag_count)) {
+        return size;
+    }
+
+    /*
+     * Failure; for the first granule, it's at @ptr. Otherwise
+     * it's at the first byte of the nth granule. Calculate how
+     * many bytes we can access without hitting that failure.
+     */
+    if (n == 0) {
+        return 0;
+    } else {
+        return n * TAG_GRANULE - (ptr - tag_first);
+    }
+}
-- 
2.34.1

