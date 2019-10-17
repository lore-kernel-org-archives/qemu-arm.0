Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1343387wrm;
        Thu, 17 Oct 2019 11:51:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw3owQiysLd4OuvdmMqMoC9/g+A30KneQ/t0WujgixevouHqo6P5NrH7XmTJ/bzc9bKtaj3
X-Received: by 2002:ac8:7084:: with SMTP id y4mr5561074qto.146.1571338308940;
        Thu, 17 Oct 2019 11:51:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571338308; cv=none;
        d=google.com; s=arc-20160816;
        b=CLbdtMQaJtbQAzZ0GE109bGdxcfwFUtykp9CU4lsncVQL2vQimq8OyCw8dnr73p8mi
         vjHkl0/eVFDgZQgEDcHGVrSlXwBb3E0uQaCmNFGBpy5DQRYRpX/vApaOtBIhzTaB0ae6
         nOLqvpI57bVicIakEWcBsUMCXBiedeP9b44jeMPLHGZQIbIcIuBS9aOWG2ryxEvCXyGj
         RDWkKm0x8sWHxprb0eA43rY7i2OCIserntPFDnwQkdsDHg7CGnupdEQYaSErur2sYoY4
         oMYZvf5APvhNPA9cfYA4xp+fztBV/L5EDgzIsQRlC3r5NjTyt11DnXmSoSpY8ZZFLfqH
         zIrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qxe5WkTH2gH9OxzrQymT8yteWQToRtaNSxbFtmMzahk=;
        b=XtztRzwEovtToy5hNpgNSW6HfqzsetTvQ6bE1ecyHs5jjyONAWoq/4oJYX0BdbkkuS
         wjV5934KmmYzzDKW4HLghyGsDwsn+76VoVwEpXTxrZm1Ei8YOY4XmUW/s9K7zwFlmrdn
         ZOl5j4Z5E3a3ZBiGjG9t4fGYtSaRe+keJQu38yXNRlSPghehsZ85/L94U8rNlI2fuaai
         I3kDw9K0GXbgRNptnR1kX6cw2v95iA3uKpobZWgGMWmtDrz7Un/FFzFbjOEvF5zRD4jq
         bN1C3S2TbyZyYtd4eUxRKMhRDAImP8otzQnhkgYsHS+C54hEEVQT5jZLRu5Z7DJQQlaC
         LCSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q1lu7Byx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w142si3037514qkb.172.2019.10.17.11.51.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 11:51:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q1lu7Byx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLAsF-00014V-Ji
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 14:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35006)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLArl-00012K-NJ
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLArk-0000p7-90
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:17 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:46458)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLArk-0000ob-2d
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:16 -0400
Received: by mail-pf1-x442.google.com with SMTP id q5so2196787pfg.13
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 11:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qxe5WkTH2gH9OxzrQymT8yteWQToRtaNSxbFtmMzahk=;
 b=Q1lu7ByxrpzlIeZR7hd36AnvstqdCH0FqremQcY5bEBwh5ML/Pl+SQzmYM6o4oZDvf
 i0JNMSCcI1FS/HEY5FKmJ9q9nQwUcqxLNR7DQw264C0PoTbIj1Stf52BbBvosEHytdNo
 MKbj1yuPtBBGQJ2Bg012yCombWsvnBMG75dK6LoKU3JqIfPOT0dmhCK5nI09c8jRUFCG
 Lde/2Blk46bxNLtTmU6y04NShABoWxpLWv+iwcmB6GOWEDt8+rCs2xGiXVUslz98HFCp
 Fwkvsrc3LH55QPCtKsdcVYx9iVyxgrZppj5m5MTMzMJEi6so8O1l+daCziKqz9MvAWau
 aHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qxe5WkTH2gH9OxzrQymT8yteWQToRtaNSxbFtmMzahk=;
 b=WdwvSZvs9W4VFHE1dmSBmtmxRliGHGIw27IKNc6gwcu9BYhBPwTaFdfIW/vlNxOk2Z
 X3/twImrNM8zk0zheQj2hUnejgZJlgpz9mwVrqOsdqMk7iQuXuP4S2DX6fHpgW6faJyr
 htyjFRXJk+vGeHPKRZ4tvlgEned7R3IfV6sdEvOE8w7lnbCrpcLsoKU3N63J89ePTVVo
 VBLTnL2n7IAKrjuS3zn4cv+CqJPfCx4QROSdAv8OQ/Dh1Y933OF8PT/UDtOhu3w6ucz7
 zYc1y5VRCaPOC7TxekDYJ755IrQnZcQOPDydiknrjYT90Z2GR/kFkRSB3LbiFNcE4VJY
 LXHw==
X-Gm-Message-State: APjAAAWqirllFPrfpTZeDn5DR5X1axZOWL0rLoj9rRWlUkvkjBtypIt2
 ra14Mgskb72JbFIiyJRdUjgWepMA2cM=
X-Received: by 2002:aa7:8ad0:: with SMTP id b16mr1855140pfd.255.1571338274993; 
 Thu, 17 Oct 2019 11:51:14 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s97sm5009256pjc.4.2019.10.17.11.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 11:51:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 02/20] target/arm: Split out rebuild_hflags_a64
Date: Thu, 17 Oct 2019 11:50:52 -0700
Message-Id: <20191017185110.539-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191017185110.539-1-richard.henderson@linaro.org>
References: <20191017185110.539-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
X-TUID: ebB3sAw1Mwhz

Create a function to compute the values of the TBFLAG_A64 bits
that will be cached.  For now, the env->hflags variable is not
used, and the results are fed back to cpu_get_tb_cpu_state.

Note that not all BTI related flags are cached, so we have to
test the BTI feature twice -- once for those bits moved out to
rebuild_hflags_a64 and once for those bits that remain in
cpu_get_tb_cpu_state.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 131 +++++++++++++++++++++++---------------------
 1 file changed, 69 insertions(+), 62 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8829d91ae1..69da04786e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11070,6 +11070,71 @@ static uint32_t rebuild_hflags_common(CPUARMState *env, int fp_el,
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
@@ -11079,67 +11144,9 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
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
@@ -11159,9 +11166,9 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
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

