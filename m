Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BC3CA0EE4
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:17:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXdL-0002qW-59; Thu, 14 Aug 2025 09:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXcm-0002AI-DL
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:04:09 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXcd-00058g-Na
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:04:08 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-76e2eb49b83so527300b3a.3
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176638; x=1755781438; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m+3uEC+2riiyjp23nwcw8E7cRhcW/LL6NmP5HEJ1ke8=;
 b=tn1oTa+pmDLn7cyYSK9kPKL4cYV8ipBfUZOYx9pIPzXJ/ikiPFJLJv1AqQNQPwezzt
 OwdHWJcuwM7aX3P5WCEiZlY1V6FeGtGn+JVPd1kz/JFkHOzsdiEX28nruRsFuxrQN050
 8p+xECIt+q2KiPyc1U9FL/IXErnlyrkfwvLnOfqdcoVBJ42qORonF5MPKPigxPQ1kdDd
 zyF/MMlgYhq6mtzkN3cRjyizDoZfOq47QH8vX/K7GO1lMfNTlrMPrgBg0QFBN44ZwGG3
 6x/ze6L2Ow7echMm164LcuwbjvOoQplkYnda2gEd3vNTiVROMFG5kWITP1BthQXthnQ8
 3D1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176638; x=1755781438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m+3uEC+2riiyjp23nwcw8E7cRhcW/LL6NmP5HEJ1ke8=;
 b=ZMph056YPupO746NCupElWY3XsYqu7A+wBenRLkGUZgGWpCCIJkpe9VRdMb2sX4e6n
 n53E/yWnk3eeZ1izYOP4kr72sp3dGbFIqjxO+tkCeCNXyRjpYJ5lHMXpM3rxoJ77SWVs
 Ah6DVD9o5cZkH9dXfqdUowOofmCBID+xit9txo39/4YOI1CDDOuoRycIPXCKHErQtuey
 JPYO9IbheICBQaF/iIiukknSjbUXA93+3rvKtjGG+o497z8Q63INHnvX5qpVnnHepags
 h7QPlt4HDzJ2cg7o/Jo1VPlMLiV8i5agA5HgvBbxHZxzUuBFFGNpmh+ms5vwh+Zvp9PC
 c4ew==
X-Gm-Message-State: AOJu0YzT7QKFRL91tM45BtNK0qJ+UnBVTOMzUhBF7ueQI/lOQ66i2aui
 aM6TzhyPaMHZuNUZq9dMxkiRTIunkr/13KnBsZKPJFDZh4T3spgS+LSgvSx9JFqkxojjTxqBzYj
 yS4Evfdw=
X-Gm-Gg: ASbGncv8LqeGzKG+uuqofP7jzxhjxVGQIxhGhQUSsB8Ixq/g2wHw8I+K14gP0tCjG90
 Cf6V2YSazzDydqlHhXLZ/1ZrKbHBJu8IqR+flA9WB/OcxUVB/J2RsjBufeYG52+s6UCFB6mOtac
 Epwm+c/nwlYwVHisqC6FUhDKzpdPoAGjUhofparE7To0JnNAyRu4HmOWPVir1h7vX0u9F4KtQCW
 dofak3fBXXaUzfzUUtu9Xjl5eqMsD+6sKvKnR/hrUxAu2XWTa2PyZpPev2mQzW+10aj+xRgk6AY
 BpObTxxuH+0/+XJymd+yPSPFeHFKwcpp9qZT6FHLdJwgb0zwgiFvI70Mvz1l/KBhrETFRZGtRIf
 A1KZdF/3SpUXYhujnyAWWst2Uhau2Wp/w0TMzdaI0CD9uU4FoCQpjTLKvWA==
X-Google-Smtp-Source: AGHT+IEL9qDLF5vz11BuqMZfKdEfZhhKyph/Nv1isgtnclzKCzdmqP1tfgC0yLOhUORBtV3juaLzxg==
X-Received: by 2002:a05:6a20:3947:b0:240:1c36:7979 with SMTP id
 adf61e73a8af0-240bd2405e0mr4197040637.28.1755176637451; 
 Thu, 14 Aug 2025 06:03:57 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6fesm34480631b3a.26.2025.08.14.06.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:03:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 52/85] target/arm: Implement EXLOCKException for ELR_ELx
 and SPSR_ELx
Date: Thu, 14 Aug 2025 22:57:19 +1000
Message-ID: <20250814125752.164107-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

If PSTATE.EXLOCK is set, and the GCS EXLOCK enable bit is set,
and nested virt is in the appropriate state, then we need to
raise an EXLOCK exception.

Since PSTATE.EXLOCK cannot be set without GCS being present
and enabled, no explicit check for GCS is required.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h        |  3 ++
 target/arm/cpu.h           |  1 +
 target/arm/helper.c        | 83 +++++++++++++++++++++++++++++++++++---
 target/arm/tcg/op_helper.c |  4 ++
 4 files changed, 85 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index bc6adf5956..15894332b2 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -346,6 +346,9 @@ typedef enum CPAccessResult {
      * specified target EL.
      */
     CP_ACCESS_UNDEFINED = (2 << 2),
+
+    /* Access fails with EXLOCK, a GCS exception syndrome. */
+    CP_ACCESS_EXLOCK = (3 << 2),
 } CPAccessResult;
 
 /* Indexes into fgt_read[] */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7769c4ae3c..8eee722a9e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1520,6 +1520,7 @@ void pmu_init(ARMCPU *cpu);
 #define PSTATE_C (1U << 29)
 #define PSTATE_Z (1U << 30)
 #define PSTATE_N (1U << 31)
+#define PSTATE_EXLOCK (1ULL << 34)
 #define PSTATE_NZCV (PSTATE_N | PSTATE_Z | PSTATE_C | PSTATE_V)
 #define PSTATE_DAIF (PSTATE_D | PSTATE_A | PSTATE_I | PSTATE_F)
 #define CACHED_PSTATE_BITS (PSTATE_NZCV | PSTATE_DAIF | PSTATE_BTYPE)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7d9b2762cf..4495433ce4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3435,6 +3435,77 @@ static CPAccessResult access_nv1(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+static CPAccessResult access_exlock_el1(CPUARMState *env,
+                                        const ARMCPRegInfo *ri, bool isread)
+{
+    int el = arm_current_el(env);
+
+    if (el == 1) {
+        uint64_t hcr = arm_hcr_el2_eff(env);
+
+        /*
+         * EXLOCK check is disabled for NVx in 'x11'.
+         * Since we have to diagnose that, dispatch NV1 trap too.
+         */
+        if ((hcr & HCR_NV) && (hcr & HCR_NV1)) {
+            if (hcr & HCR_NV2) {
+                return CP_ACCESS_OK;
+            }
+            return CP_ACCESS_TRAP_EL2;
+        }
+    }
+
+    if (!isread &&
+        (env->pstate & PSTATE_EXLOCK) &&
+        (el_is_in_host(env, el) ? el == 2 : el == 1) &&
+        (env->cp15.gcscr_el[el] & GCSCR_EXLOCKEN)) {
+        return CP_ACCESS_EXLOCK;
+    }
+    return CP_ACCESS_OK;
+}
+
+static CPAccessResult access_exlock_el2(CPUARMState *env,
+                                        const ARMCPRegInfo *ri, bool isread)
+{
+    int el = arm_current_el(env);
+
+    if (el == 3) {
+        return CP_ACCESS_OK;
+    }
+    if (el == 1) {
+        uint64_t hcr = arm_hcr_el2_eff(env);
+
+        /*
+         * EXLOCK check is disabled for NVx in 'xx1'.
+         * Since we have to diagnose that, dispatch NV1 trap too.
+         */
+        if (hcr & HCR_NV) {
+            if (hcr & HCR_NV2) {
+                return CP_ACCESS_OK;
+            }
+            return CP_ACCESS_TRAP_EL2;
+        }
+    }
+
+    if (!isread &&
+        (env->pstate & PSTATE_EXLOCK) &&
+        (env->cp15.gcscr_el[el] & GCSCR_EXLOCKEN)) {
+        return CP_ACCESS_EXLOCK;
+    }
+    return CP_ACCESS_OK;
+}
+
+static CPAccessResult access_exlock_el3(CPUARMState *env,
+                                        const ARMCPRegInfo *ri, bool isread)
+{
+    if (!isread &&
+        (env->pstate & PSTATE_EXLOCK) &&
+        (env->cp15.gcscr_el[3] & GCSCR_EXLOCKEN)) {
+        return CP_ACCESS_EXLOCK;
+    }
+    return CP_ACCESS_OK;
+}
+
 #ifdef CONFIG_USER_ONLY
 /*
  * `IC IVAU` is handled to improve compatibility with JITs that dual-map their
@@ -3606,13 +3677,13 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "ELR_EL1", .state = ARM_CP_STATE_AA64,
       .type = ARM_CP_ALIAS,
       .opc0 = 3, .opc1 = 0, .crn = 4, .crm = 0, .opc2 = 1,
-      .access = PL1_RW, .accessfn = access_nv1,
+      .access = PL1_RW, .accessfn = access_exlock_el1,
       .nv2_redirect_offset = 0x230 | NV2_REDIR_NV1,
       .fieldoffset = offsetof(CPUARMState, elr_el[1]) },
     { .name = "SPSR_EL1", .state = ARM_CP_STATE_AA64,
       .type = ARM_CP_ALIAS,
       .opc0 = 3, .opc1 = 0, .crn = 4, .crm = 0, .opc2 = 0,
-      .access = PL1_RW, .accessfn = access_nv1,
+      .access = PL1_RW, .accessfn = access_exlock_el1,
       .nv2_redirect_offset = 0x160 | NV2_REDIR_NV1,
       .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_SVC]) },
     /*
@@ -4083,7 +4154,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
     { .name = "ELR_EL2", .state = ARM_CP_STATE_AA64,
       .type = ARM_CP_ALIAS | ARM_CP_NV2_REDIRECT,
       .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 0, .opc2 = 1,
-      .access = PL2_RW,
+      .access = PL2_RW, .accessfn = access_exlock_el2,
       .fieldoffset = offsetof(CPUARMState, elr_el[2]) },
     { .name = "ESR_EL2", .state = ARM_CP_STATE_BOTH,
       .type = ARM_CP_NV2_REDIRECT,
@@ -4101,7 +4172,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
     { .name = "SPSR_EL2", .state = ARM_CP_STATE_AA64,
       .type = ARM_CP_ALIAS | ARM_CP_NV2_REDIRECT,
       .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 0, .opc2 = 0,
-      .access = PL2_RW,
+      .access = PL2_RW, .accessfn = access_exlock_el2,
       .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_HYP]) },
     { .name = "VBAR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 0, .opc2 = 0,
@@ -4383,7 +4454,7 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
     { .name = "ELR_EL3", .state = ARM_CP_STATE_AA64,
       .type = ARM_CP_ALIAS,
       .opc0 = 3, .opc1 = 6, .crn = 4, .crm = 0, .opc2 = 1,
-      .access = PL3_RW,
+      .access = PL3_RW, .accessfn = access_exlock_el3,
       .fieldoffset = offsetof(CPUARMState, elr_el[3]) },
     { .name = "ESR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 5, .crm = 2, .opc2 = 0,
@@ -4394,7 +4465,7 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
     { .name = "SPSR_EL3", .state = ARM_CP_STATE_AA64,
       .type = ARM_CP_ALIAS,
       .opc0 = 3, .opc1 = 6, .crn = 4, .crm = 0, .opc2 = 0,
-      .access = PL3_RW,
+      .access = PL3_RW, .accessfn = access_exlock_el3,
       .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_MON]) },
     { .name = "VBAR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 12, .crm = 0, .opc2 = 0,
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 46a3b911ec..56e117c01e 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -887,6 +887,10 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
         }
         syndrome = syn_uncategorized();
         break;
+    case CP_ACCESS_EXLOCK:
+        /* CP_ACCESS_EXLOCK is always directed to the current EL */
+        syndrome = syn_gcs_exlock();
+        break;
     default:
         g_assert_not_reached();
     }
-- 
2.43.0


