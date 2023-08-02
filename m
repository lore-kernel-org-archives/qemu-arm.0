Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp502803ejb;
        Wed, 2 Aug 2023 10:04:05 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHD8/gUxh0WOlnuCp+SrzXXNq9QIykq7LTI/gXKPnhi4GY40g/i6IiZd6iKGfZAWOwRrKPX
X-Received: by 2002:a05:620a:4153:b0:768:142b:4fc8 with SMTP id k19-20020a05620a415300b00768142b4fc8mr18033545qko.72.1690995845414;
        Wed, 02 Aug 2023 10:04:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690995845; cv=none;
        d=google.com; s=arc-20160816;
        b=g2+Fdc45vREBlKZrHQVf8Gkg96VNiAqLxIgr5AAuIaAn5UextUeza8FpE382ifb2Iq
         CVbjS4ksWYRS8iEdYjxiggE5Optx6cRREE5tonRlb8vrH02cA8N+r4/mNpQfR6anaXkN
         KYdRHX5fjD7BDOXLjeBHioLgmX/4NvFctY8Ux2OQxqh3t5QJM9rM+4Uo4PpOP4Hrs7fL
         OM+oMlJpAZPQsxLcJxIAvZral1lgRnNwqBWRCKD+kMgyJmwIRptKz46y2uPvEQsT9VJJ
         8kKViL43mMuyvhbF3MPAAVJZiBb4V+C3J0HWEjqRkYYVax86AX5WC9l1N33HcFtoyite
         g3ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FhowOvdNoqNAM56f9usHlhnKbRslUqskM9I47IE0+fw=;
        fh=zMLmPP9ozJY0jj0bAXqZquWHP0BgmjJZ9lKiHhJNaWU=;
        b=t2bDjDvt+pVp3+qMnjWguvfWLCkldwhg4V4ldIv+okzl5P5t/JOyJy0DE9mLuBrbvf
         jaZWjAPcmVohnQ2T9xLKlwI3iUhCvDOvh7FW9GpJwDRPeo6X6IpJeeDJNLQ3X+7jjO6e
         aX7o3l8gQwT/E8x+FSpltumxdiP+DITP3DOeVfQfmWa0SWBOyv5Hk8behEBkGHCs0JYb
         3yre8UM5q7l0N9crIbvaaRH0Ypb+pYj4r42Pr0XOGagBYa8I6CLLKM2jsI7eUSionSbt
         whf3W6+wtDerytdJHjZpCPq+2ohIXocGQNk5EbRR9WBqPC/gPDtxoLPGuZg2iaFt+Lv0
         nUDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A6XrYYdJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm14-20020a05620a198e00b0076cb682f501si4074892qkb.777.2023.08.02.10.04.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Aug 2023 10:04:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A6XrYYdJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRFEi-0000QL-Na; Wed, 02 Aug 2023 13:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qRFEg-0000NV-9l
 for qemu-arm@nongnu.org; Wed, 02 Aug 2023 13:02:10 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qRFEd-0003UL-7u
 for qemu-arm@nongnu.org; Wed, 02 Aug 2023 13:02:10 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8ceso883745e9.0
 for <qemu-arm@nongnu.org>; Wed, 02 Aug 2023 10:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690995726; x=1691600526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FhowOvdNoqNAM56f9usHlhnKbRslUqskM9I47IE0+fw=;
 b=A6XrYYdJT40kyFInDwTzGIKYMSz2sne5NlGiuiRTu28xebGBL2X8BOAfV/LzZX+Utx
 uOOA+S/c6k85f6p26yaWjkKtlzHs1/Nk7AnZvR+bCiKpAeV4mFzZVkQzuQ3OuGp237uZ
 JQWnF5IjRbtsRIrFCiUAf/PjIonpiKJ2L+dfzsGDBn+kTSQHH3sbjzNzPJ/MMcTBNksL
 lfA7rO4bmQG6Hp8d5IC67IFgMWWlk+/zrVL15zglx4y0jeneTyj64qLLaUGt2k4o+vQ/
 r3XSIYYp0YiVkzwlMZR67ImlRQSVNRvPm8gmKMKWUrd97dDSlwX+0xag2FQQFHZPrzuR
 pnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690995726; x=1691600526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FhowOvdNoqNAM56f9usHlhnKbRslUqskM9I47IE0+fw=;
 b=Fnqvsnib04r7ykIDN8acYHIP/5OAa2VwiEPTIH5ycspmLCF/+cH96PpwuILTrbLfjP
 MKLmpAeq0grNEakn+NvAb51dZlyoTr1IPEZyd4cTJJVLV0zvkH0BQzEdy6o2hHiC+JOb
 4zXeeoX8ZtrgqMOjtbSAKQjQOiMjzwSmtbl0yUDr70jNgh2Wg9uoSvZH75HLhUUoWYon
 Rwbix0aA0QYhG3cL67tk+dsCJPd2l++nf1t3NytM8kna3SHCYQI8RLmeP2spFb0Wl9uC
 SKPidy1Z4BH3t7AAjUDjj0odQ210le/PAz/tBvUsHjwdnvEvyfzPL+2arwVMNTW8Q1Xj
 tJiA==
X-Gm-Message-State: ABy/qLbDwrUjEI5iw44a5kNUXIHXUJDjcxfFz56ZHSvGLsEHjAz5IK+o
 z9SmQnDRqBBaeNeFfwtW1p+1KA==
X-Received: by 2002:a7b:cbc7:0:b0:3fb:abd0:2b52 with SMTP id
 n7-20020a7bcbc7000000b003fbabd02b52mr5200864wmi.13.1690995725911; 
 Wed, 02 Aug 2023 10:02:05 -0700 (PDT)
Received: from localhost.localdomain ([2.219.138.198])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a1cf307000000b003fa98908014sm2149081wmq.8.2023.08.02.10.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 10:02:05 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 3/6] target/arm: Skip granule protection checks for AT
 instructions
Date: Wed,  2 Aug 2023 18:01:54 +0100
Message-ID: <20230802170157.401491-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802170157.401491-1-jean-philippe@linaro.org>
References: <20230802170157.401491-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kH//ohZLFslp

GPC checks are not performed on the output address for AT instructions,
as stated by ARM DDI 0487J in D8.12.2:

  When populating PAR_EL1 with the result of an address translation
  instruction, granule protection checks are not performed on the final
  output address of a successful translation.

Rename get_phys_addr_with_secure(), since it's only used to handle AT
instructions.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 25 ++++++++++++++-----------
 target/arm/helper.c    |  8 ++++++--
 target/arm/ptw.c       | 11 ++++++-----
 3 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 0f01bc32a8..fc90c364f7 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1190,12 +1190,11 @@ typedef struct GetPhysAddrResult {
 } GetPhysAddrResult;
 
 /**
- * get_phys_addr_with_secure: get the physical address for a virtual address
+ * get_phys_addr: get the physical address for a virtual address
  * @env: CPUARMState
  * @address: virtual address to get physical address for
  * @access_type: 0 for read, 1 for write, 2 for execute
  * @mmu_idx: MMU index indicating required translation regime
- * @is_secure: security state for the access
  * @result: set on translation success.
  * @fi: set to fault info if the translation fails
  *
@@ -1212,26 +1211,30 @@ typedef struct GetPhysAddrResult {
  *  * for PSMAv5 based systems we don't bother to return a full FSR format
  *    value.
  */
-bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
-                               MMUAccessType access_type,
-                               ARMMMUIdx mmu_idx, bool is_secure,
-                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+bool get_phys_addr(CPUARMState *env, target_ulong address,
+                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
 /**
- * get_phys_addr: get the physical address for a virtual address
+ * get_phys_addr_with_secure_nogpc: get the physical address for a virtual
+ *                                  address
  * @env: CPUARMState
  * @address: virtual address to get physical address for
  * @access_type: 0 for read, 1 for write, 2 for execute
  * @mmu_idx: MMU index indicating required translation regime
+ * @is_secure: security state for the access
  * @result: set on translation success.
  * @fi: set to fault info if the translation fails
  *
- * Similarly, but use the security regime of @mmu_idx.
+ * Similar to get_phys_addr, but use the given security regime and don't perform
+ * a Granule Protection Check on the resulting address.
  */
-bool get_phys_addr(CPUARMState *env, target_ulong address,
-                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+bool get_phys_addr_with_secure_nogpc(CPUARMState *env, target_ulong address,
+                                     MMUAccessType access_type,
+                                     ARMMMUIdx mmu_idx, bool is_secure,
+                                     GetPhysAddrResult *result,
+                                     ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index a4c2c1bde5..427de6bd2a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3365,8 +3365,12 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
     ARMMMUFaultInfo fi = {};
     GetPhysAddrResult res = {};
 
-    ret = get_phys_addr_with_secure(env, value, access_type, mmu_idx,
-                                    is_secure, &res, &fi);
+    /*
+     * I_MXTJT: Granule protection checks are not performed on the final address
+     * of a successful translation.
+     */
+    ret = get_phys_addr_with_secure_nogpc(env, value, access_type, mmu_idx,
+                                          is_secure, &res, &fi);
 
     /*
      * ATS operations only do S1 or S1+S2 translations, so we never
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 063adbd84a..33179f3471 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3418,16 +3418,17 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
     return false;
 }
 
-bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
-                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool is_secure, GetPhysAddrResult *result,
-                               ARMMMUFaultInfo *fi)
+bool get_phys_addr_with_secure_nogpc(CPUARMState *env, target_ulong address,
+                                     MMUAccessType access_type,
+                                     ARMMMUIdx mmu_idx, bool is_secure,
+                                     GetPhysAddrResult *result,
+                                     ARMMMUFaultInfo *fi)
 {
     S1Translate ptw = {
         .in_mmu_idx = mmu_idx,
         .in_space = arm_secure_to_space(is_secure),
     };
-    return get_phys_addr_gpc(env, &ptw, address, access_type, result, fi);
+    return get_phys_addr_nogpc(env, &ptw, address, access_type, result, fi);
 }
 
 bool get_phys_addr(CPUARMState *env, target_ulong address,
-- 
2.41.0

