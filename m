Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1017281wrm;
        Fri, 11 Oct 2019 09:00:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx/8vbmNsdRAvoxiXGRJDHEnUaBmy3KPVZ1CHX1TTwCT73jZ/UbS1Yv/2gaP9xmSwUw/p4Q
X-Received: by 2002:a05:620a:693:: with SMTP id f19mr16533590qkh.476.1570809626443;
        Fri, 11 Oct 2019 09:00:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570809626; cv=none;
        d=google.com; s=arc-20160816;
        b=CzDssnGpbOntc9dc4OlnFZIBD9MHgbzXqQSe+iflyXx3B3p3e98EaGs3V8h5/x3+rz
         4e65lAGjZanM6Zf+ccOoyUZAi7Sj/ERIF2pWeaSq6DIFLVQ7pRQHVY3WSPEl8zecN9dO
         3YQgiUjSR6lsxlDeVUaua9azNxVsMHP0BcFzWFvbfUr3whe1sRb44RvuajkJbrJs0J3j
         LgMdhkWi/mZv5aJorBGyth/SJDrVi80O4SagyqGvqRTtjrrI5ROeYJ1LhDXVgE0wks2k
         Ra66bp2Qr9uW/jALMu75sWWzDAdeknkAWylfMTj+dN4xOBr/vpPg5ErykFHkNlWrEmEc
         6PJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=c+8xcuNKYkwsEhklvjvEYe1RYCMD1KcRe25MPQQBSq8=;
        b=SAwVUXS+NuLl5pIy4+xun9/xpqoqTc/jnA2pnXz+klFdtRZRO+DnVP2K+5xOyhGCaw
         p6Zc4LD7+GYnCm+/kI5iKLjXt44au3PwmLTFsKR2SDzHc9dvwcXbDsOPC/BPW7cDeSGZ
         M8YYMCFQADTtG2rr/EaaZ0SzX1dqpgRlkmPgQyqN9x45gLeg1Tq0Sd+Jq2wWKyA2glWF
         hgoVZQoRhcMUkCKGlRnxN8Wka6h3GnujK9Wx+J4aVg1sMDuIOa0n//VT70AW2L4KWO7s
         U0MveNadHGcUT4sR7Fov5cYC2J4xMyEUgxpeWRilV65Cc+qPA86cyj8r5WRg3kptP6xk
         o7zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EFGmjcZB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7si9406006qkk.38.2019.10.11.09.00.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 09:00:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EFGmjcZB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIxL7-0007Wr-Qs
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 12:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33640)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGn-0002Je-78
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 11:55:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGm-0007dH-0u
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 11:55:57 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:37865)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIxGl-0007cq-TP
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 11:55:55 -0400
Received: by mail-yb1-xb43.google.com with SMTP id z125so3257380ybc.4
 for <qemu-devel@nongnu.org>; Fri, 11 Oct 2019 08:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=c+8xcuNKYkwsEhklvjvEYe1RYCMD1KcRe25MPQQBSq8=;
 b=EFGmjcZBYfaRZyaTq4EUFZ/QHAoIHEWxPWzH0qshXZS97PkSg946D6PyJNd41xoAli
 BvFS+tshdZ/7+NLhGyxhScRbgs7DkzG8AkYxqMUBao2btz76El5F6DIr93Bt6l58W1to
 Slkj6q/c1xavGytbX8LT222uQIvyGAETylbat/7pYr6I+Fd3XlQPepe0C+7pS+OOETd+
 u/k7LzhL5FnilDhL/vblXFofZ0Wlzd8T8mnR0r4tbWbAoMDZ156eDYy678sW99l+KO8P
 Kz5IJJ75IhIRQHCiZi+jFrvEnCL4fcVXmS2+i0NQCV1FpsN6YgcoD14pq/J8Oz8fCQJs
 bLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=c+8xcuNKYkwsEhklvjvEYe1RYCMD1KcRe25MPQQBSq8=;
 b=c9aghsI5DV72HIe+pIOaOLF2WZR07wTob7jKBKPINNqVF6MyHBRfIg4qr8jhGjX1H9
 KDKRVAhOEpQA9E2+n9DyvxdjLVE1Bxm3QYunZ6rWFDdQxZ6yzpSb4Bi1qFzGaKSQLvV4
 4TqBSzcwQCCDffeYkHGAGvOuXvNIez6BEXs51UiBIp8OSoQtlsO2s8pTGtqhDZXUCMSF
 FdfCYExlaer/szprgXUp6tG2GJjh3cAaHwLM/xbKgvaYEReZG0sXLpAKnFpiojHJFIcH
 fuMeS/Zd48BMUe4SMIv/gz1evvwUMjgYBMB3ngJRtJSfacqiGSksQ/b9/uU3vLJrtqkd
 QQDw==
X-Gm-Message-State: APjAAAUm7aivkMzDFQXZSHEklWo1wYu1SRnrfhfQ011vuTwISPv+Y2Kd
 2sjg9VAxrPlvhhp7sp1cFXWkX4smKoo=
X-Received: by 2002:a25:bc04:: with SMTP id i4mr9790376ybh.427.1570809354942; 
 Fri, 11 Oct 2019 08:55:54 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id d17sm2473139ywb.95.2019.10.11.08.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 08:55:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 06/20] target/arm: Reduce tests vs M-profile in
 cpu_get_tb_cpu_state
Date: Fri, 11 Oct 2019 11:55:32 -0400
Message-Id: <20191011155546.14342-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011155546.14342-1-richard.henderson@linaro.org>
References: <20191011155546.14342-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b43
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0h0GrhpeKGPv

Hoist the computation of some TBFLAG_A32 bits that only apply to
M-profile under a single test for ARM_FEATURE_M.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 49 +++++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 26 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d4303420da..296a4b2232 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11194,6 +11194,29 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
 
         if (arm_feature(env, ARM_FEATURE_M)) {
             flags = rebuild_hflags_m32(env, fp_el, mmu_idx);
+
+            if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
+                FIELD_EX32(env->v7m.fpccr[M_REG_S], V7M_FPCCR, S)
+                != env->v7m.secure) {
+                flags = FIELD_DP32(flags, TBFLAG_A32, FPCCR_S_WRONG, 1);
+            }
+
+            if ((env->v7m.fpccr[env->v7m.secure] & R_V7M_FPCCR_ASPEN_MASK) &&
+                (!(env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK) ||
+                 (env->v7m.secure &&
+                  !(env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK)))) {
+                /*
+                 * ASPEN is set, but FPCA/SFPA indicate that there is no
+                 * active FP context; we must create a new FP context before
+                 * executing any FP insn.
+                 */
+                flags = FIELD_DP32(flags, TBFLAG_A32, NEW_FP_CTXT_NEEDED, 1);
+            }
+
+            bool is_secure = env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
+            if (env->v7m.fpccr[is_secure] & R_V7M_FPCCR_LSPACT_MASK) {
+                flags = FIELD_DP32(flags, TBFLAG_A32, LSPACT, 1);
+            }
         } else {
             flags = rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
         }
@@ -11233,32 +11256,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         }
     }
 
-    if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
-        FIELD_EX32(env->v7m.fpccr[M_REG_S], V7M_FPCCR, S) != env->v7m.secure) {
-        flags = FIELD_DP32(flags, TBFLAG_A32, FPCCR_S_WRONG, 1);
-    }
-
-    if (arm_feature(env, ARM_FEATURE_M) &&
-        (env->v7m.fpccr[env->v7m.secure] & R_V7M_FPCCR_ASPEN_MASK) &&
-        (!(env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK) ||
-         (env->v7m.secure &&
-          !(env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK)))) {
-        /*
-         * ASPEN is set, but FPCA/SFPA indicate that there is no active
-         * FP context; we must create a new FP context before executing
-         * any FP insn.
-         */
-        flags = FIELD_DP32(flags, TBFLAG_A32, NEW_FP_CTXT_NEEDED, 1);
-    }
-
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        bool is_secure = env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
-
-        if (env->v7m.fpccr[is_secure] & R_V7M_FPCCR_LSPACT_MASK) {
-            flags = FIELD_DP32(flags, TBFLAG_A32, LSPACT, 1);
-        }
-    }
-
     if (!arm_feature(env, ARM_FEATURE_M)) {
         int target_el = arm_debug_target_el(env);
 
-- 
2.17.1

