Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE92CA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 15:56:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNvo-00076m-Ud; Sat, 30 Aug 2025 11:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usELd-0005qv-H7
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:41:58 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usELb-00045O-TO
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:41:57 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-7720f23123dso2702348b3a.2
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532514; x=1757137314; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZIUi24UCtA+WCzxRmM2e3Q9u+Kr20hlCK3lal507EEI=;
 b=wx5WYltEomoEScrDLFeAXZD5WabZqwXvocGd/Tm/MpNdgj4Q9xlduw+nNnyEXYb2Wc
 WSaJejnkme/BKTB/d5sUQ7RjtluYtjxnnZShOxbC1u5HDRScphddcD3/tcZ/2D7xnzcY
 fK6bBVAnU6QhIGO7TP/wzPiq79L8q5F00J0rFrIVU0/9+s3dEIXLH1WFCtTL7c5ArI64
 +KM79S3XuERg8za32lzSTcraBCE4JrdqkKlwybW/gb/tzw5VksdHaTfZUhamY4FwLJy7
 xe/h1eAwwEXA/raxpklWuT61rygoSzG/umuT01yTBFn8kDd1OGrr6SYVHvhty+Mx2vTo
 a28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532514; x=1757137314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZIUi24UCtA+WCzxRmM2e3Q9u+Kr20hlCK3lal507EEI=;
 b=JBYLAgQgI5/NCDNaY05DQGt883RZOM6dlKDj5OX9hxsiF+On9+iEIZOUe/dboVK0Mu
 MUMUHMOT0E1ZAj3Bm1k2uytx3hxJmZI9O+7c3iugUR2U0hbYNbfceS/uB3pPFYE4BXht
 lZ8/jnfwpvRMW22l/44uqD8Yugw85WRo4Y5MkLIqqSdGzdJRA5u0IuK96foIUBRbVEkU
 gQZFHdbRginVy/DsbBZ47r3vuKys9ggR/1k4FMvtpK02TrD3pFjMxipGjKeNLBgluj1E
 vQnWqYK8gJQgQmfd6Mpad6NIebOIif6Atu3nLR2vXdNjJYkEAj8Pj4D2P0Q7O6d89Ddg
 P4rg==
X-Gm-Message-State: AOJu0YxNsiqvuzomo0+1dBE/RBFVojU2xHyGLMrpILhulXXZfxwNPjxE
 X9g/nFoK1MBDexwmj5pj7OVi9V+3eIgP2mJNGQqLKmYfJoTckTOGcSHZPgBC4bamYEk=
X-Gm-Gg: ASbGncvXSsrTec35hh/2wQSUE1r9isTiEfwyO5Wnn8IcXycf7Vf6jRD3wKdO/NHIbZM
 5qP+OpIWufCbfCvZO4Q5fe6sMjSShAHbN+T3ferO0rcUU4EvlhdPuPYOsfZw/hF0b+BprErGyOw
 wPtbaoOOAWHxkyQlaoXlj/Wv2h6as5oB63ay5i0GF+67ghdXJcQYab/IQ8buQ0reQj3ckBsdOZy
 R6yaz366uz6k9Y3EKARjNh330j3FDm0+01fWb2NVgAgLxW0UleghTmh+VVmbmEIjONPijiZWIcN
 LDny4y1REGfYHnO77sB9NWW6L4bHXp1KGZ5a5M2s5CkPg11SjMXOb/RjqJK0w3fLu2NwNHXXizw
 BMLpKWEv8qgv9WqWHHx6z2KchloK7XLc0OWSjyG8PjywKW+Z965DtdQ6sS+mz3QAx/cJ0YaI=
X-Google-Smtp-Source: AGHT+IGmX6P3MRUNZaf529VQMzmLxg+zkTp+rqzPRreBm7ms8M7liNkMdVMIuyWnSiGf5kdPDMGLlg==
X-Received: by 2002:a05:6a20:3ca8:b0:243:78a:829e with SMTP id
 adf61e73a8af0-243d6f7e7fbmr1474092637.55.1756532514028; 
 Fri, 29 Aug 2025 22:41:54 -0700 (PDT)
Received: from stoup.. (122-150-204-48.dyn.ip.vocus.au. [122.150.204.48])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4d96829a66sm2435905a12.6.2025.08.29.22.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:41:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 07/84] target/arm: Introduce get_phys_addr_for_at
Date: Sat, 30 Aug 2025 15:40:11 +1000
Message-ID: <20250830054128.448363-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Rename get_phys_addr_with_space_nogpc for its only
caller, do_ats_write.  Drop the MemOp memop argument
as it doesn't make sense in the new context.  Replace
the access_type parameter with prot_check.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h     | 18 +++++++-----------
 target/arm/ptw.c           | 21 ++++++++++++++-------
 target/arm/tcg/cpregs-at.c | 11 ++---------
 3 files changed, 23 insertions(+), 27 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 899242e572..8782594b77 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1602,25 +1602,21 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
     __attribute__((nonnull));
 
 /**
- * get_phys_addr_with_space_nogpc: get the physical address for a virtual
- *                                 address
+ * get_phys_addr_for_at:
  * @env: CPUARMState
  * @address: virtual address to get physical address for
- * @access_type: 0 for read, 1 for write, 2 for execute
- * @memop: memory operation feeding this access, or 0 for none
+ * @prot_check: PAGE_{READ,WRITE,EXEC}, or 0
  * @mmu_idx: MMU index indicating required translation regime
  * @space: security space for the access
  * @result: set on translation success.
  * @fi: set to fault info if the translation fails
  *
- * Similar to get_phys_addr, but use the given security space and don't perform
- * a Granule Protection Check on the resulting address.
+ * Similar to get_phys_addr, but for use by AccessType_AT, i.e.
+ * system instructions for address translation.
  */
-bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
-                                    MMUAccessType access_type, MemOp memop,
-                                    ARMMMUIdx mmu_idx, ARMSecuritySpace space,
-                                    GetPhysAddrResult *result,
-                                    ARMMMUFaultInfo *fi)
+bool get_phys_addr_for_at(CPUARMState *env, vaddr address, unsigned prot_check,
+                          ARMMMUIdx mmu_idx, ARMSecuritySpace space,
+                          GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 5d85610de2..8925c9a610 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3545,18 +3545,25 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
     return false;
 }
 
-bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
-                                    MMUAccessType access_type, MemOp memop,
-                                    ARMMMUIdx mmu_idx, ARMSecuritySpace space,
-                                    GetPhysAddrResult *result,
-                                    ARMMMUFaultInfo *fi)
+bool get_phys_addr_for_at(CPUARMState *env, vaddr address,
+                          unsigned prot_check, ARMMMUIdx mmu_idx,
+                          ARMSecuritySpace space, GetPhysAddrResult *result,
+                          ARMMMUFaultInfo *fi)
 {
     S1Translate ptw = {
         .in_mmu_idx = mmu_idx,
         .in_space = space,
+        .in_prot_check = prot_check,
     };
-    return get_phys_addr_nogpc(env, &ptw, address, access_type,
-                               memop, result, fi);
+    /*
+     * I_MXTJT: Granule protection checks are not performed on the final
+     * address of a successful translation.  This is a translation not a
+     * memory reference, so MMU_DATA_LOAD is arbitrary (the exact protection
+     * check is handled or bypassed by .in_prot_check) and "memop = MO_8"
+     * bypasses any alignment check.
+     */
+    return get_phys_addr_nogpc(env, &ptw, address,
+                               MMU_DATA_LOAD, MO_8, result, fi);
 }
 
 static ARMSecuritySpace
diff --git a/target/arm/tcg/cpregs-at.c b/target/arm/tcg/cpregs-at.c
index 398a61d398..2ff0b3e76f 100644
--- a/target/arm/tcg/cpregs-at.c
+++ b/target/arm/tcg/cpregs-at.c
@@ -27,19 +27,12 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
                              ARMSecuritySpace ss)
 {
-    bool ret;
     uint64_t par64;
     bool format64 = false;
     ARMMMUFaultInfo fi = {};
     GetPhysAddrResult res = {};
-
-    /*
-     * I_MXTJT: Granule protection checks are not performed on the final
-     * address of a successful translation.  This is a translation not a
-     * memory reference, so "memop = none = 0".
-     */
-    ret = get_phys_addr_with_space_nogpc(env, value, access_type, 0,
-                                         mmu_idx, ss, &res, &fi);
+    bool ret = get_phys_addr_for_at(env, value, 1 << access_type,
+                                    mmu_idx, ss, &res, &fi);
 
     /*
      * ATS operations only do S1 or S1+S2 translations, so we never
-- 
2.43.0


