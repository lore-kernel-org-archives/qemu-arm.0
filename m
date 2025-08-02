Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF2FC87FD2
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:31:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLgb-0006lx-Oi; Sat, 02 Aug 2025 19:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLgV-0006bn-3l
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:30:41 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLgR-0004sR-LV
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:30:38 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-2ffa1b10918so1987919fac.2
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177434; x=1754782234; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZozRqgl1Uc77xaTQQdsLXzgeEe/cos7TSzVU6j/Q3E0=;
 b=MnF4eWivLVIVToT9o7g0bqlw+2eoIwPoJzneJ9g5BQqG7815iOrXm1aR6VIt6tupa7
 1CL8JPkFSOYPJcg4RAn3olQnx7Nvtyy7zk5ZdBHkFp2dhtVwMTQa35z28meqAcuKyydp
 7UANjrfj4OeKmvVN14Vi51DhvvIKzMWeDN6mwM2tSrBESKvIP1XeIrBWcxFODoiZO2bW
 LBUx3o1mdnmvKLtoBCoKRw2WLYeA3AYvMBahbOIWZgJ5xDzqpFUnDrOIfw7+bMR7rYv3
 xYFBZApAxd441qWDKCGgHgL4jkx7mrHAer34JNY1P5ZLg53alLRzw7iTrOn0IysnE+tj
 fC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177434; x=1754782234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZozRqgl1Uc77xaTQQdsLXzgeEe/cos7TSzVU6j/Q3E0=;
 b=o5ZlThyNAK00isY2RF7gldlmrVS8BSL8YDiS6wLA7DLB13k4SF86B0UG/OKyvwvHyu
 2jGHvtuIWxie46pxUbhtBSoKeewpeetS1QtgglWBgQggbst/nkYYL2TQ/smK9fc+cVBn
 Tqm6hJ7dC1nalDklsj2qsizcN+ifhpzocXahTbqns56N/bl2Zog7yWawQw+qpPCvZDp8
 y4GwZO8vfCJqZVzQwPdvW7yJ5dHdl0oFwXlnL355NCIgre+ig3SyDw8Jbl3Sl34uaYgC
 egEhXujraoyLxYBUGS4QfV9fVQS9dNHkLnzLTIedMfyCwRSHcmy2ymDu3Kc7d4Hd/bW+
 t7wQ==
X-Gm-Message-State: AOJu0YzU205BZXj8TYC+C/i+6yJws7XAQ8qcaL4vNAciJkhGg8NG/8Ju
 2W/izomxqkM9+EgB7GnV4kyyEw1fRxnismf7yRlxJiBgVCLxBQEkLT0sMhaf8ssPMEo=
X-Gm-Gg: ASbGncu/c8EA207wwvQdcWyWLwcGbepWG1v1FH2Xt0gKvpU7tmDMZ22PQFtu1aNIV+e
 lmx7/aS91G1RqFX+d+kVIaiiR06CxjY5/FjYOEuqO/ilFF1ktOQcMCzKgmFzOeCgKC/sgcczeoN
 exK9vr+SzAn5CtoUrrMYhhPZuH9Qs39i8KQpeJ6P1vEDvF1aYdPfrjRl/ORjkWlgiVZYdLuMFPT
 iN9fOnEPSPZJ5xroUzqGAO6xzldy3rCQxNMp0gIVBmObYdEBWNPw1zkOLoUOWkJPjznHKAnqFjU
 hXvGYswmFvdWhrwY2qaLr357hqF7Px+zURD8p55GOTiApvWUlbUF/axAYnHlxnlsi36i73eVKqp
 PKRUizHztvoHyjoqll/YlXNAtD0IEQExB0A2yudLHuCntvH29kSDq
X-Google-Smtp-Source: AGHT+IEsQa8N32uLyrMc9FcxUdKAzuVT8RsbyY1uReLRsbWqGHoq9wzHwuoYx51Dxk69pQwRCbCCJQ==
X-Received: by 2002:a05:6870:3328:b0:2d5:296d:4ed4 with SMTP id
 586e51a60fabf-30b67a106admr2713043fac.28.1754177434118; 
 Sat, 02 Aug 2025 16:30:34 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-30b8e3c9b32sm71031fac.24.2025.08.02.16.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:30:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 07/85] target/arm: Introduce get_phys_addr_for_at
Date: Sun,  3 Aug 2025 09:28:35 +1000
Message-ID: <20250802232953.413294-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2a.google.com
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
index 326b5a73cf..0dd1b214c8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1604,25 +1604,21 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
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
index c7db93b95c..1866c494ef 100644
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


