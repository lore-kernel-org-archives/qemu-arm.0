Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE61DCA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 15:56:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNv4-0003Tv-1o; Sat, 30 Aug 2025 11:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usELY-0005px-Fp
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:41:54 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usELW-00043t-Os
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:41:52 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-325393d0ddaso2254251a91.3
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532509; x=1757137309; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3X6dK/y2a1gIrJDtkDZkfEpwUr8G+BbPPw6R4etjaMU=;
 b=fAv0r+vPKk17wMFg6zA9utWEFsriC8wEQcVIbU2ggOzOmL/2rf2hi26kzv0JLKXC0U
 SogcSDTUjPmAXQ8fDEYtXIEcmYujJCe/UhdedkerXw8HVWXymLkiDpU8tMizMBiiAs7G
 kSL7E/2jzvwpfYgxsrS6o86grbSp34Bt/PPmJN9APON2lvSFFJK3t+I+EeukI++JAYkt
 5Kd8+ps2mz7iSAv9uxmRQsbibnpggbpsjiMQEEJMkWNaJWXqD3h7BbuzBDPQl0VBsG+D
 4pti1VpSQhLPnlixM5rvKz5sb0Dzz8cxkzNBF9L7ASoPVZta173yZi4+5QXh8FtANhKk
 y8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532509; x=1757137309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3X6dK/y2a1gIrJDtkDZkfEpwUr8G+BbPPw6R4etjaMU=;
 b=OBqqlIf/sBO47heOcKmW+TE8/Dz9ArLWA4pG07JT9LwXk6fJOVK91HmKZknh+ZgdNi
 GubZqY1GzURT82pLpWzS5MTZSLuOXy9mon1SJyOdPTvvBfTYjmVr/PcL08xlfHJbdZkJ
 /TsPV/QsaEmHNtkFClntDvYD7ugblATq1qhyXbze86QWDS6vEcu7VwZjxxnhg6tmR1BF
 oU+l0Q1GYzc0xS5CRiyM+uJW1T6BlFK0RTp9aw9luieIGpaX8GmWJ3aoy3fGSgI3gh6Q
 NFr6fAjXR4XJioXV9fr3TxI4OEuGGuUK89Vgm1lwV7uzOQK4GW8adFRi8afQi5E83eMu
 73Bg==
X-Gm-Message-State: AOJu0YzeL3CJ0h3dcOnItpzIctwKDmAIHQXD2CWePe6v3ias+mrD0JPH
 hDDfBrUDkTamqp9qxKgjd25psKCSs88r9bYBBRP5okOjG0sxz7P187D9cNHYKZtS/iU=
X-Gm-Gg: ASbGnctG5t7gzvALxTjGhaOYVbMIN3I7ER6a5HOzEg7m0dPSPe13e2W1BWrf2qLSTNx
 IA7+RbykrucGLffvO93vV3UXRqOcwTYrz0K6vaAVvEjVMs4nGmTv30vbP+r9tCalVlWAGvdx9HO
 3M3mmUqWj/8vfWUpGf0t2dwW5dA3AzsUOmaCkOFhqOIdsGj9PE4wvJLz9HsTW/72BRoXlT21yKt
 3ENCOcy8+crDWCbovG/+TVI8izmv+QXCFVU9jvJmWsOYGRC62J7xtgim6akBo4ag4xCy0l7ACNI
 V7BqQfQX5j69ZrqWIErSMfwW18Bqozb6ThGJ+E9mRXyOmyw45UFrvP6CNyHP0rq/795nyrPgl/e
 Sy7nDdPzqVJpB6TOajPqsO8KdVPdCUb0bAYd9zW6k3PWtgBAlOujhL50bAc4LzA6u4ZcaVZc=
X-Google-Smtp-Source: AGHT+IEu2mSVwzDT5LjMKQJdS2hDVzvACdeZL6GIpneXFiBpdrSOrYUvVbgVWRtPQDGRX4OFtTQDMA==
X-Received: by 2002:a17:90b:1d03:b0:320:fda8:fabe with SMTP id
 98e67ed59e1d1-328156ba3b0mr1365474a91.22.1756532509081; 
 Fri, 29 Aug 2025 22:41:49 -0700 (PDT)
Received: from stoup.. (122-150-204-48.dyn.ip.vocus.au. [122.150.204.48])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4d96829a66sm2435905a12.6.2025.08.29.22.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:41:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 05/84] target/arm: Add in_prot_check to S1Translate
Date: Sat, 30 Aug 2025 15:40:09 +1000
Message-ID: <20250830054128.448363-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9652f40ff8..d37c0ce0f1 100644
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


