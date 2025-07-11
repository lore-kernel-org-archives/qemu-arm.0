Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C494DC83F1B
	for <qemu-arm@archiver.kernel.org>; Fri, 11 Jul 2025 22:52:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uaMb1-0000uC-Ik; Fri, 11 Jul 2025 18:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uaMYZ-0007P1-2n
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 18:49:39 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uaMYU-0008O2-La
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 18:49:25 -0400
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-40ad1f7c23bso1491089b6e.2
 for <qemu-arm@nongnu.org>; Fri, 11 Jul 2025 15:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752274161; x=1752878961; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ytRuA3L88Bv4lWdDsxQUFk0uzi+wgTB6xmr4FnWYbaQ=;
 b=YTV3DpI0FJcl6J1dYtdji5Ln842hZTBxgI3Mc9k4euSCYbfEUqLJXIixgR4MluABfc
 07X3NTs0J+9w1MaozLlopsBy5paoUUEoK5CUtO0ddoC0KBNpzCfhRSrb1hQuG4xSwaex
 wZgP+o29iPefHPBchquuNuluVpyciCD4qdDqDgGDU54tpofjNtNXb9WrHMAqQkqKPAVV
 BibhcmeCr26zt5W+olTma1mOwiYXpsV8wFreWM3IxC0jPZzWZt4MKYaWvpGh5CRiTgO9
 5RBE+AEw2++3xMNKaXnq5cq2+9fsjZoGIen4gLkJFsRF9WTN7Ejn9a4Se3rlmdDGZiOO
 LH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752274161; x=1752878961;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ytRuA3L88Bv4lWdDsxQUFk0uzi+wgTB6xmr4FnWYbaQ=;
 b=v/+U0Qe9ZHj6txTxm2QXK4GLlZGpgkjlFMzFTtfKNRP3UccXI0Z/Cka8iev0qltF9x
 TZzB+IE7FOGSNnVGJ3A8omlY6FTdAsq/J3H7T4xqLSfQSbY4Uh/uS+NUNKvmAvIUvnht
 cl4ymqX9TgJJmF7vzK8nEda68je/1HDZekCCqLRdVHJvAno1xxmjrZdqisayPN5cAxQ1
 hM41rvgtnA4DuW9EqMWbHek5DbYnIrEdLKSke3oXdpMALjoNjOsxoeWQOgBq20CEPoNq
 dsgAPtn8daXn+w9hwbxixCzpAqmQpFJnDzhwA4wZB00Sfc6b1PFmO8+Dp1HAuuHbOMAO
 U90g==
X-Gm-Message-State: AOJu0YwHfN+HFwcEyAYmmmOber9BrJ/bFm/PzxBHj8oH0nnahgxQDAr7
 lH5d1oIY/KOr0MQFONXy4/+w/9Sa9aM3B1C4C4ShRFpM4KrM9ZLnECgp5Y+t1rZIDODaXOHlBLK
 37i66AFo=
X-Gm-Gg: ASbGncurG+SxcC/WK/Wxshj8bUYhg+ncGgb2FXzdDIuwZ09hznv7ogsVD40JtuWWXHM
 w1zmMui+URyigomx+AxNMWPbYLkcRoz+pXvMXM84j3vZ4EgrWRbySguo1jd9hBinVPxy4eajMlW
 QpaO9IG4hcxQSO3Y30N5o/8qeDC31c+90crFgFSwSmrXDTb0c0vlTOgMXw/kQ9btR08JiXDh4nD
 9FwJ6FCvVWTsuz4N5OPNnLnrpGteOdhqh54on0XwCgP5WjiZC4/pSwX+kYu1GZZYO348hDHcSn1
 7mHd0ZgyJ3wkR0RjTxPeIC8PFFIhVQmjpa1x6Cw7NBmCBRW8dpsXITlfbd7VZo3+a6v/M98vr5E
 Jmzf63M99/DwM29O7LkZmqRATy4Z0tYc0bU8ASaqx4Gp270xD3g0fOE2eB7E92v8NEVVukPrb1R
 2aCljV8WnJ
X-Google-Smtp-Source: AGHT+IHEkOP+Q3xABq3vffoBrw7LoV5057c6d47P6hfcTRllA0GS8rOPvY6a0zehbRmrlDRCJGrzUA==
X-Received: by 2002:a05:6808:690c:b0:40b:711:377d with SMTP id
 5614622812f47-415393d60b3mr3329472b6e.18.1752274160863; 
 Fri, 11 Jul 2025 15:49:20 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-414197c6064sm696638b6e.20.2025.07.11.15.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 15:49:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 2/9] target/arm: Add in_prot_check to S1Translate
Date: Fri, 11 Jul 2025 16:49:08 -0600
Message-ID: <20250711224915.62369-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250711224915.62369-1-richard.henderson@linaro.org>
References: <20250711224915.62369-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
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

Separate the access_type from the protection check.
Save the trouble of modifying all helper functions
by passing the new data in the control structure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index a914e7e23c..1b90e33f52 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -64,6 +64,12 @@ typedef struct S1Translate {
      * Stage 2 is indicated by in_mmu_idx set to ARMMMUIdx_Stage2{,_S}.
      */
     bool in_s1_is_el0;
+    /*
+     * The set of PAGE_* bits to be use in the permission check.
+     * This is normally directly related to the access_type, but
+     * may be suppressed for debug or AT insns.
+     */
+    uint8_t in_prot_check;
     bool out_rw;
     bool out_be;
     ARMSecuritySpace out_space;
@@ -581,6 +587,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
             .in_ptw_idx = ptw_idx_for_stage_2(env, s2_mmu_idx),
             .in_space = s2_space,
             .in_debug = true,
+            .in_prot_check = PAGE_READ,
         };
         GetPhysAddrResult s2 = { };
 
@@ -1089,7 +1096,7 @@ static bool get_phys_addr_v5(CPUARMState *env, S1Translate *ptw,
     }
     result->f.prot = ap_to_rw_prot(env, ptw->in_mmu_idx, ap, domain_prot);
     result->f.prot |= result->f.prot ? PAGE_EXEC : 0;
-    if (!(result->f.prot & (1 << access_type))) {
+    if (ptw->in_prot_check & ~result->f.prot) {
         /* Access permission fault.  */
         fi->type = ARMFault_Permission;
         goto do_fault;
@@ -1243,7 +1250,7 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
 
         result->f.prot = get_S1prot(env, mmu_idx, false, user_rw, prot_rw,
                                     xn, pxn, result->f.attrs.space, out_space);
-        if (!(result->f.prot & (1 << access_type))) {
+        if (ptw->in_prot_check & ~result->f.prot) {
             /* Access permission fault.  */
             fi->type = ARMFault_Permission;
             goto do_fault;
@@ -2123,7 +2130,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         result->f.tlb_fill_flags = 0;
     }
 
-    if (!(result->f.prot & (1 << access_type))) {
+    if (ptw->in_prot_check & ~result->f.prot) {
         fi->type = ARMFault_Permission;
         goto do_fault;
     }
@@ -2537,7 +2544,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env,
 
     fi->type = ARMFault_Permission;
     fi->level = 1;
-    return !(result->f.prot & (1 << access_type));
+    return (ptw->in_prot_check & ~result->f.prot) != 0;
 }
 
 static uint32_t *regime_rbar(CPUARMState *env, ARMMMUIdx mmu_idx,
@@ -2953,7 +2960,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env,
         }
     }
 
-    ret = pmsav8_mpu_lookup(env, address, access_type, 1 << access_type,
+    ret = pmsav8_mpu_lookup(env, address, access_type, ptw->in_prot_check,
                             mmu_idx, secure, result, fi, NULL);
     if (sattrs.subpage) {
         result->f.lg_page_size = 0;
@@ -3625,6 +3632,7 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
     S1Translate ptw = {
         .in_mmu_idx = mmu_idx,
         .in_space = arm_mmu_idx_to_security_space(env, mmu_idx),
+        .in_prot_check = 1 << access_type,
     };
 
     return get_phys_addr_gpc(env, &ptw, address, access_type,
@@ -3638,6 +3646,7 @@ static hwaddr arm_cpu_get_phys_page(CPUARMState *env, vaddr addr,
         .in_mmu_idx = mmu_idx,
         .in_space = arm_mmu_idx_to_security_space(env, mmu_idx),
         .in_debug = true,
+        .in_prot_check = PAGE_READ,
     };
     GetPhysAddrResult res = {};
     ARMMMUFaultInfo fi = {};
-- 
2.43.0


