Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1803713lfb;
        Mon, 6 Jun 2022 19:50:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoIiDf6WpP5CaYzJbjYeMk0VA5o5bDUrbucC0H+rWt6FYVgtNy1eFGqtJpcBWP1cFU8s0J
X-Received: by 2002:a05:6214:dae:b0:467:daa4:62d5 with SMTP id h14-20020a0562140dae00b00467daa462d5mr15916289qvh.34.1654570254960;
        Mon, 06 Jun 2022 19:50:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654570254; cv=none;
        d=google.com; s=arc-20160816;
        b=Hc0aSbZdSrgu0NSKUwT5pzuijhx9hbqOQl+Id88/X1UvKNykA6rzZaarFZxYaj1mQh
         +kKCdknvC58D7FsnUFAq9UVTaUTluA4+LIbqqUT9Wim2i3vSlndHAOCj9yY2b+xKlJXe
         MUi4Hr5N+FrmJrfjHYcZ2eA03IIa1C1qN22II0kZwD4i8JWw+M5f0GPnl2gMR4Z53E80
         9r6luU+xncXJlp8LVBqVWTd5js03eSJ0/3PKFrIEZl9hZqdSdig+/f1Y61yGswCnMi87
         dUZUDR2jsMqabRYDQ8DvUUkOOg83PlcAHWb/qzDJcWa5cSBuLU/DkHydkOQ1Vso0BG0A
         OLJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=agb1KQVoHZp1Dq8M4FnweXRLwX+H5ZfT4A8G1UBDOMI=;
        b=dcEd69bB6F2l2UFy35WjXIP4ZT3kX3QSMKCfPszo5n58456z87D6U85vjcr8InLDjK
         bEiKTLhTLWO8zHm853qTRJeLpEEp/fJXsFDXfvv0YD66FJptbuYAqVFaCJqZF8ANUSQr
         f73mCAcFkSxViuboIuLHSF8eCKHD4QGl0gURP00PzLhUIsbdzzI7zxKOryjGnsctkCCV
         swrGRF3a2HPR/is70w8dZ+HNgZqAyp5VBxcqpEOVsGZUG8C49nK80Q+q5IyMqIaQ4I2P
         iV8peRTrtwc2+eqrlAPyDX85DkiPy9olRP4t0V4AAHd1YtIb7YDhvwzMeugrELdhiFsD
         VOVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jYeLSqS+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1-20020a0562140d4100b0046b92fb3f43si2817338qvr.393.2022.06.06.19.50.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 19:50:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jYeLSqS+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyPJ0-0004og-Dl
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 22:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFy-0006j7-CL
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:46 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:33039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFu-0000I5-4B
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:46 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 hv24-20020a17090ae41800b001e33eebdb5dso12957024pjb.0
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 19:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=agb1KQVoHZp1Dq8M4FnweXRLwX+H5ZfT4A8G1UBDOMI=;
 b=jYeLSqS+g7PJMp1Mv5FijSCvEE6kJLKqb28Yi6p5Y/ymIYsM7tKiavSEkODNXzGtjv
 F7VNthw7UfWuAlG0UfSFmy3MiLlJiYMOZ801Mlf3SiD9wHcFW5m9IPktfDUbCgq3jiye
 hRePyG224+ks1YteJMFoBLGolZZSDHhQv+5g8In/sIOOd49bqZqxmK9iMHG7m8Cy8N/t
 1aGUsFMx5NqSrJNdyHZmYkGVhhQBgSsCuBOXp2IorYH23KW5/FuwsSyppd8QC9g0s8PQ
 2fOX96NVmm+lrJRiX+I4zsQYiDtX8pHUuVYvS3mbUnK9yKys50hOFiLNNBLxT7KrcB56
 cImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=agb1KQVoHZp1Dq8M4FnweXRLwX+H5ZfT4A8G1UBDOMI=;
 b=IY741W29ClKZl+Pi8EMurvTktdTjYp5rzmaiAn89mGsLVK0LTZr2adVI/XXdHgCwAk
 zYWrX5mvmF0NSjLLd5313Q+PjpRLp9qIK+8jFiN704KT0WZBde9icrAzPYjC3SL50ixK
 HsDYj1T+6xa6cufwhqwB5cspC5HHwhSHX1d4LMZISp8scKMJQAoL9/idYUCT8sC+C81H
 WYAkQzk4q6BnTZhbOpgnaDSUILyMe/M/fssgqtPx/0EUbNpd1G4U8PmnDnAv7BwkKaS9
 EOcVcEcEojdyMzIvJCK66Cz+157eyajee9ZO1Euk3YQsX/VTgyIOpAEEEmTC6cqAiy4p
 Nb6A==
X-Gm-Message-State: AOAM530fEbteZIM6u2mfz/a4fTBvxkTbIYsDa6GvCwWytEqbchKvgqC0
 xZA8rI+LaksPfTvQtDFJqPnU5g==
X-Received: by 2002:a17:90a:c7cf:b0:1e8:2b77:7835 with SMTP id
 gf15-20020a17090ac7cf00b001e82b777835mr23491945pjb.109.1654570060715; 
 Mon, 06 Jun 2022 19:47:40 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 06/25] target/arm: Move arm_generate_debug_exceptions out
 of line
Date: Mon,  6 Jun 2022 19:47:15 -0700
Message-Id: <20220607024734.541321-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
X-TUID: bNdwISDnujTP

Move arm_generate_debug_exceptions and its two subroutines,
{aa32,aa64}_generate_debug_exceptions into debug_helper.c,
and the one interface declaration to internals.h.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index 148f2a9252..e9ac54f244 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1316,5 +1316,6 @@ void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
 void aa32_max_features(ARMCPU *cpu);
 int exception_target_el(CPUARMState *env);
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

