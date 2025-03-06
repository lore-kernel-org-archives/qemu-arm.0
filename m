Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1608584njm;
        Thu, 6 Mar 2025 08:40:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUY1exNXhhbp9IOYtxFWkfdQaUzjMohWhpgCMtmZ1vJ+cpBBzU6rbziv+M62SZbPCKCsp8LUMlIdjAH1Q==@linaro.org
X-Google-Smtp-Source: AGHT+IF59bdVSJ2D/0Oa3zVF1yA+7EtE2Azek0+4oObKAfl96AGeex95k5gMbWdud2NVYXNhzjfy
X-Received: by 2002:a05:6214:451a:b0:6e8:f2bf:7262 with SMTP id 6a1803df08f44-6e8f2bf7543mr65486006d6.41.1741279210498;
        Thu, 06 Mar 2025 08:40:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741279210; cv=none;
        d=google.com; s=arc-20240605;
        b=UEygbtxVlYa2eXDoyKjMfRzvsqEd1ur81IIeKi5RLigEX6c5g3cMYfcKTCgN04hp96
         adlCJ8kLwQfpKljAC2id+HBltHEQNTs7RuE8w1xy4cwlNGBDcV+8Da0VgcKZDhXDAp74
         Y3BTpIGEih6ljMVADkay+XE2DnWfE3Hehj4g51DWle+LPcCHbrDkIQYtbpbo3c9ieAFr
         Xo46ORqKeQznIvPrdhiVBlu4RCi6k7MRmBHRR5fg+5HN2dqKBc3g1Xjxc6aBKpFXqKum
         /vzBUubxEDl1rmwOjgG5OI97gZ6tmKmp6iQbFU4doFVOXAPGmUnqBIYvFHjn/5tSDPCD
         Nxng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vxTSFCna0HuVCZNyrZWduZwQIOEnzTKyAVW239fxJio=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=EfAZAYXphIVI5s7EOEqHiS1BwqIoTEG6nAufY1sv4qyaPS6kUQ1x8L7in337xcuE/T
         LnEWFH4sn3yEghBFnElrYNDgz29YEfXcpDqke6yyh/gup73kb6OyOCHOpAeXZFMw+3/K
         B9fi+coTR2r67S5Bq+/ttK1dUTkSU/oobA02PhuEHIvaCbday3tlHngf3yprJSGohAt9
         P5/L4ey8Mi4RLv3/4vS8q6n70MZi+77jn7Mt0yb7bjbRC/L7pH27NWsGH6ZjK8UBkSvH
         F8J3ZHuLJ+yYFK9mp5bFQqNIZeTUEA0yC2wjBWOBF7/gVMehIODzUAJIOU71D+J4uV/a
         dRzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KEPeZQXE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f7162695si14490956d6.228.2025.03.06.08.40.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 08:40:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KEPeZQXE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqEG5-0006qK-HG; Thu, 06 Mar 2025 11:39:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tqEG0-0006ll-PB
 for qemu-arm@nongnu.org; Thu, 06 Mar 2025 11:39:37 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tqEFy-0004ad-Gf
 for qemu-arm@nongnu.org; Thu, 06 Mar 2025 11:39:36 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39130ee05b0so272157f8f.3
 for <qemu-arm@nongnu.org>; Thu, 06 Mar 2025 08:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741279173; x=1741883973; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vxTSFCna0HuVCZNyrZWduZwQIOEnzTKyAVW239fxJio=;
 b=KEPeZQXE+d+eT0Ngb9h+TZ3WaV2ItuXH0kwUcdqGae6RXLL0I8ykrn94HBey2xDFxt
 LlWseabZBWqF4I9E7pzAqqSXGvw3uWhpvtBTUVBtRfk5OR4eVQZH8qy7ajUr2FWbXmCO
 mG7Z92SUlC6o0LpEldkcYnjmthajmU/wCndZqa91l+lRcu7VopAseQNSnGMRsZ5jOk1G
 pRf5k1QIIwIZ6Ga6J8yZRlmcyXldpkd4TTSSFraxmciJOTTiOuT6Er5C5cXvDs1ZbnlB
 KrL2ml/ZJ9BAO++AiGob4gUuBW9UjEEgfWDWx0RDCKnVNDslDemsG8pON+kMlhBF22xu
 Iz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741279173; x=1741883973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vxTSFCna0HuVCZNyrZWduZwQIOEnzTKyAVW239fxJio=;
 b=EueIAitqY4jdc/BRT68td/HxlOQohGeGef9q7UR0AL1/U8nXoVRz+qcEWdRsSxmQio
 RSG+wGJLwi2eTMeVefOgURPDOkgkxy5myx0gX9mpGD4Rztaxi3fUvOA8uQymn27+DVdz
 XufYW0WAlgdeLDMoum5NUusefQEvBLA8JWLdEPRweDhSmdTEf7QU2VrDXUOEYd5Ho3Uh
 +iBHms7KFdDt1SnTTcLEZ/DdxhtIjssJz5v2moe8L53EqnbvLz/HF1qWor51kJp1uIZW
 8CRlj3EzycTdSGYOH9VxxEeG3v9bqVpgq1u5CeJ6J8LtZdipIutn6NlZHVWIOO7ytKQ8
 dJFA==
X-Gm-Message-State: AOJu0YwXcM6TXaoPpCjpNqkJmKATSuD1fk3oOJwWzwc1WeCi2AJmCOkw
 tcXsUIxTukRTGRre7O9cnpqFsScALB3ciPrGsr2ZI47ErxiDxapCm/etQ8FokBNp4XLBj/YA+hp
 x
X-Gm-Gg: ASbGncsLP1Ong7NAPgF571wtHJlBw3YG4aACab21t9HmDNqh7GJG8abAofyDTIfZ3j4
 Uoy2D82nrzUUgb+tuZGV+ijBM7/vScpQJ6wHJGAldoAdOVky5H4IkpEiuYjO4Kvia5r3MN8+E0W
 03wzUfuaNT/HeSf1ooBFnB1l/+xdfiQ7e1jtBvurMlz4XFZI8FOMiPstZwNu/8zoZoN/7T81VU4
 FEVew2uWJZj+T/yKvGBO/VAuqcIB5zEXsWBUjw7lJci82bscNL9An9WQOSQIzdYh3rfdWzUeXCa
 QllH5o+L/6WIEDah+wmsoub8IkGaCL4B74L3Gnmst0PXKb2eKdA=
X-Received: by 2002:a5d:5889:0:b0:390:f745:bbfb with SMTP id
 ffacd0b85a97d-3911f74256dmr6902144f8f.26.1741279172805; 
 Thu, 06 Mar 2025 08:39:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd94913fsm23999905e9.37.2025.03.06.08.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:39:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/10] target/arm: Move arm_current_el() and arm_el_is_aa64()
 to internals.h
Date: Thu,  6 Mar 2025 16:39:20 +0000
Message-ID: <20250306163925.2940297-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306163925.2940297-1-peter.maydell@linaro.org>
References: <20250306163925.2940297-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /cyPEuEn1nj3

The functions arm_current_el() and arm_el_is_aa64() are used only in
target/arm and in hw/intc/arm_gicv3_cpuif.c.  They're functions that
query internal state of the CPU.  Move them out of cpu.h and into
internals.h.

This means we need to include internals.h in arm_gicv3_cpuif.c, but
this is justifiable because that file is implementing the GICv3 CPU
interface, which really is part of the CPU proper; we just ended up
implementing it in code in hw/intc/ for historical reasons.

The motivation for this move is that we'd like to change
arm_el_is_aa64() to add a condition that uses cpu_isar_feature();
but we don't want to include cpu-features.h in cpu.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h          | 66 --------------------------------------
 target/arm/internals.h    | 67 +++++++++++++++++++++++++++++++++++++++
 hw/intc/arm_gicv3_cpuif.c |  1 +
 target/arm/arch_dump.c    |  1 +
 4 files changed, 69 insertions(+), 66 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 16c9083be61..a779fd5ae94 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2633,39 +2633,6 @@ uint64_t arm_hcr_el2_eff_secstate(CPUARMState *env, ARMSecuritySpace space);
 uint64_t arm_hcr_el2_eff(CPUARMState *env);
 uint64_t arm_hcrx_el2_eff(CPUARMState *env);
 
-/* Return true if the specified exception level is running in AArch64 state. */
-static inline bool arm_el_is_aa64(CPUARMState *env, int el)
-{
-    /* This isn't valid for EL0 (if we're in EL0, is_a64() is what you want,
-     * and if we're not in EL0 then the state of EL0 isn't well defined.)
-     */
-    assert(el >= 1 && el <= 3);
-    bool aa64 = arm_feature(env, ARM_FEATURE_AARCH64);
-
-    /* The highest exception level is always at the maximum supported
-     * register width, and then lower levels have a register width controlled
-     * by bits in the SCR or HCR registers.
-     */
-    if (el == 3) {
-        return aa64;
-    }
-
-    if (arm_feature(env, ARM_FEATURE_EL3) &&
-        ((env->cp15.scr_el3 & SCR_NS) || !(env->cp15.scr_el3 & SCR_EEL2))) {
-        aa64 = aa64 && (env->cp15.scr_el3 & SCR_RW);
-    }
-
-    if (el == 2) {
-        return aa64;
-    }
-
-    if (arm_is_el2_enabled(env)) {
-        aa64 = aa64 && (env->cp15.hcr_el2 & HCR_RW);
-    }
-
-    return aa64;
-}
-
 /*
  * Function for determining whether guest cp register reads and writes should
  * access the secure or non-secure bank of a cp register.  When EL3 is
@@ -2697,39 +2664,6 @@ static inline bool arm_v7m_is_handler_mode(CPUARMState *env)
     return env->v7m.exception != 0;
 }
 
-/* Return the current Exception Level (as per ARMv8; note that this differs
- * from the ARMv7 Privilege Level).
- */
-static inline int arm_current_el(CPUARMState *env)
-{
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        return arm_v7m_is_handler_mode(env) ||
-            !(env->v7m.control[env->v7m.secure] & 1);
-    }
-
-    if (is_a64(env)) {
-        return extract32(env->pstate, 2, 2);
-    }
-
-    switch (env->uncached_cpsr & 0x1f) {
-    case ARM_CPU_MODE_USR:
-        return 0;
-    case ARM_CPU_MODE_HYP:
-        return 2;
-    case ARM_CPU_MODE_MON:
-        return 3;
-    default:
-        if (arm_is_secure(env) && !arm_el_is_aa64(env, 3)) {
-            /* If EL3 is 32-bit then all secure privileged modes run in
-             * EL3
-             */
-            return 3;
-        }
-
-        return 1;
-    }
-}
-
 /**
  * write_list_to_cpustate
  * @cpu: ARMCPU
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 70d1f88c20b..b3f732233f4 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -392,6 +392,73 @@ static inline FloatRoundMode arm_rmode_to_sf(ARMFPRounding rmode)
     return arm_rmode_to_sf_map[rmode];
 }
 
+/* Return true if the specified exception level is running in AArch64 state. */
+static inline bool arm_el_is_aa64(CPUARMState *env, int el)
+{
+    /*
+     * This isn't valid for EL0 (if we're in EL0, is_a64() is what you want,
+     * and if we're not in EL0 then the state of EL0 isn't well defined.)
+     */
+    assert(el >= 1 && el <= 3);
+    bool aa64 = arm_feature(env, ARM_FEATURE_AARCH64);
+
+    /*
+     * The highest exception level is always at the maximum supported
+     * register width, and then lower levels have a register width controlled
+     * by bits in the SCR or HCR registers.
+     */
+    if (el == 3) {
+        return aa64;
+    }
+
+    if (arm_feature(env, ARM_FEATURE_EL3) &&
+        ((env->cp15.scr_el3 & SCR_NS) || !(env->cp15.scr_el3 & SCR_EEL2))) {
+        aa64 = aa64 && (env->cp15.scr_el3 & SCR_RW);
+    }
+
+    if (el == 2) {
+        return aa64;
+    }
+
+    if (arm_is_el2_enabled(env)) {
+        aa64 = aa64 && (env->cp15.hcr_el2 & HCR_RW);
+    }
+
+    return aa64;
+}
+
+/*
+ * Return the current Exception Level (as per ARMv8; note that this differs
+ * from the ARMv7 Privilege Level).
+ */
+static inline int arm_current_el(CPUARMState *env)
+{
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        return arm_v7m_is_handler_mode(env) ||
+            !(env->v7m.control[env->v7m.secure] & 1);
+    }
+
+    if (is_a64(env)) {
+        return extract32(env->pstate, 2, 2);
+    }
+
+    switch (env->uncached_cpsr & 0x1f) {
+    case ARM_CPU_MODE_USR:
+        return 0;
+    case ARM_CPU_MODE_HYP:
+        return 2;
+    case ARM_CPU_MODE_MON:
+        return 3;
+    default:
+        if (arm_is_secure(env) && !arm_el_is_aa64(env, 3)) {
+            /* If EL3 is 32-bit then all secure privileged modes run in EL3 */
+            return 3;
+        }
+
+        return 1;
+    }
+}
+
 static inline bool arm_cpu_data_is_big_endian_a32(CPUARMState *env,
                                                   bool sctlr_b)
 {
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 7f1d071c198..de37465bc87 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "target/arm/cpregs.h"
 #include "target/arm/cpu-features.h"
+#include "target/arm/internals.h"
 #include "system/tcg.h"
 #include "system/qtest.h"
 
diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index 5c943dc27b5..c40df4e7fd7 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -23,6 +23,7 @@
 #include "elf.h"
 #include "system/dump.h"
 #include "cpu-features.h"
+#include "internals.h"
 
 /* struct user_pt_regs from arch/arm64/include/uapi/asm/ptrace.h */
 struct aarch64_user_regs {
-- 
2.43.0

