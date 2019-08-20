Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4461720wrs;
        Tue, 20 Aug 2019 14:14:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxxBImI6ItAcaxuSPgS9DYP1Y8nEHAO12aYMNuuZgAe14kVgo+6RLb40AavxJ0VX8Y9XpQd
X-Received: by 2002:ac8:7b97:: with SMTP id p23mr28530057qtu.357.1566335684214;
        Tue, 20 Aug 2019 14:14:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566335684; cv=none;
        d=google.com; s=arc-20160816;
        b=0vkUno7MxwX/DmIdfyiANyltW03WxHUYHt9RZweo/V2iutCoyd8JsWMfuKTAdkozTm
         5PcWrEpVmr3TUi8UUUmkrjQip/ArsH6yrRKx5BmMJmmzwkFIbjAh7clbKn6UhlTI8+aI
         jCV80s8e+xLlCszAWeOUFs7BZIM2JXyZzkpLRhKF2aAfCKvueS0W1jV/8iM0/+iwwdTa
         wMCBIGFQFnHBmya4mibSSOf5caI/3MTP18LIWXBGMTaujSJwau+wIr2eOrjww1qKaUFY
         VXgTVOkQldfmaOrecDQct+9KcZUPIU6ClCHSVYNEZm7dR0BSvDTx3zalVZ4BMDsJRShL
         yD/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=2a32Mx4gC1OivU2H0L4/pxSm6z4s7e5vqER4g0XWBWE=;
        b=IQMx4NPB/M3pfuYORCGlOXuaE2JcltEuINZeNJlv2alx6Z+wmhQxwJ6cs6iMXM2yP3
         e5BhmCc97hgFBsC0of0I05zmqRodWf7On53UMbVNuVmg2smB9jbbbNF1sS+o378pirx1
         gbzfLdK2BZdT0CPdYyw4MmKKx4vw6ra0LV/AEjyVNARP3uS3p+bcffUxnDcYbtKM7wyt
         /H4MLPCJlXxms0wE9IuAfPkx0x8t5w2mFiIsUbxmPJrOrjKH1UmTxS6hKgRkYRs9dRON
         E51WOb2Ht9jkWb+0Vic3TCl5o2EGSQEnlNaM5kkLZMEwLi1Mp1wuSO3sy1Vopv2oMk3W
         jhEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=t4+CpH7W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3si12112839qta.224.2019.08.20.14.14.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 14:14:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=t4+CpH7W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0BSl-0007hR-Ms
	for alex.bennee@linaro.org; Tue, 20 Aug 2019 17:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53659)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BLk-0000E3-BV
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 17:07:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BLi-0008LZ-Rd
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 17:07:28 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:44252)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i0BLi-0008Kv-LJ
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 17:07:26 -0400
Received: by mail-pf1-x441.google.com with SMTP id c81so4108438pfc.11
 for <qemu-arm@nongnu.org>; Tue, 20 Aug 2019 14:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2a32Mx4gC1OivU2H0L4/pxSm6z4s7e5vqER4g0XWBWE=;
 b=t4+CpH7WoO1dpaFtXxZANjvR5GIyBQhRXlcRqDOe68NTVxSVzNUYX6lb1xMam3RFy5
 MKPTNUGdrYPcNGbeR+AK7caD7kT3/5EDhg5gIPnVxc7r+xcBmfnTaoFs3uM0tEcWBQxZ
 N9N9zRsklrw9kQB7IxHR21/Fvn6uhH10cVuEMhBtgSR2J9n+nPrNMYo47eHyq+9jECXx
 jZmeb5okvneBbIk0ud0fjL1U5Rrl11z5Z6WQGK597gqmlX6rDiD+DUqMLTl9b7KIQpzc
 GibmOpEyz4fAI3AYuP8O3Z6wTVFRE29Ihp9iUBK/BQRGy1e6W9CMRrBDs4YfU2DazTnd
 v+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2a32Mx4gC1OivU2H0L4/pxSm6z4s7e5vqER4g0XWBWE=;
 b=S1F8YDbHAbZHhvUkjFIIny/0lZ2VXYxnoebgmFDo9dBToiOD6LxUZN81JV8PiBAUsp
 o9ssfPGOnn1trMVtRSbweE3Dk9yGVcSWjYgcd+2gzrvIwfHLNmADtkzrmk0UOIcQ2ss7
 vWuq4BF8VouLtZ/kYsL8hHeBNxN/IzpQgAKpY4Q7x9HR2oNj0g+JsTJVbYJlxuWW1ISL
 iL2pp5FYBnnJOTZf5Hpb3hWNcta2t2av1FLZqiVJ2KeZMfcUOxKRpvmo5QVKuv24MdM3
 pTp0i1rWQLoM2DAxnskQFP8bJyN2b4LvHLoKgZPkO0+pyiE6Nwt+uZCQBm4YQfdS1dqd
 2MZw==
X-Gm-Message-State: APjAAAV5O9aRQklNwur0W1EOqhqJf8lknvOGRlszilDmJ3htiTbvdTd7
 uiI8dYkp6uuQ1lbMUkcucnFmPg==
X-Received: by 2002:a63:4e05:: with SMTP id c5mr6304272pgb.396.1566335245652; 
 Tue, 20 Aug 2019 14:07:25 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id k22sm21690743pfk.157.2019.08.20.14.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 14:07:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 14:07:05 -0700
Message-Id: <20190820210720.18976-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820210720.18976-1-richard.henderson@linaro.org>
References: <20190820210720.18976-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH v5 02/17] target/arm: Split out rebuild_hflags_a64
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ChGbCJ4PKPFX

Create a function to compute the values of the TBFLAG_A64 bits
that will be cached.  For now, the env->hflags variable is not
used, and the results are fed back to cpu_get_tb_cpu_state.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 131 +++++++++++++++++++++++---------------------
 1 file changed, 69 insertions(+), 62 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f2c6419369..02cb43cf58 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11032,6 +11032,71 @@ static uint32_t rebuild_hflags_common(CPUARMState *env, int fp_el,
     return flags;
 }
 
+static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
+                                   ARMMMUIdx mmu_idx)
+{
+    ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
+    ARMVAParameters p0 = aa64_va_parameters_both(env, 0, stage1);
+    uint32_t flags = 0;
+    uint64_t sctlr;
+    int tbii, tbid;
+
+    flags = FIELD_DP32(flags, TBFLAG_ANY, AARCH64_STATE, 1);
+
+    /* FIXME: ARMv8.1-VHE S2 translation regime.  */
+    if (regime_el(env, stage1) < 2) {
+        ARMVAParameters p1 = aa64_va_parameters_both(env, -1, stage1);
+        tbid = (p1.tbi << 1) | p0.tbi;
+        tbii = tbid & ~((p1.tbid << 1) | p0.tbid);
+    } else {
+        tbid = p0.tbi;
+        tbii = tbid & !p0.tbid;
+    }
+
+    flags = FIELD_DP32(flags, TBFLAG_A64, TBII, tbii);
+    flags = FIELD_DP32(flags, TBFLAG_A64, TBID, tbid);
+
+    if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
+        int sve_el = sve_exception_el(env, el);
+        uint32_t zcr_len;
+
+        /*
+         * If SVE is disabled, but FP is enabled,
+         * then the effective len is 0.
+         */
+        if (sve_el != 0 && fp_el == 0) {
+            zcr_len = 0;
+        } else {
+            zcr_len = sve_zcr_len_for_el(env, el);
+        }
+        flags = FIELD_DP32(flags, TBFLAG_A64, SVEEXC_EL, sve_el);
+        flags = FIELD_DP32(flags, TBFLAG_A64, ZCR_LEN, zcr_len);
+    }
+
+    sctlr = arm_sctlr(env, el);
+
+    if (cpu_isar_feature(aa64_pauth, env_archcpu(env))) {
+        /*
+         * In order to save space in flags, we record only whether
+         * pauth is "inactive", meaning all insns are implemented as
+         * a nop, or "active" when some action must be performed.
+         * The decision of which action to take is left to a helper.
+         */
+        if (sctlr & (SCTLR_EnIA | SCTLR_EnIB | SCTLR_EnDA | SCTLR_EnDB)) {
+            flags = FIELD_DP32(flags, TBFLAG_A64, PAUTH_ACTIVE, 1);
+        }
+    }
+
+    if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
+        /* Note that SCTLR_EL[23].BT == SCTLR_BT1.  */
+        if (sctlr & (el == 0 ? SCTLR_BT0 : SCTLR_BT1)) {
+            flags = FIELD_DP32(flags, TBFLAG_A64, BT, 1);
+        }
+    }
+
+    return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
+}
+
 void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
@@ -11041,67 +11106,9 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     uint32_t flags = 0;
 
     if (is_a64(env)) {
-        ARMCPU *cpu = env_archcpu(env);
-        uint64_t sctlr;
-
         *pc = env->pc;
-        flags = FIELD_DP32(flags, TBFLAG_ANY, AARCH64_STATE, 1);
-
-        /* Get control bits for tagged addresses.  */
-        {
-            ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
-            ARMVAParameters p0 = aa64_va_parameters_both(env, 0, stage1);
-            int tbii, tbid;
-
-            /* FIXME: ARMv8.1-VHE S2 translation regime.  */
-            if (regime_el(env, stage1) < 2) {
-                ARMVAParameters p1 = aa64_va_parameters_both(env, -1, stage1);
-                tbid = (p1.tbi << 1) | p0.tbi;
-                tbii = tbid & ~((p1.tbid << 1) | p0.tbid);
-            } else {
-                tbid = p0.tbi;
-                tbii = tbid & !p0.tbid;
-            }
-
-            flags = FIELD_DP32(flags, TBFLAG_A64, TBII, tbii);
-            flags = FIELD_DP32(flags, TBFLAG_A64, TBID, tbid);
-        }
-
-        if (cpu_isar_feature(aa64_sve, cpu)) {
-            int sve_el = sve_exception_el(env, current_el);
-            uint32_t zcr_len;
-
-            /* If SVE is disabled, but FP is enabled,
-             * then the effective len is 0.
-             */
-            if (sve_el != 0 && fp_el == 0) {
-                zcr_len = 0;
-            } else {
-                zcr_len = sve_zcr_len_for_el(env, current_el);
-            }
-            flags = FIELD_DP32(flags, TBFLAG_A64, SVEEXC_EL, sve_el);
-            flags = FIELD_DP32(flags, TBFLAG_A64, ZCR_LEN, zcr_len);
-        }
-
-        sctlr = arm_sctlr(env, current_el);
-
-        if (cpu_isar_feature(aa64_pauth, cpu)) {
-            /*
-             * In order to save space in flags, we record only whether
-             * pauth is "inactive", meaning all insns are implemented as
-             * a nop, or "active" when some action must be performed.
-             * The decision of which action to take is left to a helper.
-             */
-            if (sctlr & (SCTLR_EnIA | SCTLR_EnIB | SCTLR_EnDA | SCTLR_EnDB)) {
-                flags = FIELD_DP32(flags, TBFLAG_A64, PAUTH_ACTIVE, 1);
-            }
-        }
-
-        if (cpu_isar_feature(aa64_bti, cpu)) {
-            /* Note that SCTLR_EL[23].BT == SCTLR_BT1.  */
-            if (sctlr & (current_el == 0 ? SCTLR_BT0 : SCTLR_BT1)) {
-                flags = FIELD_DP32(flags, TBFLAG_A64, BT, 1);
-            }
+        flags = rebuild_hflags_a64(env, current_el, fp_el, mmu_idx);
+        if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
             flags = FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);
         }
     } else {
@@ -11121,9 +11128,9 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             flags = FIELD_DP32(flags, TBFLAG_A32,
                                XSCALE_CPAR, env->cp15.c15_cpar);
         }
-    }
 
-    flags = rebuild_hflags_common(env, fp_el, mmu_idx, flags);
+        flags = rebuild_hflags_common(env, fp_el, mmu_idx, flags);
+    }
 
     /* The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
      * states defined in the ARM ARM for software singlestep:
-- 
2.17.1

