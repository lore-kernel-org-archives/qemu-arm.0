Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6D6C83F1B
	for <qemu-arm@archiver.kernel.org>; Fri, 11 Jul 2025 22:51:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uaMau-0000RC-L3; Fri, 11 Jul 2025 18:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uaMYb-0007Pn-0s
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 18:49:44 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uaMYU-0008NB-B8
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 18:49:27 -0400
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-40a4bf1ebb7so1345206b6e.0
 for <qemu-arm@nongnu.org>; Fri, 11 Jul 2025 15:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752274159; x=1752878959; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QoVt34T1baW12rVn5dQP7UZyDzzjRTAvBEJWDUabYc8=;
 b=n9NaGnPLsvzJs+dCKkeZ6pAhsiDx4djkvkCVePO/q5kto9gZO4Bg23GkBNBVdEwZ03
 F66YhzS+fZ2LNn4oQMkwkUiPA8c7jTe/kda1HhmA7zazsEh0An442W2dKX1Yn5vvdCaN
 tSELltLffrweNA2OmMrzCaJPgggcWJskMJPBz0kuE4GHOX6wYNlPpG/QREleqpEu1MYX
 w8j+GsL6g0/8sDoXBLdHYrnkpLL3juUpoS7gvDmkQ0XCkbSxqkIu4d2ZVT9crvVZ02SI
 naOmN2bGi3mKQ1R7gtqD7k4AkBigRnJ8/RcEaKn81MNzvRYv+wgkp1tD9CyogFmyu3/r
 DkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752274159; x=1752878959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QoVt34T1baW12rVn5dQP7UZyDzzjRTAvBEJWDUabYc8=;
 b=Tlnn3qAxO8gnA4kHMtVEBtZ8r7KLfxsef+EeoHdLUJ0lE3JDW8LFtbiV+UMa85620S
 JXBkDXz9AM6SSyh6TnqfUitlN8SKPIxVeLUMXTjdJzuIGFmAHH9QtBHLpUYpAdmkntv3
 I807cNDiqvJcfLWWBvvTHLBO7uga8TAtFewlwvKIWwSYEJtKRP7q1k+q7XyAkTvgCns4
 B0EUKL/rbkvAf8iVUulmfQmU06jLoHPYOMA944HZbBGC+vJMDl8O1TFql+UMdJU+izCA
 RzpXdw8OpCLKoWXyyoo21HYuxdSubBI4giyjjo5mThdC/rFc9g6dz58mnIQmgLRYDz3K
 Yz6g==
X-Gm-Message-State: AOJu0YzK/zPrRP8HAiPEcVGCxcz57ffWJ4FWBd8ruwq50LlbUYCNgEgc
 KR7RL8gvfCyN6jtm0TgxUKo70vE6iuJ7manXuCOoM74np5IgX8KXV/6qXxOjmuKUWAA=
X-Gm-Gg: ASbGncs9lVTnprv6VjeJEnv1p1MysTA1IKji1QbvPgJTne1iaeSbFKVkP+VdJWSE0Pq
 E/1AW8oT832OLvjySIC6EwyHXOZYT18eiOOY7SXL0+T0/zMMSW0/Sqh7cb+sqSsW2GtXZYwezs5
 yv0vGmC44F5dqvwhVqJkwv+j8LM79IOSIOQ1OBi8WJY8Me7zzQhajQnW4Fdy95+OH6FZxWlf8gY
 Y5vWxMxHNR976bLcChA4mO9VblUjjamUdY2jTlOpMiV1zans6LzqWT5Vdgz/zDENBnBvAePC3HA
 68N60YLSd6XNFJQkwQ3e+6tWbQLiAM7U7K6FjjQ7WH7BzFo5AXKmVc67y9fdlmEH6DdPuB8tTxZ
 yDkBxAiT35wj8FbvuUSRHVCFJmr7c2aNwT+NpK+I+2WRvCsThqXcpa3rx+MHT/SnHeM+TpBJY9V
 BuUI+KPX5N
X-Google-Smtp-Source: AGHT+IHSaMXCLhJsYxE72egofJvuoL3B7jCSbh+M675b/V+Nvl80TQx28723SE4aU5enP6/eM/nt8A==
X-Received: by 2002:a05:6808:16aa:b0:40b:1222:8fd8 with SMTP id
 5614622812f47-41539f925c2mr3663531b6e.35.1752274158939; 
 Fri, 11 Jul 2025 15:49:18 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-414197c6064sm696638b6e.20.2025.07.11.15.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 15:49:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 1/9] target/arm: Add prot_check parameter to
 pmsav8_mpu_lookup
Date: Fri, 11 Jul 2025 16:49:07 -0600
Message-ID: <20250711224915.62369-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250711224915.62369-1-richard.henderson@linaro.org>
References: <20250711224915.62369-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h    |  5 +++--
 target/arm/ptw.c          | 11 ++++++-----
 target/arm/tcg/m_helper.c |  4 ++--
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6c1112e641..a02439df63 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1626,8 +1626,9 @@ bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
     __attribute__((nonnull));
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
-                       MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       bool is_secure, GetPhysAddrResult *result,
+                       MMUAccessType access_type, unsigned prot_check,
+                       ARMMMUIdx mmu_idx, bool is_secure,
+                       GetPhysAddrResult *result,
                        ARMMMUFaultInfo *fi, uint32_t *mregion);
 
 void arm_log_exception(CPUState *cs);
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 561bf2678e..a914e7e23c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2561,8 +2561,9 @@ static uint32_t *regime_rlar(CPUARMState *env, ARMMMUIdx mmu_idx,
 }
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
-                       MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       bool secure, GetPhysAddrResult *result,
+                       MMUAccessType access_type, unsigned prot_check,
+                       ARMMMUIdx mmu_idx, bool secure,
+                       GetPhysAddrResult *result,
                        ARMMMUFaultInfo *fi, uint32_t *mregion)
 {
     /*
@@ -2750,7 +2751,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     if (arm_feature(env, ARM_FEATURE_M)) {
         fi->level = 1;
     }
-    return !(result->f.prot & (1 << access_type));
+    return (prot_check & ~result->f.prot) != 0;
 }
 
 static bool v8m_is_sau_exempt(CPUARMState *env,
@@ -2952,8 +2953,8 @@ static bool get_phys_addr_pmsav8(CPUARMState *env,
         }
     }
 
-    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx, secure,
-                            result, fi, NULL);
+    ret = pmsav8_mpu_lookup(env, address, access_type, 1 << access_type,
+                            mmu_idx, secure, result, fi, NULL);
     if (sattrs.subpage) {
         result->f.lg_page_size = 0;
     }
diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index 28307b5615..d856e3bc8e 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -2829,8 +2829,8 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
         ARMMMUFaultInfo fi = {};
 
         /* We can ignore the return value as prot is always set */
-        pmsav8_mpu_lookup(env, addr, MMU_DATA_LOAD, mmu_idx, targetsec,
-                          &res, &fi, &mregion);
+        pmsav8_mpu_lookup(env, addr, MMU_DATA_LOAD, PAGE_READ, mmu_idx,
+                          targetsec, &res, &fi, &mregion);
         if (mregion == -1) {
             mrvalid = false;
             mregion = 0;
-- 
2.43.0


