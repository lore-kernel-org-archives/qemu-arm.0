Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp460294ocs;
        Sat, 1 Oct 2022 09:27:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM72Cw1OIOElXmUX5MrzIZzdXS00wguVRnt3byxLDD3zMVEs9kpnKm1nU9MAvML8clbAWVUx
X-Received: by 2002:a37:a98c:0:b0:6cf:9ca3:b2fd with SMTP id s134-20020a37a98c000000b006cf9ca3b2fdmr9905477qke.118.1664641628479;
        Sat, 01 Oct 2022 09:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664641628; cv=none;
        d=google.com; s=arc-20160816;
        b=rYWbm1VLCy7dqZ04c53eR11NCjGUMAL7VUi6Nkbz7/lWHhRW4hg0rzELgiu2PXmc1q
         qlkprrWZEqb3EH1ljimfxtvWPqs8Anp3af5p6T1LUZMRRzN6r9iXWz1+kjX4RNzD5D6y
         ykYG6Df3LIeaRW2Kk0JAniaErb+MFwND7NdBh8ZkYac8JOWMTpVlfgA6k0cDlFhq+tcJ
         2+jWTnkNFhrnsg5Z4MLK0/mn/pzQh6HGmgsN57cDYmVr4bmdCL7HcLsu3ryuivZ51evw
         Kz42/wJQZ9Q9vEJ2cRDIZarFOmbnjfwuJTSkVImcJWBEXfmpP506IM3jZcROmOD39Jc0
         8XSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yMwwAQATpt9Zz9/JT2D65VdUDyPtcQpJeVsrKct0TfU=;
        b=yn94c+Ks/T1jI6RRk7eqwnAmItyRKD8VsA0dUwgaCdpTd78SP6J6/wMAkNK91Ovhg1
         yQjU90jBjYsKPwinXxyNMsNi0XxB8ZwXEBS+xQijrXCXrquxDkmNSBwKdEvFet6Nn8Br
         pYP12qhU1bN0x9T48zAsUYkPdBx+wdINPswI00vKc7iBxrzz/pPmMx30MSBK0/lEahWX
         lRGEhxyEJLKzyKoxpW6TXsTlfT3sWgBVBR5WGfbBvN74ELhtFL9PZ9EAbxVoSz5e+TfC
         dx9KbJkjbvzGZd92XDAZ/y7EHoGGrXCT4BMpVk9AHbnwE2fsymeFLF98IwYx3G73vKIL
         yh2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yAYBdS8X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y184-20020a3796c1000000b006ce7f85a871si2405542qkd.337.2022.10.01.09.27.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Oct 2022 09:27:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yAYBdS8X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oefKW-0004cS-1q
	for alex.bennee@linaro.org; Sat, 01 Oct 2022 12:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefH8-0006ZL-G7
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:23:38 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:33412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefH6-0006F9-Oa
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:23:38 -0400
Received: by mail-qk1-x730.google.com with SMTP id h28so4556497qka.0
 for <qemu-arm@nongnu.org>; Sat, 01 Oct 2022 09:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=yMwwAQATpt9Zz9/JT2D65VdUDyPtcQpJeVsrKct0TfU=;
 b=yAYBdS8XMhhzHwF2PrGhZuK/m6ZrpzRybrMdH8EdU53pA9Kb8G+Z5r3SGgiU/BSAKx
 bR3iUbp/L9yQMXlBv94nCuRv23r46XbdcyNImoVfcSV5w7CG2W1d/0bwY9KEjjQWZ+h6
 REm9hUOsDnzUQsyatGuUcFV9MAC9TGfg4BLo0ypUcOeq65vIKHgZmc8IBye91FT1azA/
 VNxHoY70T3RW3fAcrYlkkHUa1FtYLAjzIqoHc8QsefwiHD5XYkRCHRQAr9Z99Ne2gvEp
 r2T3aXBMItUeb6Wr0q+wjt0k9T2mb3lCVGmIx5n4UrAK8X0JNPyrSGqCeJoq9gE0HXFs
 ozGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=yMwwAQATpt9Zz9/JT2D65VdUDyPtcQpJeVsrKct0TfU=;
 b=yqXr1tsZLoGydxCAhKMqZGkCf80TFytmWrV7znuwJIR0mlPRYFvZR7dnc3blBce2br
 aAWTnSkJrrY3Cna3DX6Xdk49blbrxT7sGg7WkXkj05/LEea7SrPTsagHZ9nSrtVpfu/F
 aVZhVKOE3fMynolWvwdsfdqXJVoh4M/a8e74+kueyUp/NxnM6qctdsME2XCcWWXgkR0k
 FyjIRoFlUPQFo/pqfBOLtr7c0T18Qs0n6wpSYgmq20aVjoNCTh5Emb/z2gqFNjqdyqz/
 z4qdh6l9l2cOJFUBOwhJANQ01DsbW6MbKaQN0KA0kJkpZPoRgxYnL/X9lu1HUHJiMjeG
 Qxog==
X-Gm-Message-State: ACrzQf0eodPa3DbTn7xjh12Gts4OA8nxOqftTa0Lb/SZv163qkuLVMgC
 D1p2No14TdTMlzIbMKH0x0iwgg==
X-Received: by 2002:a05:620a:4515:b0:6ce:7335:4e77 with SMTP id
 t21-20020a05620a451500b006ce73354e77mr9886130qkp.507.1664641415130; 
 Sat, 01 Oct 2022 09:23:35 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:23:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 05/42] target/arm: Split out get_phys_addr_with_secure
Date: Sat,  1 Oct 2022 09:22:41 -0700
Message-Id: <20221001162318.153420-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x730.google.com
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
X-TUID: YFItf29JugrQ

Retain the existing get_phys_addr interface using the security
state derived from mmu_idx.  Move the kerneldoc comments to the
header file where they belong.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Move the kerneldoc to internals.h
---
 target/arm/internals.h | 40 ++++++++++++++++++++++++++++++++++++++
 target/arm/ptw.c       | 44 ++++++++++++++----------------------------
 2 files changed, 55 insertions(+), 29 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 307a596505..3524d11dc5 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1145,6 +1145,46 @@ typedef struct GetPhysAddrResult {
     ARMCacheAttrs cacheattrs;
 } GetPhysAddrResult;
 
+/**
+ * get_phys_addr_with_secure: get the physical address for a virtual address
+ * @env: CPUARMState
+ * @address: virtual address to get physical address for
+ * @access_type: 0 for read, 1 for write, 2 for execute
+ * @mmu_idx: MMU index indicating required translation regime
+ * @is_secure: security state for the access
+ * @result: set on translation success.
+ * @fi: set to fault info if the translation fails
+ *
+ * Find the physical address corresponding to the given virtual address,
+ * by doing a translation table walk on MMU based systems or using the
+ * MPU state on MPU based systems.
+ *
+ * Returns false if the translation was successful. Otherwise, phys_ptr, attrs,
+ * prot and page_size may not be filled in, and the populated fsr value provides
+ * information on why the translation aborted, in the format of a
+ * DFSR/IFSR fault register, with the following caveats:
+ *  * we honour the short vs long DFSR format differences.
+ *  * the WnR bit is never set (the caller must do this).
+ *  * for PSMAv5 based systems we don't bother to return a full FSR format
+ *    value.
+ */
+bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
+                               MMUAccessType access_type,
+                               ARMMMUIdx mmu_idx, bool is_secure,
+                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+    __attribute__((nonnull));
+
+/**
+ * get_phys_addr: get the physical address for a virtual address
+ * @env: CPUARMState
+ * @address: virtual address to get physical address for
+ * @access_type: 0 for read, 1 for write, 2 for execute
+ * @mmu_idx: MMU index indicating required translation regime
+ * @result: set on translation success.
+ * @fi: set to fault info if the translation fails
+ *
+ * Similarly, but use the security regime of @mmu_idx.
+ */
 bool get_phys_addr(CPUARMState *env, target_ulong address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index f9b7c316d0..542111f99e 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2260,35 +2260,12 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
     return ret;
 }
 
-/**
- * get_phys_addr - get the physical address for this virtual address
- *
- * Find the physical address corresponding to the given virtual address,
- * by doing a translation table walk on MMU based systems or using the
- * MPU state on MPU based systems.
- *
- * Returns false if the translation was successful. Otherwise, phys_ptr, attrs,
- * prot and page_size may not be filled in, and the populated fsr value provides
- * information on why the translation aborted, in the format of a
- * DFSR/IFSR fault register, with the following caveats:
- *  * we honour the short vs long DFSR format differences.
- *  * the WnR bit is never set (the caller must do this).
- *  * for PSMAv5 based systems we don't bother to return a full FSR format
- *    value.
- *
- * @env: CPUARMState
- * @address: virtual address to get physical address for
- * @access_type: 0 for read, 1 for write, 2 for execute
- * @mmu_idx: MMU index indicating required translation regime
- * @result: set on translation success.
- * @fi: set to fault info if the translation fails
- */
-bool get_phys_addr(CPUARMState *env, target_ulong address,
-                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
+                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                               bool is_secure, GetPhysAddrResult *result,
+                               ARMMMUFaultInfo *fi)
 {
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
-    bool is_secure = regime_is_secure(env, mmu_idx);
 
     if (mmu_idx != s1_mmu_idx) {
         /*
@@ -2304,8 +2281,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             ARMMMUIdx s2_mmu_idx;
             bool is_el0;
 
-            ret = get_phys_addr(env, address, access_type, s1_mmu_idx,
-                                result, fi);
+            ret = get_phys_addr_with_secure(env, address, access_type,
+                                            s1_mmu_idx, is_secure, result, fi);
 
             /* If S1 fails or S2 is disabled, return early.  */
             if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2,
@@ -2518,6 +2495,15 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     }
 }
 
+bool get_phys_addr(CPUARMState *env, target_ulong address,
+                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+{
+    return get_phys_addr_with_secure(env, address, access_type, mmu_idx,
+                                     regime_is_secure(env, mmu_idx),
+                                     result, fi);
+}
+
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
                                          MemTxAttrs *attrs)
 {
-- 
2.34.1

