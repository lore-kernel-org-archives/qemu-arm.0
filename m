Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3755554lfh;
        Mon, 23 May 2022 13:53:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxB4RAsHWnMEVcK1SPUn1fl6f+Mi3DIO9mensUArGuu3+Q4X4Ms/zqvtZQKI+E9t3ev147Q
X-Received: by 2002:a05:620a:404d:b0:6a4:f5b0:d8ca with SMTP id i13-20020a05620a404d00b006a4f5b0d8camr887278qko.506.1653339222212;
        Mon, 23 May 2022 13:53:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653339222; cv=none;
        d=google.com; s=arc-20160816;
        b=dGX2IHamvU5PEQVh1ofYNAzztTvKCeB8eEttu2GTd2iUEiEXOP0ihXmbdLPW+paSg0
         002ovkclKLUud8x2Cb3pi0kco/774M7alATZBgFydjIiGkrmFIgKKD7xfUZZ7ktjRAf4
         J3Z9B48HBblhcbc6I6achGtjBJNQrpiY81xdXOo56LMTw8jGMlcnWDQ6KJx7hPOSOnJO
         bM/utulj+XHLJr9nZzf6S/sIy9BtfFq4BysbtxFVPoVvRRb7pUgYPwWr2ACi9DCuJJKQ
         pQl9eMVzz5yFLhfZD9CCT/XCLUxRaQNOn3u5xQJEcAig7ihPHXC3yEwZGYCzOCL0cuQz
         ee5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=q+QZhQErKHUIz5Yukzx015BIaa2BxFp+5FYfWrFDsdE=;
        b=E8x6q7TlD7LL86VNGOkzKNThhQ4kSI74aFILBrcPtZMUg9agtKYI0ho031quQBPOO0
         /EbnuJbwvbikaQWAO/5dY5Ht+Y9LVIQKqZzpenXWi59NqX9RXPBUCGllwAhNqjFszzNH
         Mlvf5+O0vcGPXOcKPyi/AjaOZbuem8fOKyy4XQlfOdY9rhr8sIgt62rB6iE0p7eQQf3I
         f11csOoAi9Rino/55vshkbkIHKYya//OwWTbRkQrNXnohZQ+IzwOPG3wuzR+Y8ivG3sa
         IMeNt/eYIrAIqCSvYfNjxwCr8Nrmh/I41uKj0ehgfUTCE56mdlUL+bqILAsjaoQWENm1
         mKXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qsG06/1Y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11-20020a370c0b000000b0069f9e2763fdsi2925017qkm.533.2022.05.23.13.53.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 May 2022 13:53:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qsG06/1Y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntF3d-0000PZ-Mf
	for alex.bennee@linaro.org; Mon, 23 May 2022 16:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy2-0008IS-TE
 for qemu-arm@nongnu.org; Mon, 23 May 2022 16:47:55 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy0-000511-89
 for qemu-arm@nongnu.org; Mon, 23 May 2022 16:47:54 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 nr2-20020a17090b240200b001df2b1bfc40so280941pjb.5
 for <qemu-arm@nongnu.org>; Mon, 23 May 2022 13:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q+QZhQErKHUIz5Yukzx015BIaa2BxFp+5FYfWrFDsdE=;
 b=qsG06/1Y+v9gX1C590KKpyBfGShtarjOQUjGVGu0PygxKViicjiak5e8G73I1/mFHg
 yW1gUlw+J42hHa4PEEp2LeL17bxu/JwnTvTdxbp3MUs+8ynuUFF2TI8gprouJOL2Tto9
 H52Mo0kKV/2WWJmrPyB3sowlFuwNTpw8yjqSW0t/J8+mEJtdaF4ZgrMpNKprqucUo03u
 4DCRurDeRJoX1CZrBLPa0E2PN3xCeZzdzdnzOtfIJhB2KfqxOb4OsD8jpkOUw+/rNNOG
 bJ19SGjckAxhRIvm/5h+gJRL0XS+c0E7vhF79r8vLYZEwmjfhm8c1FDjqONdPZIwPD5V
 Talg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q+QZhQErKHUIz5Yukzx015BIaa2BxFp+5FYfWrFDsdE=;
 b=cLOfGetNbaOuTo67ii+u4HspjHqNfL1omUzZ5eSfTep/Jsv9ma4kV5E6494gkBSVYT
 YJWLChbId/5jiqk0K7OcnJio3/1JIpl7EvJd0LcH1z+JUDZsJZ/kxvVd7HSi9X9pQLb+
 q3AAQssrDmDTonZ3mt41aLpFJYiQE2lgcDx2b8dJ/vhvWYe2v9IFw0RLuGA6Tx0PW1Yo
 4qCuKzXgkOvSoaTYv7pnq413mzOJAKdkpm8+wzR58IIHndZaOIPN+5Ws76xWG4vbRao/
 Eftw2Ci20hBfHHkUthUXnCLdjdInD6VYGoMzGECkkUVaM7uGcYqjDNmm1gS/9HgGQp1i
 SUJQ==
X-Gm-Message-State: AOAM531JePvnSkTWSf9VZQHmc0b9VXfs9UqxyAym7kwEe7YSqfFj+p03
 06yfW4IJS13jCALUayCAdF3j4ll2dYbKEA==
X-Received: by 2002:a17:903:40d2:b0:161:a2d9:3230 with SMTP id
 t18-20020a17090340d200b00161a2d93230mr24239572pld.57.1653338869913; 
 Mon, 23 May 2022 13:47:49 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 06/18] target/arm: Move arm_generate_debug_exceptions out of
 line
Date: Mon, 23 May 2022 13:47:30 -0700
Message-Id: <20220523204742.740932-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r9htf8ZhyXAb

Move arm_generate_debug_exceptions and its two subroutines,
{aa32,aa64}_generate_debug_exceptions into debug_helper.c,
and the one interface declaration to internals.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h          | 91 -------------------------------------
 target/arm/internals.h    |  1 +
 target/arm/debug_helper.c | 94 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+), 91 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2e115a0281..92c9758e86 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2996,97 +2996,6 @@ static inline bool arm_v7m_csselr_razwi(ARMCPU *cpu)
     return (cpu->clidr & R_V7M_CLIDR_CTYPE_ALL_MASK) != 0;
 }
 
-/* See AArch64.GenerateDebugExceptionsFrom() in ARM ARM pseudocode */
-static inline bool aa64_generate_debug_exceptions(CPUARMState *env)
-{
-    int cur_el = arm_current_el(env);
-    int debug_el;
-
-    if (cur_el == 3) {
-        return false;
-    }
-
-    /* MDCR_EL3.SDD disables debug events from Secure state */
-    if (arm_is_secure_below_el3(env)
-        && extract32(env->cp15.mdcr_el3, 16, 1)) {
-        return false;
-    }
-
-    /*
-     * Same EL to same EL debug exceptions need MDSCR_KDE enabled
-     * while not masking the (D)ebug bit in DAIF.
-     */
-    debug_el = arm_debug_target_el(env);
-
-    if (cur_el == debug_el) {
-        return extract32(env->cp15.mdscr_el1, 13, 1)
-            && !(env->daif & PSTATE_D);
-    }
-
-    /* Otherwise the debug target needs to be a higher EL */
-    return debug_el > cur_el;
-}
-
-static inline bool aa32_generate_debug_exceptions(CPUARMState *env)
-{
-    int el = arm_current_el(env);
-
-    if (el == 0 && arm_el_is_aa64(env, 1)) {
-        return aa64_generate_debug_exceptions(env);
-    }
-
-    if (arm_is_secure(env)) {
-        int spd;
-
-        if (el == 0 && (env->cp15.sder & 1)) {
-            /* SDER.SUIDEN means debug exceptions from Secure EL0
-             * are always enabled. Otherwise they are controlled by
-             * SDCR.SPD like those from other Secure ELs.
-             */
-            return true;
-        }
-
-        spd = extract32(env->cp15.mdcr_el3, 14, 2);
-        switch (spd) {
-        case 1:
-            /* SPD == 0b01 is reserved, but behaves as 0b00. */
-        case 0:
-            /* For 0b00 we return true if external secure invasive debug
-             * is enabled. On real hardware this is controlled by external
-             * signals to the core. QEMU always permits debug, and behaves
-             * as if DBGEN, SPIDEN, NIDEN and SPNIDEN are all tied high.
-             */
-            return true;
-        case 2:
-            return false;
-        case 3:
-            return true;
-        }
-    }
-
-    return el != 2;
-}
-
-/* Return true if debugging exceptions are currently enabled.
- * This corresponds to what in ARM ARM pseudocode would be
- *    if UsingAArch32() then
- *        return AArch32.GenerateDebugExceptions()
- *    else
- *        return AArch64.GenerateDebugExceptions()
- * We choose to push the if() down into this function for clarity,
- * since the pseudocode has it at all callsites except for the one in
- * CheckSoftwareStep(), where it is elided because both branches would
- * always return the same value.
- */
-static inline bool arm_generate_debug_exceptions(CPUARMState *env)
-{
-    if (env->aarch64) {
-        return aa64_generate_debug_exceptions(env);
-    } else {
-        return aa32_generate_debug_exceptions(env);
-    }
-}
-
 static inline bool arm_sctlr_b(CPUARMState *env)
 {
     return
diff --git a/target/arm/internals.h b/target/arm/internals.h
index b447d850ae..91702b3ff7 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1318,5 +1318,6 @@ void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
 
 void aa32_max_features(ARMCPU *cpu);
 bool arm_singlestep_active(CPUARMState *env);
+bool arm_generate_debug_exceptions(CPUARMState *env);
 
 #endif
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 1abf41c5f8..20a0e4261a 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -12,6 +12,100 @@
 #include "exec/helper-proto.h"
 
 
+/* See AArch64.GenerateDebugExceptionsFrom() in ARM ARM pseudocode */
+static bool aa64_generate_debug_exceptions(CPUARMState *env)
+{
+    int cur_el = arm_current_el(env);
+    int debug_el;
+
+    if (cur_el == 3) {
+        return false;
+    }
+
+    /* MDCR_EL3.SDD disables debug events from Secure state */
+    if (arm_is_secure_below_el3(env)
+        && extract32(env->cp15.mdcr_el3, 16, 1)) {
+        return false;
+    }
+
+    /*
+     * Same EL to same EL debug exceptions need MDSCR_KDE enabled
+     * while not masking the (D)ebug bit in DAIF.
+     */
+    debug_el = arm_debug_target_el(env);
+
+    if (cur_el == debug_el) {
+        return extract32(env->cp15.mdscr_el1, 13, 1)
+            && !(env->daif & PSTATE_D);
+    }
+
+    /* Otherwise the debug target needs to be a higher EL */
+    return debug_el > cur_el;
+}
+
+static bool aa32_generate_debug_exceptions(CPUARMState *env)
+{
+    int el = arm_current_el(env);
+
+    if (el == 0 && arm_el_is_aa64(env, 1)) {
+        return aa64_generate_debug_exceptions(env);
+    }
+
+    if (arm_is_secure(env)) {
+        int spd;
+
+        if (el == 0 && (env->cp15.sder & 1)) {
+            /*
+             * SDER.SUIDEN means debug exceptions from Secure EL0
+             * are always enabled. Otherwise they are controlled by
+             * SDCR.SPD like those from other Secure ELs.
+             */
+            return true;
+        }
+
+        spd = extract32(env->cp15.mdcr_el3, 14, 2);
+        switch (spd) {
+        case 1:
+            /* SPD == 0b01 is reserved, but behaves as 0b00. */
+        case 0:
+            /*
+             * For 0b00 we return true if external secure invasive debug
+             * is enabled. On real hardware this is controlled by external
+             * signals to the core. QEMU always permits debug, and behaves
+             * as if DBGEN, SPIDEN, NIDEN and SPNIDEN are all tied high.
+             */
+            return true;
+        case 2:
+            return false;
+        case 3:
+            return true;
+        }
+    }
+
+    return el != 2;
+}
+
+/*
+ * Return true if debugging exceptions are currently enabled.
+ * This corresponds to what in ARM ARM pseudocode would be
+ *    if UsingAArch32() then
+ *        return AArch32.GenerateDebugExceptions()
+ *    else
+ *        return AArch64.GenerateDebugExceptions()
+ * We choose to push the if() down into this function for clarity,
+ * since the pseudocode has it at all callsites except for the one in
+ * CheckSoftwareStep(), where it is elided because both branches would
+ * always return the same value.
+ */
+bool arm_generate_debug_exceptions(CPUARMState *env)
+{
+    if (env->aarch64) {
+        return aa64_generate_debug_exceptions(env);
+    } else {
+        return aa32_generate_debug_exceptions(env);
+    }
+}
+
 /*
  * Is single-stepping active? (Note that the "is EL_D AArch64?" check
  * implicitly means this always returns false in pre-v8 CPUs.)
-- 
2.34.1

